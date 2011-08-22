class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  devise :oauth2_providable, :oauth2_password_grantable, :oauth2_refresh_token_grantable

  validates :login, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :login, :password, :password_confirmation

  has_many :client_applications


end

