class CreateKmsaves < ActiveRecord::Migration
  def change
    create_table :kmsaves do |t|
      t.integer :disk_number
      t.integer :sector_id
      t.integer :sector_number_l
      t.binary :data_l
      t.binary :data_h

      t.timestamps null: false
    end
  end
end
