
PImage source;       // Source image
PImage destination;  // Destination image
PImage matrix;

void setup() {
  textMode(CENTER);
  size(480,600);
  matrix = loadImage("matrix.gif");
  source = loadImage("paul.jpg");  
  // The destination image is created as a blank image the same size as the source.
  destination = createImage(source.width, source.height, RGB);
}

void draw() {  
  destination.resize(width,height);
  source.resize(width,height);
  float threshold = 187;

  // We are going to look at both image's pixels
  source.loadPixels();
  destination.loadPixels();
  
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) > threshold) {
        destination.pixels[loc]  = color(#0AE800);  // White
      }  else {
        destination.pixels[loc]  = color(0);    // Black
      }
    }
  }

  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination
  
  
  //destination.resize(width,height);
  image(destination,0,0);
  //stroke(0,0,255);
  tint(255,127);  
  matrix.resize(source.width, source.height);
  image(matrix,0,0);
  textSize(30);
  stroke(255,0,0);
  
  text("CODE", width/2-30, height-50);
}


