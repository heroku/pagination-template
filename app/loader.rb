module API
  module Loader
    extend self

    def load!(env)
      load_env env
      load_stdlib
      validate_config
      load_gems
      load_custom_gems
      load_initializers
    end

    private

    def load_stdlib
      require "pathname"
      require "json"
    end

    def load_env(env)
      require "dotenv"
      Dotenv.load ".env"
      Dotenv load ".env.#{env}" if env
    end

    def validate_config
      API::Config.check!
    end

    def load_gems
      require "bundler/setup"
      Bundler.require *bundler_namespaces
    end

    def load_custom_gems
      require "active_support/all"
      require "active_support/core_ext"
      require "active_record"
    end

    def load_initializers
      load_glob "config/initializers/**/*"
    end

    def bundler_namespaces
      [ :default, API::Config.environment ].compact.map(&:to_sym)
    end

    def load_glob(path)
      Dir[API::Config.root.join(path)].each &method(:load)
    end
  end
end
