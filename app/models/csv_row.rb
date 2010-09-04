class CsvRow < ActiveRecord::Base
  serialize :content
  belongs_to :csv_import, :inverse_of => :csv_rows
  
  def import
    @record = csv_import.target_class.create row_to_hash
    destroy unless @record.new_record?
  end
  
  attr_reader :record
  
  def importable_columns
    csv_import.importable_columns
  end
  
  def columns
    csv_import.columns
  end
  
  delegate :each, :to => :content
  include Enumerable
  
  def errors
    @record ? @record.errors : super
  end
  
  def row_to_hash
    {}.tap do |hash|
      importable_columns.each do |column|
        if columns.include?(column)
          hash[column] = content[columns.index(column)]
        end
      end
    end
  end
end
