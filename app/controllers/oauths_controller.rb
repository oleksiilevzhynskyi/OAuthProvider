class OauthsController < ApplicationController

  #before_filter :authenticate_user!

  def request_token
  end

  def autorize
    client_id = params["oauth"].slice(0,20)
    client_secret = params["oauth"].slice(20,60)
    @client = ClientApplication.find_by_consumer_key(client_id)
    hash = Digest::SHA1.hexdigest(@client.consumer_secret)
    if hash == client_secret
      redirect_to "http://localhost:3000/users/auth/myprovider/callback?token=#{random_sting(:size => 20)}"
    end
  end

  def acess_token

  end

  private

  def random_sting(options = {:size => 0})
    alphabet = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten.shuffle
    (1..options[:size]).map{ alphabet[rand(alphabet.length)]  }.join
  end

end

