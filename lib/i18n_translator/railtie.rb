require 'i18n_translator'
require 'rails'
module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :i18n_translator

    rake_tasks do
      load "tasks/i18n_translator.rake"
    end
  end
end