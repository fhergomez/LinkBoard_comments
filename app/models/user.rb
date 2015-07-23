class User < ActiveRecord::Base

  has_secure_password#this exposes a field in the model....it will encrypted

  validates :email,#what you want to validate
  presence:true, #that they're entering an email
  uniqueness: {case_senesitive:false}

  validates_presence_of :password, on: :create #will validate there's a password present

  has_many :posts

  def self.authenticate email,password
    User.find_by_email(email).try(:authenticate, password)
  end

end
