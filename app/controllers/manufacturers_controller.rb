class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(updated_at: :desc)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to new_manufacturer_path,
        notice: 'Manufacturer added!'
      else
        render :new
      end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
