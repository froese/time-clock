class CreatePeriods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.datetime :starting
      t.datetime :ending

      t.timestamps
    end
  end

  def self.down
    drop_table :periods
  end
end
