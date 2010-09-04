require 'fileutils'
require 'csv'
class CsvImport < ActiveRecord::Base
  has_many :csv_rows, :dependent => :destroy, :inverse_of => :csv_import
  accepts_nested_attributes_for :csv_rows, :allow_destroy => true
  
  attr_accessor :file
  
  validates :file, :presence => true, :on => :create
  validate :ensure_file_is_well_formed, :if => :file
  def ensure_file_is_well_formed
    CSV.parse(file)
  rescue CSV::MalformedCSVError
    errors.add('file', 'file is malformed')
  end
  
  def generate_rows
    return unless @file
    CSV.open(@file).each_with_index do |row, index|
      CsvRow.create(:content => row, :number => index, :csv_import_id => id)
    end
  end

  after_save :generate_rows
  
  def file_columns
    csv_rows.max_by{|r| r.content.size}.content
  end
  
  def file_rows
    csv_rows
  end
  
  def importable_columns
    %w(first_name last_name email)
  end
  
  attr_accessor :columns
  
  def import!
    csv_rows.each do |row|
      row.import
    end
    if csv_rows.count.zero?
      destroy
      true
    else
      false
    end
  end
  
  def target_class
    Person
  end
end
