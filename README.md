# divvy-bike-gem
Chicago Divvy Bike Sharing System API ruby gem

## Installation

Add this line to your application's Gemfile:

```
gem 'divvy_bike'
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install divvy_bike
```

## Available Commands

### Get all stations

```ruby
DivvyBike.all
```

### Get filtered results
You may pass the following filter criteria

:id, :station_name, :available_docks, :total_docks, :latitude, :longitude, :status_value, :status_key, 
:available_bikes, :st_address_1, :st_address_2, :city, :postal_code, :location, :altitude, :test_station, 
:last_communication_time, :land_mark

```ruby
DivvyBike.get(:id => 2)
DivvyBike.get(:id => 2, :available_docks => 19)
DivvyBike.get({ :id => 2, :available_docks => 19, :status_key => 1 })
```

### Get stations with available bikes
Returns all stations with available bikes

```ruby
DivvyBike.has_available_bikes
```

### Get stations with available docks
Returns all stations with available docks

```ruby
DivvyBike.has_available_docks
```

## Questions/Comments

Feel free to contact me with any questions/comments or pull requests
