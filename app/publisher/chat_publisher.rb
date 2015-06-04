class ChatPublisher < FayeRails::Controller
  observe ChatMessage, :after_create do |message|
    begin
      ChatPublisher.publish('/comments', "<p>#{message.message}</p>")
    rescue
      ChatPublisher.publish('/comments', "<p>#{message.message}</p>")
    end
  end
end
