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
        def has_clean_urls
          extend  Rotuka::ActiveRecord::UrlsCleaner::ClassMethods
          include Rotuka::ActiveRecord::UrlsCleaner::InstanceMethods
        end
      end
      
      # Методы класса, поддерживающего ЧПУ
      module ClassMethods
        # Производит поиск по ЧПУ
        def find_by_url(url)
          find :first, [
              "id = :url OR slug = :url",
              { :url => url }
            ]
        end
      end
      
      # Методы объекта, поддерживающего ЧПУ
      module InstanceMethods 
        # возвращает ЧПУ-идентификатор для объекта
        def url
          self.slug || self.id
        end

        # Устанавливает 'slug' для объекта
        def url=(new_slug)
          self.slug = new_slug
        end
      end    
    end
  end
end
