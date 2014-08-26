class Picker

  constructor: (className, options) ->
    node    = finfun['box-picker'] className:className, options:options
    @$node  = $(node)
    $('body').prepend @$node
    @initEvents()
  
  initEvents : ()->
    $('html').on                "click", @onClickOutsideElement
    $(".active-box", @$node).on 'click', @onOpenClick
    # Trigger Default option
    $(".option[default='true']", @$node).trigger 'click'

  onOpenClick : (e) =>
    e.stopPropagation()
    @$node.addClass 'open'
    
  onClickOutsideElement : (e) =>
    @$node.removeClass 'open'
