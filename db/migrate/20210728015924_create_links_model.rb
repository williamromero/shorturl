class CreateLinksModel < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :slug
      t.integer :clicked, default: 0

      t.timestamps
    end
  end
end
