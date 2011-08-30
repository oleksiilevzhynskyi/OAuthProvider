class OauthsController < ApplicationController

  def request_token
  end

  def autorize
    @client = ClientApplication.find_by_consumer_key(params["client_id"])
    if @client.presence
      if authenticate_user!
        token = Digest::SHA1.hexdigest("#{@client.consumer_secret}, #{current_user.id}, #{current_user.name}")
        redirect_to params[:redirect_uri] + "?code=#{token}"
      end
    end
  end

  def access_token
    @client = ClientApplication.find_by_consumer_key(params["client_id"])
    token = Digest::SHA1.hexdigest("#{@client.consumer_secret}")
    redirect_to params[:redirect_uri] + "?token=#{token};token_secret=#{token}"
  end

  private

  def random_sting(options = {:size => 0})
    alphabet = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten.shuffle
    (1..options[:size]).map{ alphabet[rand(alphabet.length)]  }.join
  end

end

