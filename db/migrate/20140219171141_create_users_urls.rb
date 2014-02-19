class CreateUsersUrls < ActiveRecord::Migration
  def change
    create_table :user_url do |t|
      t.integer :user_id
      t.integer :url_id

      t.timestamps
    end
  end
end
