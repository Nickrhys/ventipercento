class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.create(country_params)
    redirect_to countries_path
  end


  protected

  def country_params
    params.require(:country).permit(:name)
  end
end


