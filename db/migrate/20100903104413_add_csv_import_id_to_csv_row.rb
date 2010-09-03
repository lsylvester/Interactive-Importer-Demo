class AddCsvImportIdToCsvRow < ActiveRecord::Migration
  def self.up
    add_column :csv_rows, :csv_import_id, :integer
  end

  def self.down
    remove_column :csv_rows, :csv_import_id
  end
end
