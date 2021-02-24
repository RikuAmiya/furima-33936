class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_cade, null: false
      t.integer    :area_id,     null: false, foreign_key: true
      t.string     :city,        null: false
      t.string     :address,     null: false
      t.string     :building
      t.string     :phone_num,   null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
