# need to make this work and only run it after 'users/:id'
# before() do
#   @messages = {}
# end

before do
  @messages = {}
  @urls = Url.all.sort { |a,b| b.click_count <=> a.click_count}
end

get '/users' do
  erb :users
end

get '/users/new' do
  erb :users_new
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :users_show
end

get '/users/:id/edit' do
  erb :users_edit
end

post '/users' do
  if params[:password] == params[:confirm_password]
    @user = User.new( :first_name => params[:first_name],
                      :last_name  => params[:last_name],
                      :username   => params[:username], 
                      :email      => params[:email],
                      :password   => params[:password])
    if @user.save
      session[:user_id] = @user.id
      @messages[:notice] = "Welcome, #{@user.first_name}!"
      erb :urls
    else
      @messages[:error] = "Invalid signup, please try again."
      erb :users_new
    end
  else
    @messages[:error] = "Password confirmation doesn't match.  Please try again."
    erb :users_new
  end
end

