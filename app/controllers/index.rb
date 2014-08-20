require 'httparty'
require 'pp'

get '/' do
  if !params[:address].nil?
	  @address = params[:address]
	  @address.gsub!(" ", "+")
	else
  	@address = "Golden+Gate+Park,+San+Francisco,+CA"
  end
  	google_api = Google::Client.new
  	instagram_api = Instagram::Client.new
	  @geolocation_response = google_api.geolocation(@address)
	  @latitude, @longitude = google_api.lat_lng
	  @media_response = instagram_api.media(@latitude, @longitude)
  erb :index
end




#----------- SESSIONS -----------

# get '/sessions/new' do
#   # render sign-in page
#   erb :sign_in
# end

# post '/sessions' do
#   # sign-in
#   user = User.find_by(email: params[:email])
#   if user ==  nil
#     @error = "Your email is incorrect."
#     erb :sign_in
#   elsif
#     user.password != params[:password]
#     @error = "Your password is incorrect."
#     erb :sign_in
#   else
#     session[:user_id] = user.id
#     redirect '/'
#   end
# end

# delete '/sessions/:id' do
#   # sign-out -- invoked
#   session[:user_id] = nil
#   redirect '/'
# end

#----------- USERS -----------

# get '/users/new' do
#   # render sign-up page
#   erb :sign_up
# end

# post '/users' do
#   # sign-up a new user
#   user = User.create(params)
#   puts "This is what the user is."
#   p user
#   session[:user_id] = user.id
#   puts "This is what the session is."
#   p session[:user_id]
#   puts "This is what the @current_user is."
#   @current_user
#   redirect '/'
# end



