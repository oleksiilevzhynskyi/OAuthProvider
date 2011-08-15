class User < ActiveRecord::Base
  devise :database_authenticatable

  validates :login, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :login, :password, :password_confirmation


end

