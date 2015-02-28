
PImage img;

void setup() {
  size(500,340);
  img = loadImage( "deer.jpg" );
}

void draw() {
  loadPixels();
  
  
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {
      
      // Calculate the 1D pixel location
      int loc = x + y*img.width;
      
      // Get the R,G,B values from image
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
   
      float distance = dist(x,y,mouseX,mouseY);
      
    
      float adjustBrightness = (50-distance)/50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      
      
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      
     
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  
  updatePixels();  
}

