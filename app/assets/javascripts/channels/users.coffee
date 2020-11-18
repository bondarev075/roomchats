jQuery(document).on 'turbolinks:load', ->
  App.users = App.cable.subscriptions.create { channel: "UsersChannel" },
    connected: ->

    disconnected: ->

    received: (data) ->

      { id, nickname, online } = data['user']

      tag = $('#users_online').find("##{id}")
      tag.remove()

      if online
        $('#users_online').append("<span id='#{id}'>" + nickname + "</span> ")
