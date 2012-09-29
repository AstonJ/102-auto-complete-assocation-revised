$(document).on 'pageChanged', ->
  $('[data-handler]').each ->
    handlers.instantiate $(@).attr('data-handler'), @

$(document).on 'pageUpdated', ->
  $('body').find('[data-handler]').each ->
    handlers.instantiate $(@).attr('data-handler'), @

$(document).on 'page:fetch', ->
  $('body').find('[data-handler]').each ->
    handlers.destroy @handlers
    delete @handlers

$(document).on 'page:change', ->
  $(document).trigger 'pageUpdated'

$ ->
  $(document).trigger 'pageChanged'
