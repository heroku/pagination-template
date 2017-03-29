module API
  module Config
    extend self

    def environment
      ENV.fetch("ENVIRONMENT", "development")
    end

    def port
      ENV.fetch("PORT", 5000).to_i
    end

    def puma_threads
      [ 1, 1 ]
    end

    def puma_workers
      1
    end

    def database_url
      ENV.fetch("DATABASE_URL") { env_based_local_db_url }
    end

    def root
      @root ||= Pathname.new(File.expand_path("../..", __FILE__))
    end

    def check!
      instance_methods.grep_v(/[?!=]/).each do |method_name|
        begin
          public_send method_name
        rescue KeyError
          raise KeyError, "Config value #{method_name} is missing"
        end
      end
    end

    private

    def env_based_local_db_url
      "postgres://localhost/pagination-starter-#{environment}"
    end
  end
end
