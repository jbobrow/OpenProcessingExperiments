
PImage source;       // Source image
PImage destination;  // Destination image

void setup() {
  size(500, 600);
  source = loadImage("moo.jpg");  
  // The destination image is created as a blank image the same size as the source.
  destination = createImage(source.width, source.height, RGB);
}

void draw() {  
  float threshold = 30;
  float threshold1 = 110;
  float threshold2 = 250;

  // We are going to look at both image's pixels
  source.loadPixels();
  destination.loadPixels();
  
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) < threshold) {
        destination.pixels[loc]  = color(20,40,150);  // dark blue
      } 
       if (brightness(source.pixels[loc]) > threshold && brightness(source.pixels[loc]) < threshold1) {
        destination.pixels[loc]  = color(20,40,250);  // blue
      }
       if (brightness(source.pixels[loc]) < threshold2 && brightness(source.pixels[loc]) > threshold1) {
        destination.pixels[loc]  = color(150,40, 30);  // red
      }
      else {
        destination.pixels[loc]  = color(255,250,250);    // off white
      
    }
  }
  

  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination
  image(destination,0,0);
}
}

