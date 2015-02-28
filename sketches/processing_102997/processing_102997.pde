
float r, g, b, deltaR, deltaG, deltaB;

PImage img;
void setup() {
  size(790, 463);
  r = 255;
  g = 255;
  b = 0;
  deltaR = 0;
  deltaG = 0;
  deltaB = 0;
  
  stroke(255, 255, 255);
  fill(r, g, b);
  rect(45,32,745,432);
}
  
  
void keyPressed() {
  if (keyCode == RIGHT) {
  img = loadImage("Banana silhouette.png");
  }
}


void draw() {
  image(img, 0, 0);
  tint(255, 255, 0, 255);
}
