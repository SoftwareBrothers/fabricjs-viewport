old = fabric.PencilBrush.prototype._render

fabric.PencilBrush.prototype._render = () ->
  if @canvas.viewport
    ctx  = this.canvas.contextTop
    ctx.save()
    ctx.scale(@canvas.viewport.zoom, @canvas.viewport.zoom)
    ctx.translate(@canvas.viewport.translate().x, @canvas.viewport.translate().y)
    old.apply(this)
    ctx.restore()
  else
    old.apply(this)
  