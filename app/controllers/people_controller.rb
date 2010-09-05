class PeopleController < ApplicationController
  def index
    @people = Person.paginate(:page => params[:page])
  end
  
  def delete_all
    Person.delete_all
    redirect_to Person, :notice => "All people where deleted"
  end
end
