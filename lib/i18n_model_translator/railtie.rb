require 'i18n_model_translator'
require 'rails'
module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :i18n_model_translator

    rake_tasks do
      load "tasks/i18n_model_translator.rake"
    end
  end
end