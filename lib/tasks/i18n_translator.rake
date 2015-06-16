namespace :i18n_translator do

  require 'i18n_translator/models/model_translation'

  desc 'prints out the locale for one specific model'
  task :print_model, [:model] => :environment do |t, args|
    puts I18nTranslator::Models::ModelTranslation.generate_model_translation(args[:model].constantize, :en)
  end

  desc 'prints out the model locale for the given model into /config/locales/models/model_name/en.yml'
  task :print_model_to_file, [:model] => :environment do |t, args|
    I18nTranslator::Models::ModelTranslation.write_model_translation(args[:model].constantize, :en)
  end

  desc 'prints out the locales for each model in the environment'
  task :print_all_models => :environment do |t, args|
    I18nTranslator::Models::ModelTranslation.print_all_model_translations :en
  end

  desc 'prints out all model locale into /config/locales/models/model_name/en.yml'
  task :print_all_models_to_file => :environment do |t, args|
    I18nTranslator::Models::ModelTranslation.write_all_model_translations :en
  end

end