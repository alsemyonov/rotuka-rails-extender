require 'rotuka/active_record/base'
require 'rotuka/active_record/validations'
require 'rotuka/active_record/urls_cleaner'

ActiveRecord::Base.class_eval do
  include Rotuka::ActiveRecord::Base
  include Rotuka::ActiveRecord::Validations
  include Rotuka::ActiveRecord::UrlsCleaner
end

ActiveRecord::Base.send(:extend, UrlsCleaner::ActMethods)
class ActiveRecord::Errors
  @@default_error_messages = {
    :inclusion => "не в списке",
    :exclusion => "зарезервировано, выберите другое значение",
    :invalid => "неверное значение",
    :confirmation => "не равно поддтверждению",
    :accepted  => "должно быть отмечено",
    :empty => "не может быть пустым",
    :blank => "не может быть пустым",
    :too_long => "слишком длинно (максимум %d знаков)",
    :too_short => "слишком коротко (минимум %d знаков)",
    :wrong_length => "неправильной длинны (должно быть %d знаков)",
    :taken => "уже занято",
    :not_a_number => "не число",
    :greater_than => "должно быть больше %d",
    :greater_than_or_equal_to => "должно быть больше или равно %d",
    :equal_to => "должно быть равно %d",
    :less_than => "должно быть меньше %d",
    :less_than_or_equal_to => "должно быть меньше или равно %d",
    :odd => "должно быть нечётно",
    :even => "должно быть чётно"
  }
end

