class ClientApplication < ActiveRecord::Base

  belongs_to :users

  def random_sting(options = {})
    alphabet = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten.suffle
    options[:size].map{ alphabet[rand(alphabet.length)]  }.join
  end
end

