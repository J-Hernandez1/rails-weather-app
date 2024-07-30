
class HomeController < ApplicationController
    def index
       @data = CurrentWeatherService.new(latitude: "51.509865", longitude: "-0.118092", units: "metric").call
    end
end
