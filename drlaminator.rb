require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'haml'
require 'sass'

class DrLaminator < Sinatra::Base
  register Sinatra::AssetPack
  helpers Sinatra::ContentFor
  register Sinatra::Reloader if self.development?

  assets do
    serve '/images', from: 'images'
    serve '/css', from: 'css'

    css :application, [
        '/css/*.css'
    ]

    css_compression :sass
  end

  get '/' do
    haml :index, format: :html5
  end
end
