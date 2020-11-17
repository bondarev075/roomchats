jQuery(document).on 'turbolinks:load', ->
  App.users = App.cable.subscriptions.create { channel: "UsersChannel" },
    connected: ->
      console.log('Connected to UserChannel')

    disconnected: ->

    received: (data) ->
      console.log('Received message in UserChannel: ' + data['user']['nickname'] + ' ' +  data['user']['online'])

      $('#users_online').find('span:contains("' + data['user']['nickname'] + '")').remove()
      # console.log('Remove span ' + data['user']['nickname'])

      if data['user']['online'] == true
        $('#users_online').append("<span>" + data['user']['nickname'] + "</span> ")
        # console.log('Add span ' + data['user']['nickname'])
