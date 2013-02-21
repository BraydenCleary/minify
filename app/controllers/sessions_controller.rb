before do
  @urls = Url.all.sort { |a,b| b.click_count <=> a.click_count}
end

get '/logout' do
  session[:user_id] = nil
  @messages[:notice] = "You have successfully logged out!"
  erb :urls
end

post '/signin' do
  if @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      @messages[:notice] = "Welcome #{@user.first_name}!"
      erb :urls
    else
      @messages[:error] = "Invalid username or password. Please try again."
      erb :signin
    end
  else
    @messages[:error] = "Invalid username or password. Please try again."
    erb :signin
  end
end

get '/signin' do
  erb :signin
end
