$ ->
  c = document.getElementById("main_canvas");
  ctx = c.getContext("2d");
  w = c.width = $(window).width()
  h = c.height = $(window).width()

  x = 0
  y = 0
  z = 0
  max = 10

  update = ->
  draw = ->
    ctx.clearRect(0, 0, w, h)
    ctx.lineWidth = 2
    ctx.strokeStyle = "#FF0000"
    ctx.fillStyle   = "#FF0000";

    ctx.beginPath()
    ctx.moveTo(w/2, h/2);
    ctx.lineTo(w/2 + x/max * w/2, h/2 + y/max * h/2);
    ctx.stroke();

    ctx.beginPath()
    ctx.arc(
      w/2 + x/max * w/2,
      h/2 + y/max * h/2,
      8, 0, 2 * Math.PI, false)
    ctx.fill()



  setInterval ->
    update()
    draw()
  , 33

  devicemotionHandler = (event) ->
    x = event.acceleration.x
    y = event.acceleration.y
    z = event.acceleration.z

  window.addEventListener "devicemotion", devicemotionHandler

getSign = (n) ->
  if n >= 0
    "+"
  else
    "-"

getFormated = (n) ->
  num = Math.floor( Math.abs(n) * 100) / 100
  num.toString()
