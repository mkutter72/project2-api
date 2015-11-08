class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_user_name
      t.string :receiver_user_name
      t.string :plonk_message
      t.references :user

      t.timestamps null: false
    end
  end
end
