# Homepage (Root path)
require 'pry'

# allows for reusable, convenient methods 
# from anywhere in our actions.rb or any view
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

get '/logout' do
  session[:user_id] = nil #essentially session.clear
  redirect '/'
end

# create new pin object
get '/pins/new' do
 erb :new_pin
end

get '/pins/:id' do
  @pin = Pin.find_by(params[:id])
  erb :pins
end

get '/profile/edit' do
  current_user
  erb :profile
end






# END GETS
# BEGIN POSTS









post '/login' do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email, password: password)
  if user && (user.password == password)
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
  email = params[:email]
  
  user = User.new(username: username, password: password, firstname: firstname, lastname: lastname, gender: gender, birthday: birthday, email: email)

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    erb :signup
  end
end

post '/profile' do
  redirect '/'
end

# post from the get route to create new object
# from params
post '/pins/new' do
  title = params[:title]
  summary = params[:summary]

  pin = Pin.find_by(title: title)
    if pin
      redirect "/pins/#{pin.id}"
    else
      new_pin = Pin.new(title: title, summary: summary)
      redirect '/'
    if new_pin.save
      redirect "/pin;/#{new_pin.id}"
    else
      erb :new_pin
  end
end

post '/pins/:id/'
  pins = Pin.find(params[:id])
  pin.comments.create user_id:
  current_user.id, body: params[:body]
  erb /pins/:id
end

post '/pins/:id/comments/new' do
  summary = params[:summary]
  pin = Pin.find(params[:id])
  pin.comment.create(summary: summary)
  redirect "/pins/#{pin.id}"
end

post '/profile/edit' do
  firstname = params[:firstname]
  lastname = params[:lastname]
  email = params[:email]
  password = params[:password]
  birthday = params[:birthday]

  current_user.update firstname: firstname, lastname: lastname, email: email, password: password, birthday: birthday
  redirect '/'

end
  

# 2015.11.18
# Added logout method
# Modified signup method (simplified)
# Added login messaging in layout.erb
# modified "new"
# added Pin get + post
# added comment functionality (untested)
# modified comments to only have 'summary'
