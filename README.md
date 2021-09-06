# Rendering a toroid as a solid of revolution in processing.

In this processing sketch, I rendered this toroid just by drawing a circle (using its polar equations across an angle) and then rotating the whole circle across the y and x-axis. The first rotation creates the illusion of a toroid and the second makes the toroid turn around the x-axis.

As it's a 3d image, I turned each point into a 2d one by projecting its coordinates as explained in the image (took from [this awesome post](https://www.a1k0n.net/2011/07/20/donut-math.html):

![explanation image - from a1k0n.net](https://www.a1k0n.net/img/perspective.png "explanation image - from a1k0n.net")

Here you can see a preview of the program running:

![demo](https://user-images.githubusercontent.com/35054698/132264136-1a6f319f-4594-400b-a9e4-ad3e868c786e.mp4)

