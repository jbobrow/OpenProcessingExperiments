
//Name = An yohan
//ID   = 201420087

float x, y;
 
void setup() {
  size(600, 600);
  smooth();
  strokeWeight(3);
  textSize(30);
  x = width/2;
  y = height/2;
}
 
void draw() {
  background(255);
  drawClock();
}
 
 
void drawClock() {
  strokeWeight(1);
  fill(54, 186, 255);
  ellipse(x, y, 550, 550);
  drawNumbers();
   
  float h_angle = map(hour(), 0, 12, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(h_angle);
  stroke(0);
  strokeWeight(20);
  line(0, 0, 0, -100); 
  fill(54, 186, 255);
  ellipse(0,-70, -25,-25);
  popMatrix();
  
  float m_angle = map(minute(), 0, 60, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(m_angle);
  stroke(0, 255, 0);
  strokeWeight(20);
  fill(54, 186, 255);
  ellipse(0, -150, -50, -50);
  line(0, 0, 0, -200);
  popMatrix();
  
  float s_angle = map(second(), 0, 60, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(s_angle);
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0, 0, 0, -200);
  fill(54, 186, 255);
  ellipse(0, -170, -50, -50);
  popMatrix();
  
  stroke(0);
  fill(98,98,98);
  ellipse(x,y, -20, -20);
  
}
 
  
void drawNumbers() {
  float r = 250;
  float inc = TWO_PI / 12;
  for (int i=1; i<=12; i++) {
    float xn = x+cos(i*inc - HALF_PI) * r;
    float yn = y+sin(i*inc - HALF_PI) * r;
    fill(50);
    text(i, xn-10, yn+10);
  }
}
