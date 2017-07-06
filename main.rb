
# require 'pry'     
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/stock'

enable :sessions

helpers do
  def logged_in?
    current_user ? true : false
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def get_quote 
    # @stock = params[:stock]
    exchange = "http://data.asx.com.au/data/1/share/#{@stock}/"
    @parsed = HTTParty.get(exchange).parsed_response
    @quote = "$#{@parsed['last_price']}"
  end

  def untrack
    Stock.delete(@stock)
  end
end  

get '/' do
  if params[:stock] != nil
  @stock = params[:stock].upcase
  get_quote
  end
  @tracked = Stock.where(user_id: session[:user_id])
  erb :index
end

post '/' do
  @track = Stock.create(stock_code: params[:track], user_id: session[:user_id])
  redirect '/'
end

get '/tracker' do
  @tracked = Stock.where(user_id: session[:user_id])
  erb :tracker
end

delete '/tracker' do
  @stock = params[:id]
  untrack
  redirect '/tracker'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.create(name: params[:name], email: params[:email], password: params[:password])
  redirect '/'
end

get '/edit_user' do
  erb :edit_user
end

# patch '/edit_user' do
#   @user = User.find(session[:user_id])
#   # @user.name = params[:name]
#   # @user.email = params[:email]
#   # @user.password = params[:password]  
#   # @user.save
#   redirect '/'
# end

delete '/edit_user' do
# delete user & tracker
  @user = User.find(session[:user_id])
  User.delete(@user['id']) 
  # @tracker = Stock.where(user_id: session[:user_id])
  Stock.where(user_id: session[:user_id]).destroy_all
  redirect '/'
end

get '/login' do
  erb :login
end

post '/session' do
  user = User.find_by(email: params[:email]) 

  if user && user.authenticate(params[:password])
  session[:user_id] = user.id
  redirect '/'
  else     
    erb :login
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/'
end
