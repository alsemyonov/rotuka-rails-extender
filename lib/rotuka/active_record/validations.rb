module Rotuka
  module ActiveRecord
    module Validations
      EMAIL_FORMAT = /^([^@\s]+)@((?:[-a-zA-Z0-9]+\.)+[a-zA-Z]{2,})$/

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods        def validates_email(*attr_names)
          options = { :with => EMAIL_FORMAT }
          options.update(attr_names.pop) if attr_names.last.is_a?(Hash)
          attr_names.push(options)

          validates_format_of(*attr_names)
        end
      end      
    end # ends of Validations
  end # ends of ActiveRecord
end # ends of Rotuka

