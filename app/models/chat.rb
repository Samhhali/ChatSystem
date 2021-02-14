class Chat < ApplicationRecord
  #belongs_to :application
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: User
  belongs_to :recipient, foreign_key: :recipient_id, class_name: User

  validates :sender_id, uniqueness: { scope: :recipient_id }

#opposed_user methods returns an opposed user to the requested user.
    def opposed_user(user)
      user == recipient ? sender : recipient
    end

end
