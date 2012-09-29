#require ./handlers

handlers.register 'AutoComplete', class
  constructor: (el) ->
    $(el).autocomplete
      source: $(el).data('autocomplete-source')
