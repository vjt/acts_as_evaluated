require 'evaluator'
require 'super_struct'

module ActsAsEvaluated
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_evaluated
      serialize :expression

      class_eval do
        def evaluate id
          @expression ||= self.expression
          raise ActiveRecord::ActiveRecordError, "expression missing" unless @expression.is_a? Expression
          @expression.evaluate id
        end
      end
    end
  end

  class Expression < SuperStruct(:formula, :variables)
    @@driver = BooleanExpressionDriver.new

    def evaluate room_id
      @@driver.evaluate @formula, self.class.compute(@variables, room_id)
    end

    def self.evaluate room_id, formula, variables = []
      @@driver.evaluate formula, compute(variables, room_id)
    end

    def inspect
      "#<expression formula=#@formula, variables=#{@variables.map(&:inspect).join ' '}>"
    end

    protected
      def self.compute variables, room_id
        variables.inject({}) do |hash, var|
          hash.update(var.name => var.evaluate(room_id))
        end
      end
  end

  module Variable
    class Static < SuperStruct(:name, :argument, :expression, :fallback)
      def evaluate room_id
        if @expression and not @expression.evaluate(room_id)
          @fallback
        else
          value room_id
        end
      end

      def inspect
        s = "#<#{self.class.to_s.demodulize} variable '#@name' arg=#{@argument.inspect}"
        s << " expr=#{@expression.inspect} fb=#{@fallback.inspect}" if @expression
        s << '>'
      end

      protected
        def value room_id
          @argument
        end
    end

    class Room < Static
      protected
        def value room_id
          room = ::Room.find room_id
          raise RuntimeError, "unknown attribute #@argument" unless room.respond_to? @argument
          room.send @argument
        end
    end

    class Value < Static
      protected
        def value room_id
          definition = ::RoomValueDefinition.find(@argument)
          if definition.respond_to? :evaluate
            definition.evaluate room_id
          else
            v = ::RoomValue.find_by_room_id_and_definition_id(room_id, @argument)
            if v then v.value else 0 end
          end
        end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsEvaluated
