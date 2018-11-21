# fabricjs-viewport

Simple implementation of viewport and zoom in fabricjs. 

1. Doesn't change data model, so none of the objects on your canvas is changed after zooming/grabbing
2. Supports touch devices
3. Supports free drawing mode

First [see an example](http://softwarebrothers.github.io/fabricjs-viewport/)

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

## License

fabricjs-viewport is Copyright © 2018 SoftwareBrothers.co. It is free software, and may be redistributed under the terms specified in the [LICENSE](LICENSE.md) file.

## About SoftwareBrothers.co

<img src="https://softwarebrothers.co/assets/images/software-brothers-logo-full.svg" width=240>


We are a software company who provides web and mobile development and UX/UI services, friendly team that helps clients from all over the world to transform their businesses and create astonishing products.

* We are available to [hire](https://softwarebrothers.co/contact).
* If you want to work for us - checkout the [career page](https://softwarebrothers.co/career).
