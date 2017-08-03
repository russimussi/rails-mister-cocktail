class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def find_cocktail

  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
