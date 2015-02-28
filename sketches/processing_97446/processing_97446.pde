
// Image Points
//
// Mouse X - step resolution

PImage img;
int step = 3;

void setup() {

  size(500,390);
  background(0);
  fill(0,0,0);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB);
  img = loadImage("towerbridge.jpg");
  img.loadPixels();
}

void draw() {
  background(0);
  step = int(map(mouseX, 0, 1024, 3, 15));
  for (int i = 0; i < img.width; i+=step) {
  for (int k = 0; k < img.height; k+=step) {
    int loc = i + (k*img.width);
    float b = brightness(img.pixels[loc]);
    float h = hue(img.pixels[loc]);
    float s = saturation(img.pixels[loc]);
    if (h>150 && h<200) { fill(175,255,b); } else { fill(0,0,b); };
    ellipse(i,k,map(b,0,255,0,step),map(b,0,255,0,step));  
  }  
}

}


