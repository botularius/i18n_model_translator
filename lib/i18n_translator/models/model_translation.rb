require 'fileutils'

module I18nTranslator
  module Models
    module ModelTranslation
      class << self

        def generate_model_translation(model, locale)
          active_record_hash = {active_record: {}}
          names = generate_model_names(model)
          attributes = generate_model_attributes(model)
          active_record_hash[:active_record].merge!(names)
          active_record_hash[:active_record].merge!(attributes)
          {locale.to_sym => active_record_hash}.deep_stringify_keys.psych_to_yaml
        end

        def write_model_translation(model, locale)
          content = generate_model_translation model, locale
          write_to_file model, locale, content
        end

        def print_all_model_translations(locale)
          load_models.each do |model|
            puts generate_model_translation(model, locale)
          end
        end

        def write_all_model_translations(locale)
          load_models.each do |model|
            write_model_translation model, locale
          end
        end

        private

        def generate_model_names(model)
          model_name = model.to_s.tableize.split('/').last
          {models: {model.to_s.tableize.singularize.to_sym => {
              one: model_name.singularize.humanize,
              other: model_name.pluralize.humanize
          }}}
        end

        def generate_model_attributes(model)
          hash = {}
          exclude = %w[id created_at updated_at]
          (model.column_names - exclude).each do |column_name|
            hash.merge!({
                            column_name.to_sym => column_name.humanize
                        })
          end
          {attributes: {model.to_s.tableize.singularize.to_sym => hash}}
        end

        def load_models
          Rails.application.eager_load!
          models = ActiveRecord::Base.descendants
          models.delete([ActiveRecord::SchemaMigration])
          models.reject! { |model| model.name.include?('HABTM') | !model.table_exists? }
        end

        def write_to_file(model, locale, content)
          path = "#{Rails.root}/config/locales/models/#{model.to_s.tableize.singularize}/#{locale}.yml"
          unless File.exist?(path)

            # create directories
            dirname = File.dirname(path)
            unless File.directory?(dirname)
              FileUtils.mkdir_p(dirname)
            end

            # write to file
            File.open(path, 'w') { |file| file.write(content) }
          end
        end
      end
    end
  end
end