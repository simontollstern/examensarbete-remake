#= require rails-ujs
#= require_tree .
#= require jquery
#= require jquery.turbolinks
#= require bootstrap-sprockets
#= require turbolinks

#-----------------------------------#
# Block slide                       #
#-----------------------------------#
$ ->
  $('.block').on 'click', ->
    if $(this).find('.block-bottom').is(':visible')
      $(this).find('.block-bottom').slideUp(300)
      $(this).removeClass('active')
    else
      $('.block-bottom').not($(this).find('.block-bottom')).slideUp(300)
      $('.block').removeClass('active')
      $(this).find('.block-bottom').slideDown(300)
      $(this).addClass('active')

  $('.block a').on 'click', (e) ->
    e.stopImmediatePropagation()

#-----------------------------------#
# Slide on notice                   #
#-----------------------------------#
$ ->
  if $('#notice').text() != ''
    $('.notice-box').slideDown(300).delay(1000).slideUp(300)

#-----------------------------------#
# Search - case insensitive psuedo  #
#-----------------------------------#
$ ->
  $.extend $.expr[':'], 'containsIN': (elem, i, match, array) ->
    (elem.textContent or elem.innerText or '').toLowerCase().indexOf((match[3] or '').toLowerCase()) >= 0

#-----------------------------------#
# Search                            #
#-----------------------------------#

# VARS FOR SEARCH & FILTER
current_filter = 'alla'
current_search = ''

$ ->
  $('#search').focus()

  $('#search').on 'keyup', ->
    current_search = $('#search').val()
    $('.block').hide()
    if current_filter == 'alla'
      $('.b-client:containsIN(' + $('#search').val() + ')').parent().show()
    else
      $('.b-client:containsIN(' + $('#search').val() + ')').parents('.'+current_filter).show()

#-----------------------------------#
# Filter                            #
#-----------------------------------#
$ ->
  $('.filter-radio').on 'click', (e) ->
    e.preventDefault()
    $('.filter-radio').removeClass('checked')
    $(this).addClass('checked')
    if $(this).is('#filter-alla')
      current_filter = 'alla'
      $('#search').focus()
      if current_search == ''
        $('.block').show()
      else
        $('.b-client:containsIN(' + current_search + ')').parent().show()
    if $(this).is('#filter-offerter')
      current_filter = 'offert'
      $('#search').focus()
      $('.block').hide()
      if current_search == ''
        $('.block.quotation').show()
      else
        $('.b-client:containsIN(' + current_search + ')').parents('.quotation').show()
    if $(this).is('#filter-ordrar')
      current_filter = 'order'
      $('#search').focus()
      $('.block').hide()
      if current_search == ''
        $('.block.commission').show()
      else
        $('.b-client:containsIN(' + current_search + ')').parents('.commission').show()
    if $(this).is('#filter-projekt')
      current_filter = 'projekt'
      $('#search').focus()
      $('.block').hide()
      if current_search == ''
        $('.block.project').show()
      else
        $('.b-client:containsIN(' + current_search + ')').parents('.project').show()
    if $(this).is('#filter-fakturor')
      current_filter = 'faktura'
      $('#search').focus()
      $('.block').hide()
      if current_search == ''
        $('.block.invoice').show()
      else
        $('.b-client:containsIN(' + current_search + ')').parents('.invoice').show()


  val = {}
  $('.sidebar option').each ->
    if(val[this.text])
       $(this).remove()
    else
       val[this.text] = this.value

  checked = false
  $('.filter-check').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass('checked')
    $('#search').focus()
    if checked == false
      $('.block').hide()
      $('.block.' + $('.select1 option').val() + '.' + $('.select2 option').val()).show()
      checked = true
    else
      $('.block').show()
      checked = false
