class ColorPicker

  constructor: () ->
    # Arrays of colors
    left  = ['#FFED8C', '#E3FE8C', '#B5F989', '#91FD8B', '#8CFEAC', '#8CFED5', '#8CFFFC', '#89D4F9', '#9CB4FB', '#968CFF', '#BE8CFF', '#F08CFF', '#FF8DE7', '#FE8CBD', '#FF9297', '#FFA28C', '#FFC38D', ]
    mid   = ['#FFD700', '#ADE300', '#57DE00', '#0BE200', '#00E340', '#00E391', '#00E7E1', '#0094DE', '#1044E0', '#1400E4', '#6500E8', '#C800E5', '#E501B5', '#E30062', '#E90510', '#E62B00', '#E96F01', ]
    right = ['#AF9300', '#709300', '#388E00', '#079200', '#009329', '#00935E', '#009793', '#005F8E', '#0A2C90', '#0D0094', '#420098', '#820095', '#950176', '#93003F', '#99030A', '#961C00', '#994901', ]

    node    = finfun['color-picker'] left:left, mid:mid, right:right 
    @$node  = $(node)
    $('body').prepend @$node

    $('.swatch', @$node).on 'click', @onSwatchClick
    $('.swatch', @$node).trigger 'click'

  onSwatchClick : (e) =>
    @setColor $(e.currentTarget).attr('style').split(':')[1]
  
  setColor : (color) ->
    ColorPicker.currentColor = color
    $(".picked-color").css background: color
  
    
ColorPicker = ColorPicker