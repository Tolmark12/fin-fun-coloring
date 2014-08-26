class Mermaid 

  constructor: () ->
    @loadMermaid()

  loadMermaid : (url="images/ColoringCrystal.svg") ->
    $.get url, null, (data) =>
      $svgNode  = $("svg", data)

      # Add filters to the svg node
      node     = finfun['svg-filters']()
      $svgNode.append  $(node) 
      # Black magic to keep case sensitive filters...
      $svgNode = $( new XMLSerializer().serializeToString($svgNode[0]) )
      $(".svg-holder").append $svgNode

      @activateMermaid()
    ,
      'xml'

  activateMermaid : () ->
    $( "[id^='C_x3E_']" ).on 'click', @onShapeClick
      
  onShapeClick : (e) ->
    $("path",$(e.currentTarget)).css fill : ColorPicker.currentColor
  
  
Mermaid = Mermaid