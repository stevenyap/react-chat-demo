ChatFormClass = React.createClass
  displayName: 'ChatForm'

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

@ChatForm = React.createFactory(ChatFormClass)
