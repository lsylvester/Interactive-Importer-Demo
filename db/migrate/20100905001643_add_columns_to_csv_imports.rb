class AddColumnsToCsvImports < ActiveRecord::Migration
  def self.up
    add_column :csv_imports, :columns, :text
  end

  def self.down
    remove_column :csv_imports, :columns
  end
end
