class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.numeric :number
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
