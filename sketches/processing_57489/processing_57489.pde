
PImage dotz;

void setup() {
  size (800, 800);
  smooth();
  dotz = loadImage("P.png");
    image(dotz, 0, 0);
}

void draw() {

  
  float dist = dist(pmouseX, pmouseY, mouseX, mouseY);

  if (dist > 20) {
    dist = 20;
  }

  dist = min (dist, 25);
  strokeWeight(20 - dist);
  line(pmouseX, pmouseY, mouseX, mouseY);
}





