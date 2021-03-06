require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railsapps
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
        #cors configuration
        config.middleware.insert_before 0, Rack::Cors do
          allow do
            origins '*'
            resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options]
          end
        end

  #autoloads lib folder during production
  config.eager_load_paths << Rails.root.join('lib')

  #autoloads lib folder during development
  config.autoload_paths << Rails.root.join('lib')


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.api_only = false
    config.middleware.use ActionDispatch::Flash
  end
end
