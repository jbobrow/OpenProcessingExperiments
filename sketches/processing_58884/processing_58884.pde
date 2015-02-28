
// Declaring a variable of type PImage
PImage img;
 
void setup() {
  size(500,332);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("monks.jpg");
  image(img, 0, 0);
}
 
void draw() {
  loadPixels();
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {
 
      // Calculate the 1D pixel location
      int loc = x + y*img.width;
 
      // randomly scale brightness based on x coordinate of the mouse
      float r = (random(0, 255)/(((float)mouseX/width) * 127))*red(img.pixels[loc]);
      float g = (random(0, 255)/(((float)mouseX/width) * 127))*green(img.pixels[loc]);
      float b = (random(0, 255)/(((float)mouseX/width) * 127))*blue(img.pixels[loc]);
      
      // The RGB values are constrained between 0 and 255 before being set as a new color.     
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);

      color c = color(r,g,b);
      pixels[loc] = c;  
    }
  }
  
  updatePixels(); 
}

