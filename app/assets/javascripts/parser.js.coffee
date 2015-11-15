# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class window.Parser
  constructor: (options)->
    @settings = $.extend {}, {
      submitButton: $("input[type='submit']")
      productIdField: $("#product_id")
      query:  $("#search_query")
      responseArea: $("#response")
    }, options

    { @url, @submitButton, @productIdField, @query, @responseArea } = @settings

    @submitButton.on "click", =>
      $.ajax(@url, data: product_id: @getProductId(), search_string: @getQuery() )
      .done (data) =>
        @responseArea.html(data)


  getProductId: ->
    @productIdField.val()

  getQuery: ->
    @query.val()
