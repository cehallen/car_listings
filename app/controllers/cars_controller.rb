class CarsController < ApplicationController
  def index
    @cars = Car.order(updated_at: :desc)
  end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all.map{ |m| [m.name, m.id] }
    # @companies = Company.all.map{ |c| [c.name, c.id] }
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_path,
        notice: 'Car added!'
    else
      @manufacturers = Manufacturer.all.map{ |m| [m.name, m.id] }
      render :new
      # Couldn't get the 'Car added' to go away from the last successful add, causing tests to fail..  So did this second best option
      # redirect_to new_manufacturer_car_path(@manufacturer),
      #   notice: 'You had missing fields'
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :color, :year, :mileage, :description, :manufacturer_id )
  end
end
