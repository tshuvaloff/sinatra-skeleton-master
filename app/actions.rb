# Homepage (Root path)

helpers do

  def current_user
    @current_user = User.find_by(id: session[user_id] if session [:user_id])
  end

end

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
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user.password == password
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

post '/signup' do
  redirect '/'
end

post '/profile' do
  redirect '/'
end
