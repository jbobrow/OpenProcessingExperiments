
// Declaring a variable of type PImage
PImage img;	

void setup() {
  size(500, 404);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("flowr3.jpg");
}

void draw() {
  int change = 0;

  if (keyPressed) {
    if (key == 'r' || key == 'R' ) change = 1;
    if (key == 'g' || key == 'G' ) change = 2;
    if (key == 'b' || key == 'B' ) change = 3;
  }
  if (change==0) {
    image(img, 0, 0);
  } 
  else {
    loadPixels();

    // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
    for (int x = 0; x < img.width; x++ ) {
      for (int y = 0; y < img.height; y++ ) {

        // Calculate the 1D pixel location
        int loc = x + y*img.width;

        // Get the R,G,B values from image
        float r = red (img.pixels[loc]);
        float g = green (img.pixels[loc]);
        float b = blue (img.pixels[loc]);

        if (change==1) r=255;
        if (change==2) g=255;
        if (change==3) b=255;

        // The RGB values are constrained between 0 and 255 before being set as a new color.      
        r = constrain(r, 0, 255); 
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);

        // Make a new color and set pixel in the window
        color c = color(r, g, b);
        pixels[loc] = c;
      }
    }

    updatePixels();
  }
}


