@fayeClient = new Faye.Client('/faye')

@ChatBox = React.createClass
  displayName: 'ChatBox'

  getInitialState: ->
    fayeClient.subscribe '/comments', this.onMessage
    @messages = @props.messages
    messages: @messages

  onMessage: (message) ->
    @messages.push(message.message)
    this.setState messages: @messages

  render: ->
    DOM.div
      className: 'chat-box'
      ChatMessages
        messages: this.state.messages
      ChatForm null
