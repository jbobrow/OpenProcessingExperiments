
PImage img;

void setup() {
  size(700, 450);
  frameRate(30);
  img = loadImage("DSC_0064.jpg");
  img.loadPixels();
  loadPixels();
}

void draw() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      float r,g,b;
      r = red (img.pixels[loc]);
      float maxdist = 80;
      float d = dist(x,y,mouseX,mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      r = constrain(r,0,255);
      color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}


