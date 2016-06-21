class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @people = Person.all
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.js
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end


  protected

  def person_params
    params.require(:person).permit(:name)
  end
end
