class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.numeric :message_number
      t.text :content
      t.references :chat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :messages, :chat_id, :username

  end
end
