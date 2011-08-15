class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.database_authenticatable :null => false
  end
    add_index :users, :email,                :unique => true
  end

  def self.down
    remove_column :users, :database_authenticatable
  end
end

