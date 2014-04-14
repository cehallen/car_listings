class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(updated_at: :desc)
  end

  def new
    @manufacturer = Manufacturer.new
  end
end
