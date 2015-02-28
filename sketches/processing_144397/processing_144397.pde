
float x, y;
 
void setup() {
  size(600, 600);
  smooth();
  strokeWeight(9);
  textSize(25);
  x = width/2;
  y = height/2;
}
 
void draw() {
  background(255,111,154);
  drawClock();
}
 
 
void drawClock() {
  fill(250,250,250);
  stroke(255,228,15);
  rectMode(CENTER);
  rect(x, y, 450, 450);
  fill(255,111,154);
  stroke(255,111,154);
   ellipseMode(CENTER);
   ellipse(x,y,200,200);
  drawNumbers();
  float s_angle = map(second(), 0, 59, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(s_angle);
  stroke(36,224,255);
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
