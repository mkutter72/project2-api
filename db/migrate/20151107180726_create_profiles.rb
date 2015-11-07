class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :user

      t.timestamps null: false
    end
  end
end
