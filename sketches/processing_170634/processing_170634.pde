
/* @pjs preload= "eye.jpg"; */
size(1968, 1968);

PImage eye = loadImage("eye.jpg");
background(eye);
loadPixels();
for (int i = 0; i < width*height; i++) {
  color p = pixels[i];
  float r = 255 - red(p);
  float g = 255 - green(p);
  float b = 255 - blue(p);
  pixels[i] = color(r, g, b);
}
updatePixels();


