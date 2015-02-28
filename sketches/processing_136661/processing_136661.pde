
/*This sketch takes an image file (a .jpg here) and reads a single
line of pixels across the x (horizontal) axis.  Remember, when reading
pixels, you are  reading the color value at the location (x,y).
The color value  is then used to color the stroke of a line along the
run of the y (vertical) axis. */

PImage theImage;

void setup() {
  size(640, 427); // this is the size of the image
  theImage = loadImage("lotus.jpg"); //loads the file
}

void draw() {
  for (int x = 0; x <= width; x++) {
    color theColor = theImage.get(x, mouseY);
    stroke(theColor);
    line(x, 0, x, height);
  }

  if (mousePressed) {
    image(theImage, 0, 0);
  }
}




