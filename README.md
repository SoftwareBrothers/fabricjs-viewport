# fabricjs-viewport

[![KMPIT](http://kmpit.com/badge_kmpit.png)](http://bitly.com/kmpitcom) [![KMPIT](http://kmpit.com/badge_howwedoapps.png)](http://bitly.com/howwedoapps)

Simple implementation of viewport and zoom in fabricjs. 

1. Doesn't change data model, so every objects on your canvas wont be changed after zooming/grabbing
2. Supports touch devices
3. Supports free drawing mode

First [see an example](http://wojtek-krysiak.github.io/fabricjs-viewport/)

### How to use it

Currently it depends on jquery (i plan to fix it soon). So in HEAD of your HTML file include jquery, fabricjs and fabricjs-viewport. fabricjs-viewport.js is in this repo in the /dist/ folder.

For example from CDNs (order matters):

```javascript
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.4.0/fabric.min.js"></script>
<script src="fabricjs_viewport.js"></script>
```

Next if you need to use zooming or viewport changing in your project just use fabric.CanvasWithViewport insteed of fabric.Canvas

    var c = new fabric.CanvasWithViewport("id-of-your-canvas");

And now you will be able to:

Turn on grabbing mode:

```javascript
c.isGrabMode = true;
```

and you will be able to chage the viewport by drag and drop on the canvas.

You also will be able to change the zoom: 

```javascript
c.setZoom(c.viewport.zoom*1.1); // zoom in by 10%
```






### MIT License

Copyright (C) 2014 Wojciech Krysiak

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.