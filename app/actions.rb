# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do
  erb :login 
end

get '/signup' do
  erb :signup
end 

get '/profile' do
  erb :profile
end

post '/login' do
  redirect '/profile'
end

post '/signup' do
  redirect '/profile'
end

post '/profile' do
  redirect '/profile'
end
