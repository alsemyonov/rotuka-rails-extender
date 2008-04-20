module Rotuka
  module ActiveRecord
    module Base
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods        def all(*args)
          find(:all, *args)
        end

        def [](id)
          find(id)
        end
      end
    end # ends of Base
  end # ends of ActiveRecord
end # ends of Rotuka

