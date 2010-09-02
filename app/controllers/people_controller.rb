class PeopleController < ApplicationController
  def index
    @people = Person.all
  end
  
  def delete_all
    Person.delete_all
    redirect_to Person, :notice => "All people where deleted"
  end
end
