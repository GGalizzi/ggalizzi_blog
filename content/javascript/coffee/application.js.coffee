$(document).ready ->
  list = $('#sidebar').find('ul')

  $('#sidebar').on 'click', 'h2', ->
    list.slideUp(200)
    if $(this).next('ul').is(':hidden')
      $(this).next('ul').slideDown(200)

  $('#sorted_articles').find('a')[0].text.replace("Ruby", "asdasd")
