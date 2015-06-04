class ChatsController < ApplicationController
  def index
    @messages = ChatMessage.all.order(created_at: :asc)
  end

  def run
    @message = ChatMessage.create!(message: 'Faye works!')
  end
end
