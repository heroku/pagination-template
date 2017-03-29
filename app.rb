module API
  autoload :Config,    "app/config"
  autoload :Endpoints, "app/endpoints"
  autoload :Loader,    "app/loader"
  autoload :Models,    "app/models"
  autoload :Web,       "app/web"

  def self.load!(env = nil)
    return if @loaded
    @loaded = true
    $LOAD_PATH << __dir__
    Loader.load! env
  end
end
