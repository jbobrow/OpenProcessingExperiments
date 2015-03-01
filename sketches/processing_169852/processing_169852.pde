
/* @pjs preload = "geod.JPG"' */

PImage geod;
void setup() {
size(300, 300);
geod = loadImage("geod.JPG");
geod.loadPixels();
stroke (95, 15, 86, 65);
}
void draw() {
background(255);
int my = mouseX;
for (int i = 0; i < geod.height; i++) {
color c = geod.pixels[my*width + i*2]; // Get a pixel
float r = red(c); // Get the red value
ellipse(i*2, i*2, width/r, width/ r);
}
}



