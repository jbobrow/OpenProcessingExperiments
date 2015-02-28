
// based on: Example 15-7: Displaying the pixels of an image
// from Learning Processing, by Daniel Shiffman
// http://www.learningprocessing.com


PImage img;

/*
 * TO DO: image to lowRes
 * 
 *    1. read pixel/ get 
 *
 *    2. adjusting real image to loRes img, using map
 *
 *    3. using set  
 *       draw line
 *
 * 
 


void setup() {
  size(200, 200);
  img = loadImage("sunflower.jpg");
}

void draw() {
  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  img.loadPixels();
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      pixels[loc] = color( r, g, b );
    }
  }

  updatePixels();
}
