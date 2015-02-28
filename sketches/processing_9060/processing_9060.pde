

// fabric texture like
// adopted from Shiffman(http://www.shiffman.net/teaching/nature/) "cloud" screen
// schien@mail.ncku.edu.tw

void setup() {
  size(200, 200);
  background(0);
  //noLoop();
}

void draw() {
  loadPixels();
  float increment = map(mouseX, 0, width, 0.005, 0.3);
  float xoff = 0.0; // Start xoff at 0
  float yoff = 0.0;   // For every xoff, start yoff at 0
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff
    //yoff = 0.0;
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      // Calculate noise and scale by 255
      float bright = noise(xoff,yoff)*255;
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();
}



