
//Load an image and display its height and width to the console using Pimage.
/* @pjs preload="onehead.jpg"; */

size (200, 356);
PImage img;
img = loadImage("onehead.jpg");
image(img, 0,0);
int w =img.width;
int h =img.height;
println(w);
println(h);



