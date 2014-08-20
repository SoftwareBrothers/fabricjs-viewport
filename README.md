# fabricjs-viewport

[![RST](http://rst-it.com/files/rstwithpassion.png)](http://rst-it.com) [![RST](http://rst-it.com/files/howwedoapps.png)](http://howwedoapps.com)

Simple implementation of viewport and zoom in fabricjs. 

1. Doesn't change data model, so none of the objects on your canvas is changed after zooming/grabbing
2. Supports touch devices
3. Supports free drawing mode

First [see an example](http://rstgroup.github.io/fabricjs-viewport/)

### How to use it

Currently it depends on jquery, however I plan to fix it soon.
In the HEAD of your HTML file include jQuery, fabricjs and fabricjs-viewport. You can find fabricjs-viewport.js in this repo in the /dist/ directory.

You can invclude those libraries from CDNs (order matters):

```javascript
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.4.0/fabric.min.js"></script>
<script src="fabricjs_viewport.js"></script>
```

Next if you need to use zooming or changing viewport in your project just use fabric.CanvasWithViewport insteed of fabric.Canvas

    var c = new fabric.CanvasWithViewport("id-of-your-canvas");

Now you are be able to:

Turn on grabbing mode:

```javascript
c.isGrabMode = true;
```

With this you can change the viewport with drag and drop on the canvas.

You also can zoom in and out: 

```javascript
c.setZoom(c.viewport.zoom*1.1); // zoom in by 10%
```






### MIT License

Copyright (C) 2014 Wojciech Krysiak

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
