
// simple sketch to illustrate how to find the brightest pixels in an image

PImage img;
float thresh = 240; //threshold (0-255) -- whatever is brighter than this will be shown

void setup() {
  size(300, 300);
  img = loadImage("nick.jpg");
  img.loadPixels(); // load the pixels
}

void draw() {
  background(0);
  stroke(255);
  // iterate through all of the pixels in our image
  for (int i=0; i<img.pixels.length;i++) {
    // if the brightness of the pixel is more than the threshold...
    if (brightness(img.pixels[i]) > thresh) {
      //... then draw a point
      
      // simple algorithm to recover x,y coordinates from an image array index:
      // x = divide the index by the width of the image, the remainder (modulo) will be the x-coordinate of the row
      // y = i divided by image width, rounded to the nearest whole number, returns the row number (y-coordinate)
      point(i % img.width, floor(i/img.width));
    }
  }
}


