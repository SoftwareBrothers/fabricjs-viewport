class fabric.CanvasWithViewport extends fabric.Canvas
  constructor: () ->
    @viewport = new fabric.Viewport(@)
    @isGrabMode = false
    @_isCurrentlyGrabbing = false
    super

  setZoom: (zoom) ->
    @viewport.setZoom(zoom)
    @renderAll()


  _onMouseMoveInGrabMode: (e) ->
    if @_isCurrentlyGrabbing
      @viewport.grab(e)
      @renderAll()
      true

  _onMouseDownInGrabMode: (e) ->
    @_isCurrentlyGrabbing = true
    @viewport.grabStart(e)
    

  _onMouseUpInGrabMode: (e) ->
    if @_isCurrentlyGrabbing
      @viewport.grabEnd(e)
      @_isCurrentlyGrabbing = false
      @renderAll()
    true

  _draw: (ctx, object) ->
    ctx.save()
    ctx.scale(@viewport.zoom, @viewport.zoom)
    ctx.translate(@viewport.translate().x, @viewport.translate().y)
    super
    ctx.restore()

  _drawSelection: () ->
    ctx = this.contextTop
    ctx.save()
    ctx.scale(@viewport.zoom,@viewport.zoom)
    ctx.translate(@viewport.translate().x, @viewport.translate().y)
    super
    ctx.restore()    

  __onMouseMove: (e) ->
    if @isGrabMode
      @_onMouseMoveInGrabMode(e)
      return
    super(@viewport.transform(e))

  __onMouseDown: (e) ->
    if @isGrabMode
      @_onMouseDownInGrabMode(e)
      return
    super(@viewport.transform(e))

  __onMouseUp: (e) ->
    if @isGrabMode
      @_onMouseUpInGrabMode(e)
      return
    super(@viewport.transform(e))
    