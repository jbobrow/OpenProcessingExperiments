
//Olivia Mund
//week 3 assignment
//This is a caterpiller I made named Buggles
//Name creds go to Haley Jones
float angle = 0.0;
float speed = 0.07;
float x = 0.0;
float y = 130.0;
int s = 75;

void setup() {
  size (500, 500);
  smooth();
}

void draw() {
  background(0, 102, 0);
  angle = angle + speed;
  strokeWeight(1);
  fill(0, 204, 0);
  ellipse(225 + (sin(angle + PI) * 5), 100, s, s);
  fill(0, 128, 255);
  ellipse(225 + (sin(angle + HALF_PI) * 5), 165, s, s);
  fill(0, 204, 0);
  ellipse(225 + (sin(angle + QUARTER_PI) * 5), 235, s, s);
  fill(0, 128, 255);
  ellipse(225 + (sin(angle + PI) * 5), 305, s, s);
  fill(0, 204, 0);
  ellipse(225 + (sin(angle + HALF_PI) * 5), 375, s, s);
  fill(0, 128, 255);
  ellipse(225 + (sin(angle + QUARTER_PI) * 5), 445, s, s);
  fill(255, 255, 255);
  ellipse(210 + (sin(angle + QUARTER_PI) * 5), 440, 12, 12);
  ellipse(240 + (sin(angle + QUARTER_PI) * 5), 440, 12, 12);
  fill(0, 0, 0);
  ellipse(210 + (sin(angle + QUARTER_PI) * 5), 440, 6, 6);
  ellipse(240 + (sin(angle + QUARTER_PI) * 5), 440, 6, 6);
  strokeWeight(2);
  fill(0, 0, 0);
  beginShape();
  curveVertex(210 + (sin(angle + QUARTER_PI) * 5), 500);
  curveVertex(193 + (sin(angle + QUARTER_PI) * 5), 400);
  curveVertex(208 + (sin(angle + QUARTER_PI) * 5), 420);
  curveVertex(215 + (sin(angle + QUARTER_PI) * 5), 360);
  endShape();
  beginShape();
  curveVertex(240 + (sin(angle + QUARTER_PI) * 5), 480);
  curveVertex(248 + (sin(angle + QUARTER_PI) * 5), 400);
  curveVertex(233 + (sin(angle + QUARTER_PI) * 5), 420);
  curveVertex(255 + (sin(angle + QUARTER_PI) * 5), 360);
  endShape();
  ellipse(225 + (sin(angle + QUARTER_PI) * 5), 450, 14, 10);
}


