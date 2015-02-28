
float angle= 0.0;

void draw() {
  float sinval = sin(angle);
  println(sinval, -1, 1, 0,255);
  background(gray);
  angle += 0.1;
}

float angle = 90.0;
float offset = 600;
float scalar = 400;
float speed = 1.05;

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background (0);
  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle + 5.4) * scalar;
  float y3 = offset + sin(angle + 5.8) * scalar;
  ellipse( 380, y1, 40, 40);
 ellipse(129, y2, 40, 40);
ellipse(560, y3, 40, 40);
angle += speed;
}







