class EffectsPicker extends Picker
  constructor: () ->
    options = [
      {thmb:"fx-normal.gif", full:'', default:true}
      {thmb:"fx-blur.gif", full:'blur' }
    ]
    super "effectsPicker", options


  initEvents : () ->
    $(".option", @$node).on     'click', @onOptionClick
    super()
  
  # ---------------------- EVENT HANDLERS
  
  onOptionClick : (e) =>
    EffectsPicker.currentFilter = fxClass =  $(e.currentTarget).attr 'data_full'
    thmb    =  $(e.currentTarget).attr 'data_thmb'
    $('.active-box .image', @$node).css "background-image":"url(/images/#{thmb})"
    
  