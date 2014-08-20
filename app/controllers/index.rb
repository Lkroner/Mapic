require 'httparty'
require 'pp'

get '/' do
  @address = params[:address]
  @address.gsub!(" ", "+")
  # render home page
  @geolocation_response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}&key=#{ENV["GOOGLE_KEY"]}")

  @latitude, @longitude = @geolocation_response['results'][0]['geometry']['location'].values

  @latitude
  @longitude

  pp @media_response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{@latitude}&lng=#{@longitude}&access_token=#{ENV["ACCESS_TOKEN"]}")
  # p @longitude = @geolocation_response['results'][0]['geometry']['location']['lng']
  # p @latitude = @geolocation_response['results'][0]['geometry']['location']['lat']
  # p @media_response['data'].length
  erb :index
end

post '/find_address/' do
  @address = params[:address]

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



