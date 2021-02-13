class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name, null: false

      t.timestamps
    end
    #add_index :rooms, :name, unique: true
  end
end
