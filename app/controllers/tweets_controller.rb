class TweetsController < ApplicationController

	def show
		lat = request.params[:lat]
		lon = request.params[:lon]
		word = request.params[:word]
		@tweets = JSON.parse(RestClient.get("http://search.twitter.com/search.json", :params => { :q => word, :geocode => "#{lat},#{lon},5mi" }).body)["results"]
	end
end
