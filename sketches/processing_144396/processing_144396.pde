
float x, y;
 
void setup() {
  size(600, 600);
  smooth();
  strokeWeight(2);
  textSize(25);
  x = width/2;
  y = height/2;
}
 
void draw() {
  background(15,20,250);
  drawClock();
}
 
 
void drawClock() {
  
  fill(255,255,255);
  rectMode(CENTER);
  rect(x, y, 450, 450);
   fill(0,0,255);
   noStroke();
  ellipseMode(CENTER);
  ellipse(x, y, 250, 250);
  fill(255,255,255);
  rectMode(CENTER);
  rect(x, y, 150, 150);
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
    fill(10,3,255);
    text(i, xn, yn);
  }
}

