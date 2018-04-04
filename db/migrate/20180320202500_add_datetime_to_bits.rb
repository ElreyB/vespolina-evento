class AddDatetimeToBites < ActiveRecord::Migration[5.1]
  def change
    drop_table :bites

    create_table :bites do |t|
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
