class ChatsController < ApplicationController
  def index
    @messages = ChatMessage.all.order(created_at: :desc).limit(10)
  end

  def run
    @message = ChatMessage.create!(message: posted_message)
  end

  private

  def posted_message
    params.require(:posted_message)
  end
end
