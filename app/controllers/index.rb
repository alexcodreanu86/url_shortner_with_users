get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/generate' do
  if params["long_url"].match(URI.regexp)
    if (a = Url.find_by(long_url: params["long_url"]))
      puts "found---------------------------------"
      @short_url = a.short_url
    else
      puts "not found. Create---------------------------------"
       a = Url.create(long_url: params["long_url"])
      puts " created -----------------------------"
      @short_url = a.short_url
    end

    if session[:message] == "logged in"
      User.find(session[:user_id]).urls << a
    end
    erb :shorty
  else
    @message = "Please insert a valid URL"
    erb :index
  end
end

get '/url/:short_url' do
  @shorty = Url.find_by(short_url: params[:short_url])
  if @shorty
    @shorty.count += 1
    @shorty.save
    if @shorty.long_url.match(URI.regexp)
      redirect(@shorty.long_url)
    end
  else
    @message = "URL not found or invalid"
    erb :index
  end
end

