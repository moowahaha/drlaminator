require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'haml'
require 'sass'

class DrLaminator < Sinatra::Base
  ETSY_URL = 'https://www.etsy.com/listing/211052681/custom-laminated-helvetica-message'

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

  get '/testimonials' do
    haml :testimonials, format: :html5
  end
end
