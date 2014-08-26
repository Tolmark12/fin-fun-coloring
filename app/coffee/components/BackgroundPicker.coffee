class BackgroundPicker extends Picker

  constructor: () ->
    options = [
      {thmb:"bg-ocean1-thmb.jpg", full:"bg-ocean1.jpg", default:true}
      {thmb:"bg-ocean2-thmb.jpg", full:"bg-ocean2.jpg"}
    ]
    super "backgroundPicker", options


  initEvents : () ->
    $(".option", @$node).on     'click', @onOptionClick
    super()
  
  # ---------------------- EVENT HANDLERS
  
  onOptionClick : (e) =>
    bgImage =  $(e.currentTarget).attr 'data_full'
    thmb    =  $(e.currentTarget).attr 'data_thmb'
    $('html').css "background-image":"url(/images/#{bgImage})"
    $('.active-box .image', @$node).css "background-image":"url(/images/#{thmb})"
    
  