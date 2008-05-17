module Rotuka
  module ActiveRecord
    # Поддержка ЧПУ
    module UrlsCleaner
      def self.included(base)
        base.extend(ActMethods)
      end
      
      # Расширение ЧПУ для ActiveRecord::Base
      module ActMethods
        # Добавляет к классу удобные методы для ЧПУ
        # Необходимо поле 'slug'
        def has_clean_urls(slug_field = 'slug', modifiable = true)
          url_cleaner = <<-end_src
            # Производит поиск по ЧПУ
            def self.find_by_url(url)
              obj = find_by_id(url.to_i) || find_by_#{slug_field}(url)
              raise ::ActiveRecord::RecordNotFound if obj.nil?
              obj
            end

            # возвращает ЧПУ-идентификатор для объекта
            def url
              #{slug_field} || id
            end
          end_src
          class_eval url_cleaner, __FILE__, __LINE__
          
          if modifiable
            alias_method :"#{slug_field}", :url=
          end
        end
      end
    end
  end
end
