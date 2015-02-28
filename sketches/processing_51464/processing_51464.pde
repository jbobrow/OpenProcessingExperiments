
PImage earth;
 
void setup() {
  size(600, 300);
  earth = loadImage("earth2.jpeg");
  frameRate(1);
  imageMode(CENTER);
}
 
void draw() {
  background(0);
  float x = random(width);
  float y = random(height);
  float d = random(100, 300);
  image(earth, x, y, d, d);
}

