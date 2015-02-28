
PImage img;

void setup() {
  size(500,500);
  img = loadImage( "1.jpg" );
}

void draw() {
  loadPixels();
  

  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {
      

      int loc = x + y*img.width;
      
  
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      
      float distance = dist(x,y,mouseX,mouseY);
      
      float adjustBrightness = (180-distance)/180;
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


