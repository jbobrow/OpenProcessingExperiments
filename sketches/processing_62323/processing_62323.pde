

float x = 0;
float y = 0;
float speedx = random (10);
float speedy = random (10);
float r;
float g;
float b;



void setup() {
  size(400, 400);
  smooth();
}
void draw() {

  noStroke();
  fill(45, 255, 80, 20);
  rect(50, 50, 300, 300);

  x = x + speedx;
  y = y + speedy;

  if ((x > width) || (x < 0)) {
    speedx = speedx * -1;
  }

  if ((y > height) || (y < 0)) {
    speedy = speedy * -1;
  }

  r = random(255);
  g = random(255);
  b = random(255);

  noStroke();
  fill(r, g, b);
  ellipse(x, y, 32, 32);
}

void mousePressed () {
  
  saveFrame ("hoi.png");
  
}


