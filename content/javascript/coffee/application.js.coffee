$(document).ready ->
  list = $('#menu').find('ul')

  $('#menu').on 'click', 'h2', ->
    list.slideUp(200)
    if $(this).next('ul').is(':hidden')
      $(this).next('ul').slideDown(200)

  $(window).scroll ->
    $this = $('#to_top')
    if $(window).scrollTop() > 200
      $this.fadeIn("slow")
    else
      $this.fadeOut("slow")


  menu = $('#menu')
  if $('#menu').css("position") == "fixed"
    menu.animate(
      width: "100%",
      opacity: 0.8,
      500)
  else
    menu.animate(
      width: "100%",
      opacity: 1,
      10)


  $('#menu').sticky(center: true)


