class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.numeric :number
      t.numeric :recipient_id
      t.numeric :sender_id
      t.references :application, foreign_key: true

      t.timestamps
    end
    add_index :chats, [:recipient_id, :sender_id], unique: true
  end
end
