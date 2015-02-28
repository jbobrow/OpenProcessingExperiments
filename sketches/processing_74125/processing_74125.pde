
float xPos = 0;
float yPos = 0;
float d = 0;

void setup() {
  size(400, 400);
  xPos = width/2;
  yPos = height/2;
  d= 100;
}

void draw() {

  if (dist(xPos, yPos, mouseX, mouseY) < d/2) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 255, 0);
  }

  ellipse(xPos, yPos, d, d);
}


