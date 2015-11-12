# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.delete_all
Plonk.delete_all
Profile.delete_all
User.delete_all

user = User.create! email:"mkutter@comcast.net", password:"mk123"
user.create_profile first_name:"Mike", last_name:"Kutter", user_name:"mkutter72",
                    street_address:"72 Rockview St", city:"Jamaica Plain",
                    state:"MA", zip_code:"02130"

user = User.create! email:"alan@gmail.com", password:"g123"
user.create_profile first_name:"Alan", last_name:"Bery", user_name:"alanB",
                    street_address:"82 Beacon St", city:"Boston",
                    state:"MA", zip_code:"02118"

user = User.create! email:"ted@aol.com", password:"t123"
user.create_profile first_name:"Ted", last_name:"Spears", user_name:"Teddy",
                    street_address:"1324 Mass Ave", city:"Chicago",
                    state:"IL", zip_code:"02118"



Plonk.create!    vineyard:"Sebastiani", variety:"Chardonnay", year:2011,
                number_of_bottles: 8, price: 5.50, will_trade: true,
                city: "Boston", zip_code: "02130", user_id: 1, user_name: "mkutter72"
Plonk.create!    vineyard:"Sebastiani", variety:"Pinot Noir", year:2011,
                number_of_bottles: 8, price: 5.50, will_trade: true,
                city: "Boston", zip_code: "02130",  user_id: 2, user_name: "alanB"
Plonk.create!    vineyard:"Sebastiani", variety:"Pinot Blanc", year:2011,
                number_of_bottles: 8, price: 5.50, will_trade: true,
                city: "Chicago", zip_code: "02130", user_id: 3, user_name: "Teddy"
Plonk.create!    vineyard:"Bully Hill", variety:"Chardonnay", year:2011,
                number_of_bottles: 8, price: 5.50, will_trade: true,
                city: "Chicago", zip_code: "02130", user_id: 3, user_name: "Teddy"
Plonk.create!    vineyard:"Bully Hill", variety:"Cabernet", year:2011,
                number_of_bottles: 8, price: 5.50, will_trade: true,
                city: "Chicago", zip_code: "02130", user_id: 3,user_name: "Teddy"
