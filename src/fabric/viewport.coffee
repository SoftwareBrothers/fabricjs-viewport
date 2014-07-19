class fabric.Viewport
  constructor: (canvas) ->
    @i = 0
    @position = new fabric.Point(0,0)
    @zoom = 1
    @canvas = canvas
    @_resetGrab()
    true

  grabStart: (e) ->
    @grabStartPointer = @canvas.getPointer(e)

  grab: (e) ->
    @grabPointer = @canvas.getPointer(e)

  grabEnd: (e) ->
    diff = new fabric.Point(@canvas.getPointer(e).x - @grabStartPointer.x, @canvas.getPointer(e).y - @grabStartPointer.y)
    @position = @position.add(diff)
    @_resetGrab()

  _resetGrab: () ->
    @grabStartPointer = {x: 0, y: 0}
    @grabPointer = {x: 0, y: 0}

  setZoom: (newZoom) ->
    @_adjustPositionAfterZoom(newZoom)
    @zoom = newZoom

  _adjustPositionAfterZoom: (newZoom) ->
    width = @canvas.width
    height = @canvas.height
    @position.x += ((@zoom * width) - (newZoom * width)) / 2;
    @position.y += ((@zoom * height) - (newZoom * height)) / 2;

  translate: () ->
    {
      x: (@position.x + @grabPointer.x - @grabStartPointer.x)/@zoom
      y: (@position.y + @grabPointer.y - @grabStartPointer.y)/@zoom
    }

  transform: (event) ->
    touchProp = if event.type == 'touchend' then 'changedTouches' else 'touches'

    if event[touchProp] && event[touchProp][0]
      ex = {}
      ex[touchProp] = _.map(event[touchProp], (t) => @_transformEventParams(t) )
      $.extend($.Event(event.type), ex)
    else
      $.extend($.Event(event.type), @_transformEventParams(event))

  _transformEventParams: (e) ->
    offsetTop = @canvas.wrapperEl.getBoundingClientRect().top
    offsetLeft = @canvas.wrapperEl.getBoundingClientRect().left
    {
      which: 1
      clientX: (e.clientX-offsetLeft)/@zoom+offsetLeft - @translate().x,
      clientY: (e.clientY-offsetTop)/@zoom+offsetTop - @translate().y,
      pageX: e.pageX - @translate().x,
      pageY: e.pageY - @translate().y,
      screenX: e.screenX - @translate().x,
      screenY: e.screenY - @translate().y
    }
