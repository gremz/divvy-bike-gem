require 'net/http'
require 'json'
require 'time'

class DivvyBike
	@@stations = {}
	@@response_date = Time.now-60

	def self.all	
		get_data
	end

	private

	def self.get_data
		if Time.now > @@response_date+60
		  	response = Net::HTTP.get(URI 'http://www.divvybikes.com/stations/json')
		  	response_json = JSON.parse(response)
		  	@@stations = response_json['stationBeanList']
		  	@@response_date = Time.parse(response_json['executionTime'])
		end
		return @@stations
	end
end