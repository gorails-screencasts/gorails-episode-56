class Todo
  constructor: (item) ->
    @item = $(item)
    @id   = @item.data("id")
    @setEvents()

  setEvents: ->
    @item.children("input[type='checkbox']").on "click", @handleToggle

  handleToggle: =>
    $.ajax(
      url: "/todos/#{@id}/complete",
      method: "PATCH"
      dataType: "JSON"
      success: @handleToggleSuccess
    )

  handleToggleSuccess: (data) =>
    if data.completed
      @item.children("span").html "<del>#{data.description}</del>"
    else
      @item.children("span").html data.description

jQuery ->
  todos = $.map $("li"), (item, i) ->
    new Todo(item)
