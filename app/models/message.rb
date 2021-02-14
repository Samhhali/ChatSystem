class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  #inverse_of: :messages

  attr_accessible :content
  validates :content,  :presence => true
end
