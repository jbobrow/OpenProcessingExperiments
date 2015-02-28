

// flying out of "clouds"
// adopted from Shiffman(http://www.shiffman.net/teaching/nature/)
// schien@mail.ncku.edu.tw

void setup() {
  size(200, 200);
  background(0);
  //noLoop();
  frameRate(16);
}
float increment = 0.001;
void draw() {
  loadPixels();
  //float increment = random(0, 0.1);
  float xoff = 0.0; // Start xoff at 0
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff -= increment; // Increment yoff
      // Calculate noise and scale by 255
      float bright = noise(xoff,yoff)*255;
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();
  increment += 0.0001; // gradual incrementation
}

void mouseReleased() {
  saveFrame("screen.jpg");
  background(0);
  redraw();
}

