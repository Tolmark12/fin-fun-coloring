class MermaidPicker extends Picker

  constructor: () ->
    options = [
      {thmb:"crystal-thmb.gif",  full:"ColoringCrystal.svg", default:true}
    ]
    super "mermaidPicker", options


  initEvents : () ->
    $(".option", @$node).on 'click', @onOptionClick
    super()
  
  # ---------------------- EVENT HANDLERS
  
  onOptionClick : (e) =>
    thmb    =  $(e.currentTarget).attr 'data_thmb'
    $('.active-box .image', @$node).css "background-image":"url(/images/#{thmb})"
    PubSub.publish 'CHANGE_MERMAID', "/images/#{$(e.currentTarget).attr('data_full')}"
    
    # bgImage =  $(e.currentTarget).attr 'data_full'
    # $('html').css "background-image":"url(/images/#{bgImage})"
    
  