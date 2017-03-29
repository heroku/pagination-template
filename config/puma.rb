require "./app"
API.load!

threads *API::Config.puma_threads
workers API::Config.puma_workers
port API::Config.port
preload_app!
