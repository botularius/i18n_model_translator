require 'i18n_translator/version'

module I18nTranslator
  require 'i18n_translator/railtie' if defined?(Rails)
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :model_locale_path, :translation_source_locale, :locales

    def initialize
      @model_locale_path = 'config/locales/models'
      @translation_source_locale = I18n.default_locale
      @locales = I18n.available_locales rescue []
    end
  end
end
