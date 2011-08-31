class OauthsController < ApplicationController

  def request_token

  end

  def autorize
  end

  def access_token
    redirect_to "/oauth2/token", :method => :post
  end

end

