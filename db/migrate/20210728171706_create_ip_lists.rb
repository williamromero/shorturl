class CreateIpLists < ActiveRecord::Migration[6.1]
  def change
    create_table :ip_lists do |t|
      t.text :client_ip
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
