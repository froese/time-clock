class CreatePunches < ActiveRecord::Migration
  def self.up
    create_table :punches do |t|
      t.integer :user_id
      t.integer :period_id
      t.datetime :ptime
      t.string :note, :limit => 60
      t.string :ptype, :limit => 1
      t.string :ip, :limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :punches
  end
end
