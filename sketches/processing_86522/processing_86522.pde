
// Declaring a variable of type PImage
PImage img;  

void setup() {

  // Make a new instance of a PImage by loading an image file
  img = loadImage("flowr3.jpg");
  size(500,404);
  frameRate(1);
}

void draw() {
  image(img,0,0);
  loadPixels();
  println("test");
  // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red (pixels[loc]);
      float g = green (pixels[loc]);
      float b = blue (pixels[loc]);

      //      // We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position. 
      //      // That multiplier changes the RGB value of each pixel.      
      //      float adjustBrightness = ((float) mouseX / width) * 8.0; 
      //      r *= adjustBrightness;
      //      g *= adjustBrightness;
      //      b *= adjustBrightness;

      if (frameCount%2==0) {
        float temp = r;
        r=g;
        g=temp;
      }
      if (frameCount%4==0) {
        float temp = r;
        r=b;
        b=temp;
      }
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


