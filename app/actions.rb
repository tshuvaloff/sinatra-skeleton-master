# Homepage (Root path)

helpers do

  def current_user
    @current_user = User.find_by(id: session[user_id]) if session [:user_id]
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

get '/pins/new' do
  erb :new_pin
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
  username = params[:username]
  password = params[:password]
  firstname = params[:firstname]
  lastname = params[:lastname]
  gender = params[:gender]
  birthday = params[:birthday]


  user = User.find_by(username: username)
  if user
    redirect '/signup'
  else
    user = User.create(username: username, password: password, firstname: firstname, lastname: lastname, gender: gender, birthday: birthday)
    session[:user_id] = user.id
    redirect '/'
  end
end

post '/profile' do
  redirect '/'
end
