class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  inverse_of: :messages
end
