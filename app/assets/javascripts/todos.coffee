class TodoList
  constructor: (item) ->
    @item = $(item)
    @todos = $.map @item.find("[data-behavior='todo']"), (item, i) ->
      new Todo(item)

class Todo
  constructor: (item) ->
    @item = $(item)
    @id   = @item.data("id")
    @setEvents()

  setEvents: ->
    @item.find("[data-behavior='todo-toggle']").on "click", @handleToggle

  handleToggle: =>
    $.ajax(
      url: "/todos/#{@id}/complete",
      method: "PATCH"
      dataType: "JSON"
      success: @handleToggleSuccess
    )

  handleToggleSuccess: (data) =>
    if data.completed
      @item.find("[data-behavior='todo-description']").html "<del>#{data.description}</del>"
    else
      @item.find("[data-behavior='todo-description']").html data.description

jQuery ->
  new TodoList $("[data-behavior='todo-list']")
