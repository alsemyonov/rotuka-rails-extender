module Rotuka
  module ActiveRecord
    module Base
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def [](id)
          find(id)
        end
      end
    end # ends of Base
  end # ends of ActiveRecord
end # ends of Rotuka

