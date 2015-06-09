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

window.ChatForm = React.createClass
  displayName: 'Chat Form'

  handleSubmit: (e) ->
    $.ajax
      url: '/run.js'
      type: 'POST'
      data: $(React.findDOMNode(this.refs.theform)).serializeArray()
    e.preventDefault()

  render: ->
    DOM.form
      ref: 'theform'
      onSubmit: @handleSubmit
      DOM.label
        htmlFor: 'posted_message'
        'Enter Your Message:'
      DOM.input
        type: 'text'
        name: 'posted_message'
      DOM.input
        type: 'submit'
        value: 'submit'
