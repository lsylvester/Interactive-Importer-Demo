class CreateCsvRows < ActiveRecord::Migration
  def self.up
    create_table :csv_rows do |t|
      t.text :content
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :csv_rows
  end
end
