
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-8: Adjusting image brightness

PImage img;
PImage img2;

void setup() {
  size(500,335);
  img = loadImage("futura.jpg");
  img2 = loadImage("futura2.jpg");
  
}

void draw() {
  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  
    if(mouseX > 450) {
     for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      

      // We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position. 
      // That multiplier changes the RGB value of each pixel.      
      float adjustBrightness = ((float) mouseX / width) * 100.0; 
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

  }
  
  else if(mouseX < 250){
    for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      

      // We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position. 
      // That multiplier changes the RGB value of each pixel.      
      float adjustBrightness = ((float) mouseX / width) * 5.0; 
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
  }
  

  
 


  
 updatePixels();
}

