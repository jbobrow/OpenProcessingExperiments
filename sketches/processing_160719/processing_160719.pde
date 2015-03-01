

PFont font;

PImage img;

void setup(){
  size(518,345);
  frameRate(30);
  img = loadImage("IMG_7528_1.png");
  img.loadPixels();
  font = loadFont("ADMONO-48.vlw");
  textFont(font, 32);
  text("FIND THE SHADOW", 10, 50);
  loadPixels();
  

}

void draw(){
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      float r,g,b;
      r = red (img.pixels[loc]);
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


