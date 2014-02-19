class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :long_url
      t.string :short_url
      t.integer :count , default: 0

      t.timestamps
    end
  end
end
