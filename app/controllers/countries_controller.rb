class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def new
    @countries = Country.all
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    respond_to do |format|
      if @country.save
        format.html { redirect_to new_country_path, notice: 'Country was successfully created.' }
        format.js
        format.json { render json: @country, status: :created, location: @country }
      else
        format.html { render action: "new" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end


  protected

  def country_params
    params.require(:country).permit(:name)
  end
end


