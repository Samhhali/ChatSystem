class Chat < ApplicationRecord
  #belongs_to :application
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: User
  belongs_to :recipient, foreign_key: :recipient_id, class_name: User

  validates :sender_id, uniqueness: { scope: :recipient_id }

#returns a chat between two requested users.
  scope :between, -> (sender_id, recipient_id) do
      where(sender_id: sender_id, recipient_id: recipient_id).or(
        where(sender_id: recipient_id, recipient_id: sender_id)
      )
    end

    def self.get(sender_id, recipient_id)
    chat = between(sender_id, recipient_id).first
    return chat if chat.present?
#if chat is present, it returns it. If there isn’t any, it creates a new one.
    create(sender_id: sender_id, recipient_id: recipient_id)
    end

#opposed_user methods returns an opposed user to the requested user.
    def opposed_user(user)
      user == recipient ? sender : recipient
    end

end
