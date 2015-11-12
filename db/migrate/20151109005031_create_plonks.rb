class CreatePlonks < ActiveRecord::Migration
  def change
    create_table :plonks do |t|
      t.string :vineyard
      t.string :variety
      t.integer :year
      t.integer :number_of_bottles
      t.decimal :price
      t.boolean :will_trade
      t.string :city
      t.string :zip_code
      t.string :user_name
      t.references :user

      t.timestamps null: false
    end
  end
end
