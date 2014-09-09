class Mermaid 

  constructor: () ->
    PubSub.subscribe 'CHANGE_MERMAID', @changeMermaid

  changeMermaid : (msg, data) => 
    @loadMermaid data

  loadMermaid : (url="images/ColoringCrystal.svg") ->
    $.get url, null, (data) =>
      $svgNode  = $("svg", data)

      # Add filters to the svg node
      node     = finfun['svg-filters']()
      $svgNode.append  $(node) 
      # Black magic to keep case sensitive filters...
      $svgNode = $( new XMLSerializer().serializeToString($svgNode[0]) )
      $(".svg-holder").empty()
      $(".svg-holder").append $svgNode
      $(".svg-holder").css(opacity:0)
      $(".svg-holder").animate({opacity:1}, {duration:500})

      @activateMermaid()
    ,
      'xml'

  activateMermaid : () ->
    $( "[id^='C_x3E_']" ).on 'click', @onShapeClick
      
  onShapeClick : (e) ->
    obj = {}
    obj.fill = ColorPicker.currentColor
    if EffectsPicker.currentFilter != ""
      obj.filter = "url(##{EffectsPicker.currentFilter})"
    else
      obj.filter = ""
    
    $("path, polygon",$(e.currentTarget)).css obj
  
  
Mermaid = Mermaid