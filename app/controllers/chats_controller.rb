class ChatsController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :asc)
  end
end
