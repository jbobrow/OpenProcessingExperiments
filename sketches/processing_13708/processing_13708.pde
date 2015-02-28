
PShape zombie;

float x = -260;
float speed = 1.8;

void setup() {
    zombie = loadShape("zombi.svg");
    size(1024, 320);
    smooth();
}

void draw() {
  background(0);
  x += speed;
  
  if (x > width+220) {
    x = -260;
  }
  
  shape(zombie, x, 20, 280, 280);
}

