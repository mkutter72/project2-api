# README For The Plonk Exchange - Backend Portion of the Project

For general information and details on the UI portion of this project see
https://github.com/mkutter72/plonk_front_end/blob/master/README.md


## Table Definitions for Database
###Tables for User and User Authentication
These tables, models and routers originate from https://github.com/gaand/project2-api

###Table for Profile

| Column | Type |
| :----- | :--- |
| id | INTEGER |
| first_name | CHARACTER VARYING |
| last_name | CHARACTER VARYING |
| street_address | CHARACTER VARYING |
| city | CHARACTER VARYING |
| state| CHARACTER VARYING |
| zip_code| INTEGER |
| user_name | CHARACTER VARYING, must be unique|
| foreign key | Reference to User |
| updated_at | TIMESTAMP WITHOUT TIME ZONE |
| created_at | TIMESTAMP WITHOUT TIME ZONE |

####Validations and Constraints for Profile
* user_name, city and zip_code must be filled in
* user_name must be unique



###Table for Plonk

| Column | Type |
| :----- | :--- |
| id | INTEGER |
| vineyard | CHARACTER VARYING |
| variety | CHARACTER VARYING |
| year | INTEGER |
| number_of_bottles | INTEGER |
| city | CHARACTER VARYING |
| price | DECIMAL |
| will_trade | BOOLEAN |
| foreign key | Reference to User |
| updated_at | TIMESTAMP WITHOUT TIME ZONE |
| created_at | TIMESTAMP WITHOUT TIME ZONE |

####Validations and Constraints for
* vineyard, variety, year, number_of_bottles, city, price and will_trade must be filled in


###Table for Message

| Column | Type |
| :----- | :--- |
| id | INTEGER |
| sender_user_name | CHARACTER VARYING |
| receiver_user_name | CHARACTER VARYING |
| plonk_message| CHARACTER VARYING |
| foreign key | Reference to User |
| updated_at | TIMESTAMP WITHOUT TIME ZONE |
| created_at | TIMESTAMP WITHOUT TIME ZONE |

####Validations and Constraints for Message
* sender_user_name, receiver_user_name and  plonk_message must be filled in



###Associations
* User is the parent of Message.  User has many messages.   A message belongs to a User
* User is the parent of a Plonk Ad.  User has many Plonk Ads.   A Plonk Ad belongs to a User



###ActiveRecord operations
* Finding a particular user by user_name  user = User.find_by(user_name: 'mkutter72')
* Getting all messages for user     user.messages
* Creating a new message for user   user.message.create!()
* Clearing the list of messages - want to delete messages as well - how?
* Finding Plonk based on city   plonk_list = Plonk.find_by(city: 'Boston')
* Finding Plonk based on type  plonk_list = Plonk.find_by(type: 'Cabernet')
* Finding a User to send a message to based on Plonk ad    user = plonk.user.username




###Authorization and Authentication
User authorization and authentication is provided by the project2-api repo that Antony Donovan created.
