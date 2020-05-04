require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

# This app.rb file will play the role of both the Router and Controller

# The routes will follow this pattern:
# verb "/path" do           <---- router part
#   # controller code       <---- controller part
# end

### Routes:
## Home
# Really... it just says hi for now. Maybe you can build a nice view for it? =)
get "/" do
  "Hello, Melbourne! Welcome to the Sinatra YELP!"
end

## Index
# Shows all restaurants
get "/restaurants" do
  # Ask MODEL for the restaurants
  @restaurants = Restaurant.all
  # Ask VIEW to display
  erb :"restaurants/index"
end

## Create
# Takes user params (coming from a form) and creates a restaurant
post "/restaurants" do
  # params in here has the keys (input names) and values (input values), coming
  # from the form in "/views/restaurants/index.erb"
  # So, because we have 2 inputs named "name" and "address" we get a params that
  # looks like this:
  # params => { "name"=>"Hangai", "address"=>"São Luis 245"}
  # Which gives us all we need to go on with the controller.

  # Ask MODEL for an instance of restaurant with the user given params
  @restaurant = Restaurant.new(params)
  # Ask INSTANCE to save itself on the DB
  @restaurant.save
  # Ask ROUTER to redirect the user to the restaurants index
  redirect "/restaurants"
end

## Show
# Shows detail of one restaurant
get "/restaurants/:id" do # <----- (parameterized route, check the ":id" thing)
  # params in here has the keys (parameter name, :id in here)
  # and values (path values), coming from the URL

  # So, for something like "/restaurants/7" we would get:
  # params => { id: 7 }
  # Which gives us what we need to go on with the controller.

  # Ask MODEL for the restaurant of the given id
  @restaurant = Restaurant.find(params[:id])
  # Ask VIEW to display
  erb :"restaurants/show"
end
