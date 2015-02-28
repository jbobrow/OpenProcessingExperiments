
float rot = 0;
float gruen = 0;
float blau = 0;
float x = 0;
float y = 200;

void setup() {
  size(400,400);
}

void draw() {
  background(255);
  move();
  display();
}

void keyPressed() {
  // Zufallsfarbe für Kreis
  rot = random(0, 256);
  gruen = random(0, 256);
  blau = random(0, 256);
}

void move() {
  x = x + 1;
  if (x > width) {
    x = 0;
  }
}

void display() {
  noStroke();
  fill(rot, gruen, blau);
  ellipse(x,y,50,50);
}

