#
class User < ActiveRecord::Base
  include Authentication

  has_many :books
  has_many :messages
  has_one :profile, autosave: true
end
