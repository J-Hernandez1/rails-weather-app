#frozen_string_literal: true

class CurrentWeatherService
    BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

    def initialize(latitude:, longitude:, units: "metric")
        @latitude = latitude
        @longitude = longitude
        @units = units
    end

    def call
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

    private

    attr_reader :latitude, :longitude, :units

    def uri
        return @uri if defined?(@uri)

        @uri = URI(BASE_URL)
        params = { lat: latitude, lon: longitude, units: units, appid: "992d118c3cca8e7cb6c071de74cee07d" } 
        @uri.query = URI.encode_www_form(params)
        @uri
    end
end