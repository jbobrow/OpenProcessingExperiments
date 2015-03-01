
PImage source;       // Source image
PImage destination;  // Destination image

void setup() {
  size(800, 800);
  source = loadImage("chicken.jpg");  
  // The destination image is created as a blank image the same size as the source.
  destination = createImage(source.width, source.height, RGB);
}

void draw() {  
  float threshold = 170;
  float threshold1 = 85;

  // We are going to look at both image's pixels
  source.loadPixels();
  destination.loadPixels();
  source.resize(width, height);
  destination.resize(width, height);
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) > threshold) {
        destination.pixels[loc]  = color(255, 0, 0);  // White
      } else if (brightness(source.pixels[loc]) > threshold1) {
        destination.pixels[loc]  = color(255);    // Black
      } else {
        destination.pixels[loc]  = color(0);
      }
    }
  }



  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination
  image(destination, 0, 0);
  textSize(100);
  fill(0);
  text("Cluck", 100, 500);
  text("Cluck", 450, 500);
  text("MothaClucka", 120, 700);
}



