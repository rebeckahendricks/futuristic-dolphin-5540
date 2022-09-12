class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    RideMechanic.create(ride_id: params[:add_ride], mechanic_id: params[:id])
    render :show
  end
end
