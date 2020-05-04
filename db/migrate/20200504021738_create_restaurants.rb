class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    # DSL - Domain Specific Language
    # Writing migrations
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
