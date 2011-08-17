class ClientApplication < ActiveRecord::Base

  belongs_to :users

  before_save :create_keys

  private

  def random_sting(options = {})
    alphabet = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten.shuffle
    (1..options[:size]).map{ alphabet[rand(alphabet.length)]  }.join
  end

  def create_keys
      self.callback_url = nil
      self.access_level = nil
      self.consumer_key = random_sting :size => 20
      self.consumer_secret = random_sting :size => 40
  end
end

