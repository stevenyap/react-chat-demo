DOM = React.DOM
window.fayeClient = new Faye.Client('/faye')

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

$ ->
  $("#message-form").submit (e) ->
    $.ajax
      url: $(this).attr('action')
      type: 'POST'
      data: $(this).serializeArray()
      dataType: 'script'
      success: (data) ->
        # do nothing for now
      error: (xhr, status, err) ->
        console.error(this.props.url, status, err.toString());
    e.preventDefault()
