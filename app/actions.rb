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
