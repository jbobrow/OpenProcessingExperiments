

PImage colour;
 
void setup(){
  size(960,720);
  frameRate(30);
  colour = loadImage("colour.jpg");
  colour.loadPixels();
  loadPixels();
   
}
 
void draw(){
  
  
  
  for (int x = 0; x < colour.width; x++) {
    for (int y = 0; y < colour.height; y++ ) {
      int loc = x + y*colour.width;
      float r,g,b;
      r = red (colour.pixels[loc]);
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



