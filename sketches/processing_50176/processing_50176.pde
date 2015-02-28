
PImage img;
int a; 

void setup() 
{
  size(700,525);
  frameRate(40);
  img = loadImage("crowd.JPG");
  img.loadPixels();
  loadPixels();
}

void draw() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      float r,g,b;
      r = red (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      float maxdist = 60; 
      dist(0,0,width,height);
      float d = dist(x,y,mouseX,mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;

      b += adjustbrightness;
      r = constrain(r,0,255);

      b = constrain(b,0,255);
      color c = color(r,b);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}
  void mousePressed()
{
  save("discovery.tif");
}

