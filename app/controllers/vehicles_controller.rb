class VehiclesController < ApplicationController
  def new
    @application = Application.find(params[:application_id])
  end

  def create
    @application = Application.find(params[:application_id])
    @vehicle = @application.vehicles.create(vehicle_params)

    if @vehicle.save!
      redirect_to @application, notice: "Vehicle was successfully created"
    end
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:number_plate)
  end
end
