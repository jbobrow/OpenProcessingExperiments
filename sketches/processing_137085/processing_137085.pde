
float sX, sY, eX, eY;

void setup() {
  size(1200, 500);
  sX = 0;
  background(0);
  //frameRate(120);
}

void draw() {
  strokeWeight(random(1, 2));
  sX = random(width);
  if (sX > width) {
    sX = 0;
  }
  eX = sX;
  sY = random(height/2);
  eY = height - sY;
  line(sX, sY, eX, eY);
  stroke(255, random(255), random(255), 20);
}



