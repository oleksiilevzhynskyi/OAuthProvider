class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.string :access_token
      t.string :access_token_secret
      t.string :access_level

      t.timestamps
    end
  end
end

