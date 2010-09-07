class AddStateToCsvRows < ActiveRecord::Migration
  def self.up
    add_column :csv_rows, :state, :string
  end

  def self.down
    remove_column :csv_rows, :state
  end
end
