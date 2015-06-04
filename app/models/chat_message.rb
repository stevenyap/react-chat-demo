class ChatMessage < ActiveRecord::Base
  validates :message, presence: true
end
