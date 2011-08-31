class ClientApplicationsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_user
  before_filter :find_client_application

  def index
  end

  def show
  end

  def new
    @client_application = ClientApplication.new
  end

  def create
    params[:client_application][:user_id] = @user.id
    @client_application = ClientApplication.new(params[:client_application])
    if @client_application.save!
      redirect_to user_client_applications_path(@user)
    else
      render :new
    end
  end

  def destroy
    @client_application = ClientApplication.find(params[:id])
    @client_application.destroy

    respond_to do |format|
      format.html { redirect_to user_client_applications_path(@user)}
    end
  end

  private

  def find_user
    @user = current_user
  end

  def find_client_application
    @client_applications = @user.client_applications
  end

end

