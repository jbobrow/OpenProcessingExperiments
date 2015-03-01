
float x, y;
void setup() {
  size(600, 600);
  smooth();
  strokeWeight(2);
  textSize(20);
  x=width/2;
  y=height/2;
}
void draw() {
  background(0, 255, 0);
  drawclock();
}
void drawclock() {
  fill(255);
  ellipse(width/2, height/2, 600, 600);
  drawNumbers();

  float sa=map(second(), 0, 60, 0, 2*PI);
  pushMatrix();
  translate(x, y);
  rotate(sa);
  stroke(0);
  line(0, 0, 0, -150);
  popMatrix();

  float ma=map(minute(), 0, 60, 0, 2*PI);
  pushMatrix();
  translate(x, y);
  rotate(ma);
  stroke(36, 166, 189);
  line(0, 0, 0, -125);
  popMatrix();

  float ha=map(hour(), 0, 12, 0, 2*PI);
  pushMatrix();
  translate(x, y);
  rotate(ha);
  stroke(0, 112, 135);
  line(0, 0, 0, -100);
  popMatrix();
}

void drawNumbers() {
  float r=250;
  float inc=2*PI/12;
  for (int i=1; i<=12; i++) {
    float xn=x+cos(i*inc-HALF_PI)*r;
    float yn=y+sin(i*inc-HALF_PI)*r;
    fill(0);
    text(i, xn, yn);
  }
}
