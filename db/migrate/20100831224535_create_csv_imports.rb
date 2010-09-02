class CreateCsvImports < ActiveRecord::Migration
  def self.up
    create_table :csv_imports do |t|
      t.string :file_name
      t.string :target

      t.timestamps
    end
  end

  def self.down
    drop_table :csv_imports
  end
end
