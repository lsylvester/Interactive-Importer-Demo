class CsvImportsController < ApplicationController
  def new
    @csv_import = CsvImport.new
  end
  
  def create
    @csv_import = CsvImport.new(params[:csv_import])
    if @csv_import.save
      redirect_to @csv_import
    else
      render 'new'
    end
  end
  
  def show
    @csv_import = CsvImport.find(params[:id])
  end
  
  def update
    @csv_import = CsvImport.find(params[:id])
    @csv_import.update_attributes params[:csv_import]
    
    redirect_to Person if @csv_import.import!
  end
end
