
class HomeController < ApplicationController


    def index
       url = "https://api.openweathermap.org/data/2.5/weather?lat=51.509865&lon=-0.118092&units=metric&appid=992d118c3cca8e7cb6c071de74cee07d"

       uri = URI(url)
       res = Net::HTTP.get_response(uri)

       @data = JSON.parse(res.body)
    end
end
