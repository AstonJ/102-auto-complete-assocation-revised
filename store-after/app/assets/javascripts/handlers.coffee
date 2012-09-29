class Handlers
  constructor: ->
    @handlers = {}

  register: (handler, registered_class) ->
    @handlers[handler] = registered_class

  instantiate: (handlers, element) ->
    handlers = handlers.replace(/\s/g, '').split(',')
    element.handlers = []
    $.each handlers, (index, handler) =>
      if @handlers[handler]
        instance = new @handlers[handler](element)
        element.handlers.push instance
      else
        throw "Unknown handler " + handler

  destroy: (instances) ->
    $.each instances, (index, instance) ->
      instance.destroy() if instance.destroy

@handlers = new Handlers
