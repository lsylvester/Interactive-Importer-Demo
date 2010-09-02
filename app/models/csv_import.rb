require 'fileutils'
require 'csv'
class CsvImport < ActiveRecord::Base
  def file= file
    return if file.blank?
    self.file_name = file.original_filename
    @file = file
  end
  
  def save_file
    FileUtils.mkdir_p("#{Rails.root}/imports/#{id}")
    FileUtils.cp(@file.path,"#{Rails.root}/imports/#{id}/#{file_name}" )
  end
  
  after_save :save_file
  
  def parsed_file
    @parsed_file ||= CSV.parse(File.read("#{Rails.root}/imports/#{id}/#{file_name}"))
  end
  
  def file_columns
    parsed_file.first
  end
  
  def file_rows
    parsed_file
  end
  
  def importable_columns
    %w(first_name last_name email)
  end
  
  attr_accessor :columns
  
  def import!
    file_rows.each do |row|
      Person.create! row_to_hash(row)
    end
  end
  
  def row_to_hash row
    {}.tap do |hash|
      importable_columns.each do |column|
        if columns.include?(column)
          hash[column] = row[columns.index(column)]
        end
      end
    end
  end
end
