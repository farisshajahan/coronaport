class HousesController < ApplicationController
  def new
    @application = Application.find(params[:application_id])
  end

  def create
    @application = Application.find(params[:application_id])
    @house = @application.houses.create(house_params)

    if @house.save!
      redirect_to @application, notice: "House was successfully created"
    end
  end

  private
  def house_params
    params.require(:house).permit(:name, :address, :ward, :panchayat_id, :contact_number, :contact_person, :comment, :status)
  end
end
