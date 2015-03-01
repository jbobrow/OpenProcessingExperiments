
PImage source;       // Source image
PImage destination;  // Destination image

void setup() {
  size(1000, 1500);
  source = loadImage("dr.jpg");  
  // The destination image is created as a blank image the same size as the source.
  destination = createImage(source.width, source.height, RGB);
}

void draw() {  
  float threshold = 125;

 
  source.loadPixels();
  destination.loadPixels();
  
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) > threshold) {
        destination.pixels[loc]  = color(#0552AD,#AD2F05);  
      }  else {
        destination.pixels[loc]  = color(#03FA0C);    
      }
    }
  }

  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination
  image(destination,0,0);
}


