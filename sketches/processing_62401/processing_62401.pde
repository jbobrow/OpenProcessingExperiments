

float x = 100;
float y = 100;
float speedx = random (100);
float speedy = random (100);


void setup() {
  size(400, 400);
  smooth();
  background(0);
}
void draw() {

  x = x + speedx;
  y = y + speedy;

  if ((x > width-50) || (x < 0)) {
    speedx = speedx * -1;
  }

  if ((y > height-50) || (y < 0)) {
    speedy = speedy * -1;
  }

  stroke(255);
  line(x, y, random(100), random(100));

  stroke(255);
  fill(255);
  rect(random(x), random(y), random(60), random(60));

  noStroke();
  fill(50, 2);
  rect(100, 100, 200, 200);
}

void mousePressed () {

  saveFrame ("hoi.png");
}


