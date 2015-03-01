

PImage Imma;
 
void setup(){
  size(960,720);
  frameRate(30);
  Imma = loadImage("Imma.jpg");
  Imma.loadPixels();
  loadPixels();
   
}
 
void draw(){
  
  
  
  for (int x = 0; x < Imma.width; x++) {
    for (int y = 0; y < Imma.height; y++ ) {
      int loc = x + y*Imma.width;
      float r,g,b;
      r = red (Imma.pixels[loc]);
      float maxdist = 50;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      r = constrain(r, 0, 255);
      color c = color(r);
      pixels[y*width + x] = c;
      
    }
}
      
updatePixels();
}



