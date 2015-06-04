DOM = React.DOM
window.fayeClient = new Faye.Client('/faye')

# By React
window.ChatMessages = React.createClass
  displayName: 'ChatMessages Component'

  getInitialState: ->
    fayeClient.subscribe '/comments', this.onMessage
    @messages = []
    messages: []

  onMessage: (message) ->
    @messages.push(message.message)
    this.setState messages: @messages

  render: ->
    DOM.div
      className: 'chat-messages'
      this.state.messages.map (message) ->
        DOM.p null, message

# By normal javascript
$ ->
  fayeClient.subscribe '/comments', (payload) ->
    $('#comments').prepend(payload.message) if payload.message
