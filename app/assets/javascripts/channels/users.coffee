jQuery(document).on 'turbolinks:load', ->
  App.users = App.cable.subscriptions.create { channel: "UsersChannel" },
    connected: ->
      console.log('Connected to UserChannel')

    disconnected: ->
      console.log('Disconnected form UserChannel')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Received message in UserChannel: ' + data['users_online'])
      $('#users_online').text 'Users online: ' + data['users_online']
