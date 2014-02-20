enable :sessions

post '/' do
  if (user = User.find_by(email: params[:email])) && user.password == ENCODER.encrypt(params[:password])
    session[:message] = "logged in"
    session[:user_id] = user.id
    redirect('/profile')
  else
    @message = "Invalid email or password!!!"
    erb :index
  end

  # get user credentials
  # check, and set session
  # if login is correct
end

get '/profile' do
  if session[:message] == "logged in"
    @user = User.find(session[:user_id])
    @urls = @user.urls

    erb :profile
  else
    @message = "Please log in first"
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect('/')
  # delete session
  # redirect home
end

get '/signup' do
  erb :signup
end

post '/signup' do
  User.create(name:  params[:name], email: params[:email], password: ENCODER.encrypt(params[:password]))
  erb :index
end


