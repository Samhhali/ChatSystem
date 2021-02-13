class Application < ApplicationRecord
  has_many :chats, dependent: :destroy,
                           inverse_of: :applications
end
