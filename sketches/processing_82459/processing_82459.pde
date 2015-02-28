


import processing.video.*;

// Step 1. Declare Movie object
Movie movie; 


void setup() {
  size(320, 240, P2D);

  // Step 2. Initialize Movie object
  // Movie file should be in data folder
  movie = new Movie(this, "cat.mov"); 

  // Step 3. Start movie playing
  movie.loop();
}

// Step 4. Read new frames from movie
void movieEvent(Movie movie) {
  movie.read();
}

void draw() {

  loadPixels();
  // Step 5. Display movie.
  image(movie, 0, 0);
  
  // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < movie.width; x++ ) {
    for (int y = 0; y < movie.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*movie.width;

      // Get the R,G,B values from image
      float r = red (movie.pixels[loc]);
      float g = green (movie.pixels[loc]);
      float b = blue (movie.pixels[loc]);

      // We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position. 
      // That multiplier changes the RGB value of each pixel.      
      float adjustBrightness = ((float) mouseX / width) * 8.0; 
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // The RGB values are constrained between 0 and 255 before being set as a new color.      
      r = constrain(r,0,255); 
      g = constrain(g,0,255);
      b = constrain(b,0,255);

      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  
  updatePixels();  
 
}

