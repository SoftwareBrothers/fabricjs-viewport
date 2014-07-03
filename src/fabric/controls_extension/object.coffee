_drawControl = fabric.Object.prototype._drawControl

fabric.Object.prototype._drawControl = (control, ctx, methodName, left, top) ->
  zoom = @canvas.viewport?.zoom || 1
  ctx.lineWidth = 1 / Math.max(@scaleX, @scaleY) / zoom
  _drawControl.apply(@, [control, ctx, methodName, left, top])
  
drawControls = fabric.Object.prototype.drawControls

fabric.Object.prototype.drawControls = (ctx) ->
  zoom = @canvas?.viewport?.zoom || 1
  @cornerSize = @cornerSize / zoom
  ret = drawControls.apply(@, [ctx])
  @cornerSize = @cornerSize * zoom
  ret

_setCornerCoords = fabric.Object.prototype._setCornerCoords

fabric.Object.prototype._setCornerCoords = () ->
  zoom = @canvas?.viewport?.zoom || 1
  @cornerSize = @cornerSize / zoom
  ret = _setCornerCoords.apply(@)
  @cornerSize = @cornerSize * zoom
  ret


fabric.Object.prototype.drawBorders = (ctx) ->
  return @ unless this.hasBorders
  zoom = @canvas?.viewport?.zoom || 1

  padding = this.padding
  padding2 = padding * 2
  strokeWidth = ~~(this.strokeWidth / 2) * 2

  ctx.save()

  ctx.globalAlpha = if this.isMoving then this.borderOpacityWhenMoving else 1
  ctx.strokeStyle = this.borderColor

  scaleX = 1 / this._constrainScale(this.scaleX)
  scaleY = 1 / this._constrainScale(this.scaleY)

  ctx.lineWidth = 1 / this.borderScaleFactor / zoom;

  ctx.scale(scaleX, scaleY)

  w = this.getWidth()
  h = this.getHeight()

  ctx.strokeRect(
    (-(w / 2) - padding - strokeWidth / 2 * this.scaleX) - 0.5 / zoom,
    (-(h / 2) - padding - strokeWidth / 2 * this.scaleY) - 0.5 / zoom,
    (w + padding2 + strokeWidth * this.scaleX) + 1 / zoom,
    (h + padding2 + strokeWidth * this.scaleY) + 1 / zoom
  )

  if this.hasRotatingPoint && this.isControlVisible('mtr') && !this.get('lockRotation') && this.hasControls
    rotateHeight = (
      if this.flipY then h + ((strokeWidth * this.scaleY) + (padding * 2))*zoom else -h - ((strokeWidth * this.scaleY) + (padding * 2))*zoom
    ) / 2

    ctx.beginPath()
    ctx.moveTo(0, rotateHeight)
    ctx.lineTo(0, rotateHeight + (if this.flipY then this.rotatingPointOffset else -this.rotatingPointOffset))
    ctx.closePath()
    ctx.stroke()

  ctx.restore()
  return @




