require 'rotuka/core_ext/hash'

require 'rotuka/active_record/base'
require 'rotuka/active_record/errors'
require 'rotuka/active_record/urls_cleaner'
require 'rotuka/active_record/validations'

ActiveRecord::Base.class_eval do
  include Rotuka::ActiveRecord::Base
  include Rotuka::ActiveRecord::Validations
  include Rotuka::ActiveRecord::UrlsCleaner
end

