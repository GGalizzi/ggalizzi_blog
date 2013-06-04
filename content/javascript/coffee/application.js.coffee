$(document).ready ->
  list = $('#sidebar').find('ul')

  $('#sidebar').on 'click', 'h2', ->
    list.slideUp(200)
    if $(this).next('ul').is(':hidden')
      $(this).next('ul').slideDown(200)

  $(window).scroll ->
    $this = $('#to_top')
    if $(window).scrollTop() > 200
      $this.fadeIn("slow")
    else
      $this.fadeOut("slow")
