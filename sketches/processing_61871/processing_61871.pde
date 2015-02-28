
// Declaring a variable of type PImage
PImage img;
 
void setup() {
  size(563, 760);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("bodhi.jpg");
  image(img, 0, 0);
}
int count=250;
int delta=-1;
void draw() {
  loadPixels();
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {
 
      // Calculate the 1D pixel location
      int loc = x + y*img.width;
 
      
      float r = red(img.pixels[loc]) * (float)(count%256)/255;
      float g = green(img.pixels[loc]) * (float)(count%256)/255;
      float b = blue(img.pixels[loc]) * (float)(count%256)/255;
      
      // The RGB values are constrained between 0 and 255 before being set as a new color.     
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);

      color c = color(r,g,b);
      pixels[loc] = c;
        
    }
  }  
  updatePixels();
  delay(10);
  count = count + delta;
  if(count == 255 || count == 0)
   delta = (delta)*(-1); 
}

