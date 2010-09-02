class CsvImportsController < ApplicationController
  def new
    @csv_import = CsvImport.new
  end
  
  def create
    @csv_import = CsvImport.create(params[:csv_import])
    redirect_to @csv_import
  end
  
  def show
    @csv_import = CsvImport.find(params[:id])
  end
  
  def update
    @csv_import = CsvImport.find(params[:id])
    @csv_import.columns = params[:csv_import][:columns]
    @csv_import.import!
    redirect_to Person
  end
end
