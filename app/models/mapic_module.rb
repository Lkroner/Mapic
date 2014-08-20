module Google

	class Client
		include HTTParty

		base_uri "https://maps.googleapis.com"

		def initialize
			@response
		end

		def geolocation(address)
			response = self.class.get("/maps/api/geocode/json?address=#{address}&key=#{ENV["GOOGLE_KEY"]}", {
				query: { with: 'parameters' }
			})
			@response = response
		end

		def lat_lng
			@response['results'][0]['geometry']['location'].values
		end
	end
end

module Instagram

	class Client
		include HTTParty

		base_uri "https://api.instagram.com"

		def initialize
		end

		def media(latitude, longitude)
			response = self.class.get("/v1/media/search?lat=#{latitude}&lng=#{longitude}&access_token=#{ENV["ACCESS_TOKEN"]}", {
				query: { with: 'parameters' }
			})
			response
		end

	end
end

