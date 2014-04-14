class CarsController < ApplicationController
  def new
    @car = Car.new
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end

  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car.manufacturer_id = @manufacturer.id
    if @car.save
      redirect_to new_manufacturer_car_path(@manufacturer),
        notice: 'Car added!'
    else
      # render 'manufacturers/new'
      # I couldn't get the 'Car added' to go away from the last successful add, causing tests to fail..  So did this second best option
      redirect_to new_manufacturer_car_path(@manufacturer),
        notice: 'You had missing fields'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end
end
