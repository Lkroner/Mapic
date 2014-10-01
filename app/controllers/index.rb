require 'httparty'
require 'pp'
require 'securerandom'
require 'json'

get '/' do
  erb :index
end

post '/' do
	  p address = params[:address]
	  address.gsub!(" ", "+")

  	google_api = Google::Client.new
  	instagram_api = Instagram::Client.new
	  @geolocation_response = google_api.geolocation(address)
	  @latitude, @longitude = google_api.lat_lng
	  p @media_response = instagram_api.media(@latitude, @longitude)
    partial = erb :image_response, :layout => false, :locals => {media_response: @media_response}
    content_type :json
    {html: partial, longitude: @longitude, latitude: @latitude}.to_json
end


#----------- SESSIONS -----------

get '/sign_in' do
  # render sign-in page
  erb :sign_in
end

get '/redirect_auth_url' do
	redirect "https://api.instagram.com/oauth/authorize/?" +
	"client_id=1063513989802-jmd0ljou37g3o7en8cj60fs5bhjk6q6f.apps.googleusercontent.com" +
	"&redirect_uri=http://localhost:9393/logged_in" +
	"&response_type=code"
end



