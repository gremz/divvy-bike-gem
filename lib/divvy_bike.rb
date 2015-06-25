require 'net/http'
require 'json'
require 'time'

class DivvyBike
	VALID_ARGS = {:id => "id", :station_name => "stationName", :available_docks => "availableDocks", :total_docks => "totalDocks", 
				 :latitude => "latitude", :longitude => "longitude", :status_value => "statusValue", :status_key => "statusKey", 
				 :available_bikes => "availableBikes", :st_address_1 => "stAddress1", :st_address_2 => "stAddress2", :city => "city",
				 :postal_code => "postalCode", :location => "location", :altitude => "altitude", :test_station => "testStation", 
				 :last_communication_time => "lastCommunicationTime", :land_mark => "landMark"}

	@@stations = {}
	@@response_date = Time.now-60

	def self.all	
		get_data
	end

	def self.get(args)
		# Only valid arguments allowed
			args.each do |k_arg, v_arg| 
			if !VALID_ARGS.has_key?(k_arg)
				return "#{k_arg} is not a valid argument"
			end
		end

		stations = get_data
		filtered_stations = []

		stations.each do |station|
			if args.all? { |k_arg, v_arg| station[VALID_ARGS[k_arg]] == v_arg }
				filtered_stations.push(station) 
			end
		end

		return filtered_stations
	end

	def self.have_available_bikes
		stations = get_data
		stations.select { |station| station["availableBikes"] > 0 }
	end

	def self.have_available_docks
		stations = get_data
		stations.select { |station| station["availableDocks"] > 0 }
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