class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @applications = current_user.applications
  end

  def show
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.create(application_params)
    @application.user_id = current_user.id
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: "Application was Successfully Created" }
      else
        format.html { render :new }
      end
    end
  end

  private

  def application_params
    params.require(:application).permit(:port_id)
  end
end
