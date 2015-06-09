ChatMessagesClass = React.createClass
  displayName: 'ChatMessages'

  render: ->
    DOM.div
      className: 'chat-messages'
      this.props.messages.map (message) ->
        DOM.p null, message

@ChatMessages = React.createFactory(ChatMessagesClass)
