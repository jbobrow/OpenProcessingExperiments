
/* @pjs preload="jojowonder.jpg"; */

size(500,500);

PImage img;
img = loadImage("jojowonder.jpg");
tint(255, 51);
image(img, 10, 10, 300, 300);
for ( int i = 0; i < 20; i++) {
  image(img, i*20, 0);
}



