require 'sinatra/base'
require 'sinatra/assetpack'

class DrLaminator < Sinatra::Base
  register Sinatra::AssetPack

  get '/' do
    'sup'
  end
end
