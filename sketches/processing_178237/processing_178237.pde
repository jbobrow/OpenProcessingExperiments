
PImage source;       // Source image
PImage destination;  // Destination image


void setup() {
  size(480, 600);

  source = loadImage("cagecat.png");  
  // The destination image is created as a blank image the same size as the source.
  destination = createImage(source.width, source.height, RGB);
}

void draw() {  
  destination.resize(width, height);
  source.resize(width, height);
  float threshold2 = 100;
  float threshold1 = 150;
  float threshold = 200;

  // We are going to look at both image's pixels
  source.loadPixels();
  destination.loadPixels();

  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) > threshold) {
        destination.pixels[loc]  = color(0, 0, 255);  
        
      } else if (brightness(source.pixels[loc])> threshold1) {
        destination.pixels[loc]  = color(255, 0, 0);
        
      }// else if (brightness(source.pixels[loc])> threshold2) {
       // destination.pixels[loc]  = color(255);
        
     // }
      else {
        destination.pixels[loc]  = color(0);    // Black
      }
    }
  }

  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination


  //destination.resize(width,height);
  image(destination, 0, 0);
  //stroke(0,0,255);
  tint(255, 127);
}



