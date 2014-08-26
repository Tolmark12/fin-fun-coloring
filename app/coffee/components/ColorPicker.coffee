class ColorPicker

  constructor: () ->
    # Arrays of colors
    # left  = ['#FFFFFF', '#FFED8C', '#E3FE8C', '#B5F989', '#91FD8B', '#8CFEAC', '#8CFED5', '#8CFFFC', '#89D4F9', '#9CB4FB', '#968CFF', '#BE8CFF', '#F08CFF', '#FF8DE7', '#FE8CBD', '#FF9297', '#FFA28C', '#FFC38D', ]
    # mid   = ['#AAAAAA', '#FFD700', '#ADE300', '#57DE00', '#0BE200', '#00E340', '#00E391', '#00E7E1', '#0094DE', '#1044E0', '#1400E4', '#6500E8', '#C800E5', '#E501B5', '#E30062', '#E90510', '#E62B00', '#E96F01', ]
    # right = ['#222222', '#AF9300', '#709300', '#388E00', '#079200', '#009329', '#00935E', '#009793', '#005F8E', '#0A2C90', '#0D0094', '#420098', '#820095', '#950176', '#93003F', '#99030A', '#961C00', '#994901', ]

    left  = ['#FFFFFF', '#FFA28C', '#FFC38D', '#CDFD9A', '#ADEFFF', '#98CCB6', '#81C6CA', '#6DC2DB', '#58BBED', '#67B2E1', '#7AA8D1', '#919BBE', '#9E93B3', '#F0ACFF', '#FF8DE7', '#FE8CBD', '#EA6874', '#FF575B', ]
    mid   = ['#ACB3AF', '#FF8800', '#FFB100', '#FFD400', '#FFE800', '#60AD8A', '#35A2B0', '#1E9CC4', '#0492DA', '#1B83C6', '#3C6FA9', '#516296', '#6F507C', '#854268', '#9E3352', '#B32640', '#D41223', '#E90510', ]
    right = ['#402520', '#5D362F', '#865149', '#C99387', '#D2B2B3', '#5C8D5F', '#3A7D73', '#1D7084', '#075F8F', '#19547F', '#284B73', '#3B4062', '#4D3553', '#582E49', '#702034', '#7D1829', '#8D0E1B', '#A0030B', ]

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