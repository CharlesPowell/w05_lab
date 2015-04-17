require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter =>  'postgresql',
  :database => 'user_db'
)



require './models/user.rb'
require './models/chirp.rb'

get '/' do
  erb :index
end

get '/api/users' do
    content_type :json
    users = User.all
    users.to_json
end

get '/api/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.to_json
end

post '/api/users' do
    content_type :json
    user = User.create(params[:user])
    user.to_json
end

put '/api/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.update(params[:user])
    user.to_json
end

patch '/api/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.update(params[:user])
    user.to_json
end

delete '/api/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.destroy
end

get '/api/users/:user_id/chirps' do
    content_type :json
    chirps = Chirp.find_by(user_id: params[:user_id])
    chirps.to_json
end

get '/api/users/:user_id/chirps/:id' do
    content_type :json
    chirp = Chirp.find(params[:id])
    chirp.to_json
end

post '/api/users/:user_id/chirps' do
    content_type :json
    chirp = Chirp.create(params[:chirp])
    user = User.find(params[:user_id])
    #user.chirps << chirp
    chirp.to_json
end

put '/api/users/:user_id/chirps/:id' do
  content_type :json
  chirp = Chirp.find(params[:id])
  chirp.update(params[:chirp])
  chirp.to_json

end

patch '/api/users/:user_id/chirps/:id' do
    content_type :json
    chirp = Chirp.find(params[:id])
    chirp.update(params[:chirp])
    chirp.to_json
end

delete '/api/users/:user_id/chirps/:id' do
    content_type :json
    chirp = Chirp.find(params[:id])
    chirp.destroy
end
