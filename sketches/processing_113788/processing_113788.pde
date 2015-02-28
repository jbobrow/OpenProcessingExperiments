
float x, y;

void setup() {
  size(640, 480);
  smooth();
  strokeWeight(2);
  textSize(25);
  x = width/2;
  y = height/2;
}

void draw() {
  background(50);
  drawClock();
}


void drawClock() {
  fill(200);
  ellipse(x, y, 450, 450);
  drawNumbers();
  float s_angle = map(second(), 0, 59, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(s_angle);
  stroke(255, 0, 0);
  line(0, 0, 0, -200);  
  popMatrix();

  float m_angle = map(minute(), 0, 59, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(m_angle);
  stroke(0);
  line(0, 0, 0, -200);  
  popMatrix();

  float h_angle = map(hour(), 0, 11, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(h_angle);
  stroke(0);
  line(0, 0, 0, -100);  
  popMatrix();
}


void drawNumbers() {
  float r = 190;
  float inc = TWO_PI / 12;
  for (int i=1; i<=12; i++) {
    float xn = x+cos(i*inc - HALF_PI) * r;
    float yn = y+sin(i*inc - HALF_PI) * r;
    fill(50);
    text(i, xn, yn);
  }
}



