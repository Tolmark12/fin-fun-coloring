class MermaidPicker extends Picker

  constructor: () ->
    options = [
      {full:"ColoringDestiny.svg",   thmb:"destiny-thmb.png", default:true }
      {full:"ColoringAustralia.svg", thmb:"australia-thmb.png" }
      {full:"ColoringBrynne.svg",    thmb:"brynne-thmb.png" }
      {full:"ColoringCrystal.svg",   thmb:"crystal-thmb.png" }
      {full:"ColoringJia.svg",       thmb:"jia-thmb.png" }
      {full:"ColoringSelena.svg",    thmb:"selena-thmb.png" }
      {full:"ColoringWaverlee.svg",  thmb:"waverlee-thmb.png" }
    ]
    super "mermaidPicker", options


  initEvents : () ->
    $(".option", @$node).on 'click', @onOptionClick
    super()
  
  # ---------------------- EVENT HANDLERS
  
  onOptionClick : (e) =>
    thmb    =  $(e.currentTarget).attr 'data_thmb'
    # $('.active-box .image', @$node).css "background-image":"url(/images/#{thmb})"
    $('.active-box .image', @$node).css "background-image":"url(/images/#{thmb})"
    PubSub.publish 'CHANGE_MERMAID', "/images/#{$(e.currentTarget).attr('data_full')}"
    
    # bgImage =  $(e.currentTarget).attr 'data_full'
    # $('html').css "background-image":"url(/images/#{bgImage})"
    
  