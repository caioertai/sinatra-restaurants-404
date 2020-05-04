require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

# Router and Controller


# Routes:
get "/" do
  "Hello, Melbourne! Welcome to the Sinatra YELP!"
end

# Index
# Shows all restaurants
get "/restaurants" do
  # Ask MODEL for the restaurants
  @restaurants = Restaurant.all
  # Ask VIEW to display them
  erb :"restaurants/index"
end

post "/restaurants" do
  # params => { "name"=>"Hangai", "address"=>"São Luis 245"}
  @restaurant = Restaurant.new(params)
  @restaurant.save
  redirect "/restaurants"
end

# Show (parametric route)
# Shows detail of one restaurant
get "/restaurants/:id" do
  # Ask MODEL for the restaurant
  # /restaurants/7
  # params => { id: 7 }
  @restaurant = Restaurant.find(params[:id])
  # Ask VIEW to display it
  erb :"restaurants/show"
end
