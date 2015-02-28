
/* @pjs preload="lizard.jpg"; */

// Set mode to P3D to draw shapes with textures
size(100, 100, P3D);

noStroke();

PImage img = loadImage("lizard.jpg");

// Draw Shape using vertices
beginShape();

// Change textureMode so uv's are 0->1
// 1 is 100% so 0,0 is top left corner of image, 1,1 is bottom right or 100% width and height
// if you set the textureMode(IMAGE) you can use the coordinates of the image in pixels for u, v (if you just wanted to use part of an image for example
textureMode(NORMAL);

// set texture
texture(img);

// Top Left (x, y, u, v)
vertex(10, 20, 0, 0);

// Top Right 
vertex(80, 5, 1, 0);

// Bottom Right
vertex(95, 90, 1, 1);

// Bottom Left
vertex(40, 95, 0, 1);

// tell processing were done with our shape
endShape();

// If you don't need to skew your image just easily make it different
// size rects you can use image and change the imageMode

// change imageMode so you can just specify x,y, x2, y2 instead of x,y, width, height
imageMode(CORNERS);

// Draw stretched image from 10, 10 to 90, 40
image(img, 10, 10, 90, 40); 


