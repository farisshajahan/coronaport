class HousesController < ApplicationController
  def new
    @application = Application.find(params[:application_id])
    @house = @application.houses.build
  end

  def confirm
  end

  def create
    @application = Application.find(params[:application_id])
    @house = @application.houses.create(house_params)

    if @house.save!
      redirect_to @application, notice: "House was successfully created"
    end
  end

  def update
    @application = Application.find(params[:application_id])
    @house = @application.houses.find(params[:id])

    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to application_house_path(@application, @house), notice: "House was successfully updated." }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @application = Application.find(params[:application_id])
    @house = @application.houses.find(params[:id])
  end

  alias edit show

  private

  def house_params
    params.require(:house).permit(:name, :address, :ward, :panchayat_id, :contact_number, :contact_person, :comment, :status)
  end
end
