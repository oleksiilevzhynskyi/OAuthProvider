class CreateClientApplications < ActiveRecord::Migration
  def change
    create_table :client_applications do |t|
      t.string :name
      t.string :callback_url
      t.string :access_level
      t.string :consumer_key
      t.string :consumer_secret
      t.integer :access_token_id
      t.integer :user_id

      t.timestamps
    end
  end
end

