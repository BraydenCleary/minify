before do
  @urls = Url.all.sort { |a,b| b.click_count <=> a.click_count}
end

get '/' do
  redirect to ('/urls')
end

get '/urls' do
  erb :urls
  # Look in app/views/index.erb
end

post '/urls' do
  @url = Url.new(:long => params['long'], :user_id => session[:user_id])
  if @url.save
    @user
    redirect to ('/urls')
  else
    @messages[:notice] = "Url shorten unsuccessful."
    erb :urls
  end
end

get '/urls/:short_url' do
  url = Url.find_by_short(params["short_url"])
  url.update_attributes :click_count => url.click_count + 1
  redirect to (url.long)
end