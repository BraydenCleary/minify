before do
  @urls = Url.all.sort { |a,b| b.click_count <=> a.click_count}
end

get '/' do
  redirect to ('/urls')
end

get '/urls' do
  @urls = Url.all
  erb :urls
  # Look in app/views/index.erb
end

post '/urls' do
  content_type :json
  if session[:user_id]
    @url = Url.new(:long => params['long'], :user_id => session[:user_id])
  else
    @url = Url.new(:long => params['long'])
  end
  if @url.save
    @ur.to_json
  else
    @messages[:error] = "Url shorten unsuccessful."
    erb :urls
  end
end

get '/urls/:short_url' do
  url = Url.find_by_short(params["short_url"])
  url.update_attributes :click_count => url.click_count + 1
  redirect to (url.long)
end
