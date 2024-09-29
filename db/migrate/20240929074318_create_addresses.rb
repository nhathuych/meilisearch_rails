class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.text :street_address
      t.integer :article_id, index: true, null: false

      t.timestamps
    end
  end
end
