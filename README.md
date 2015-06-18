# I18nModelTranslator

Gem that generates i18n model translations for existing models. If you have descriptive column names in english it will generate the following files for your models:
config/locales/models/model_name/en.yml

This is an example outcome:

```
en:
  active_record:
    models:
      webinar_presenter:
        one: Webinar presenter
        other: Webinar presenters
    attributes:
      webinar_presenter:
        webinar_id: Webinar
        presenter_email: Presenter email
        presenter_url: Presenter url
        user_id: User
        entry_time: Entry time
        exit_time: Exit time
        screen_name: Screen name
        attended_minutes: Attended minutes
```

It skips the columns :id, :created_at and :updated_at.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n_model_translator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_model_translator

## Usage


This gem gives you four rake tasks to create the model i18ns:

####Print a specific model i18n. Pass the model name as parameter:

    $ rake i18n_model_translator:print_model[model]

####Prints all model (except HABTM) i18ns:

    $ rake i18n_model_translator:print_all_models

####Print a specific model i18n directly to the file 'config/locales/models/model_name/en.yml'. Pass the model name as parameter. It will not override existing files:

    $ rake i18n_model_translator:print_model_to_file[model]

####Print i18ns for each model directly to the file 'config/locales/models/model_name/en.yml'. It will not override existing files:

    $ rake i18n_model_translator:print_all_models_to_file[model]

## Attention ZSH Users

You need to escape the `[` and `]` like this:

    $ rake i18n_model_translator:print_model\[model\]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/i18n_model_translator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
