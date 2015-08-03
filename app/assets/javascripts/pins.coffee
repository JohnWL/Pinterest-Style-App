# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachRatingHandler = ->
  $("span.star").on "click", ->
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true

$(document).ready attachRatingHandler
$(document).on "page:load", attachRatingHandler