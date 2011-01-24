class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :fname, :limit => 20
      t.string :lname, :limit => 20
      t.boolean :clocked_in, :default => :false
      t.boolean :employed, :default => :true
      t.boolean :admin, :default => :false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
