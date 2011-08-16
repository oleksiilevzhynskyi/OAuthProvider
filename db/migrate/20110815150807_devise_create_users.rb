class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
  end
    add_index :users, :email,                :unique => true
  end

  def self.down
    remove_column :users, :database_authenticatable
    remove_column :users, :confirmable
    remove_column :users, :recoverable
    remove_column :users, :rememberable
    remove_column :users, :trackable
  end
end

