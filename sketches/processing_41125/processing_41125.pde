
PImage img;
PImage photo3;
void setup() {
  size(600,600);
  img = loadImage( "photo2.jpg" );
   photo3=loadImage("photo3.png");
}

void draw() {
   
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
      
      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x,y,mouseX,mouseY);
      
      // The closer the pixel is to the mouse, the lower the value of "distance" 
      // We want closer pixels to be brighter, however, so we invert the value with the formula: adjustBrightness = (50-distance)/50 
      // Pixels with a distance of 50 (or greater) have a brightness of 0.0 (or negative which is equivalent to 0 here)
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = (150-distance)/50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      
      // Constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      
      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
   
    }
  }
  
  updatePixels();
imageMode(CENTER) ; 
tint(distance(0,0,mouseX,mouseY),distance(width,0,mouseX,mouseY),distance(width,height,mouseX,mouseY));
     image(photo3,mouseX,mouseY,100,100);
}
float distance(float x1, float y1,float x2, float y2){ //return value of the distance of mouse position and setting point)
  float dx=x1-x2;
  float dy=y1-y2;
  float d=sqrt(dx*dx-dy*dy);
  return d;}

