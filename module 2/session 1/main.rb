require 'sinatra'
require_relative 'config'

get '/' do
  'This is the home page. You will see this if you don\'t specify any specific route.'
end

get '/messages' do
  erb :message, locals: {
    name: 'Syukur',
    color: 'DodgerBlue'
  }
end

get '/login' do 
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Logged in!'
  else
    redirect '/login'
  end
end

get '/items/new' do
  erb :items_form
end

post '/items' do
  # return true if the parameter is empty
  if params.empty?
    return 'please input some'
  else
    # return items_list.erb file with their params
    return erb :items_list, params
  end
end
