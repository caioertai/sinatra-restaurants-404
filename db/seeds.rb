require "faker"

carretao = Restaurant.new(
  name: "Carretão",
  address: "General Osório, 124 - Ipanema"
)
carretao.save!

10.times do
  restaurant = Restaurant.new(
    name: Faker::GreekPhilosophers.name,
    address: Faker::Address.street_address
  )
  restaurant.save!
end
