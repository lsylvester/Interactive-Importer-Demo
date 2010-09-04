class AddTypeToCsvImports < ActiveRecord::Migration
  def self.up
    add_column :csv_imports, :type, :string
  end

  def self.down
    remove_column :csv_imports, :type
  end
end