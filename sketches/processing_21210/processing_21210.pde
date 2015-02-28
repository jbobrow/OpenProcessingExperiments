
//source: http://processing.org/learning/pixels/

PImage img;
float x,y;
 
 
void setup() {
  size(800, 535);
  background(0);
  img = loadImage("money.jpg");
   for (int i = 0; i < 25000; i++) {
  x = random(width);
  y = random(height);
   
  color cp = img.get(int(x),int(y));
  float d = saturation(cp);
  if(d > 100){
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
   
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
      strokeWeight(.1); //creates outline
      stroke(0);
      fill(r,g,b,255);
      rect(x,y,10,10); //creates 'mosaic' effect
   
 
}
 
 
 
  
 
 
  
 
    }
  }


