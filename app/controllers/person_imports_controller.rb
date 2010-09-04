class PersonImportsController < ApplicationController
  def new
    @csv_import = PersonImport.new
  end
  
  def create
    @csv_import = PersonImport.new(params[:person_import])
    if @csv_import.save
      redirect_to @csv_import
    else
      render 'new'
    end
  end
  
  def show
    @csv_import = PersonImport.find(params[:id])
  end
  
  def update
    @csv_import = PersonImport.find(params[:id])
    @csv_import.update_attributes params[:person_import]
    
    redirect_to Person if @csv_import.import!
  end
end
