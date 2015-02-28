
//Name - PARK Hyebin
//ID - 201420081

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
  background(0);
   frameRate(1);
   noStroke();
   rectMode(LEFT);
   rect(0,0,width,height);
    float a =random(width);
    stroke(148, 200, 213);
    strokeWeight(25);
    fill(#E8D9FF);
    rectMode(CENTER);
    rect(width/2,height/2,a,a);
   
  drawClock();
}

 
void drawClock()
{
  fill(0);
  drawNumbers();
  float s_angle = map(second(), 0, 59, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(s_angle);
  stroke(255, 0, 0);
  line(0, 0, 0, -160); 
  popMatrix();
 
  float m_angle = map(minute(), 0, 59, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(m_angle);
  stroke(600, 600, 600);
  line(0, 0, 0, -150); 
  popMatrix();
  fill(0, 500, 600,10);
  strokeWeight(5);
  ellipse (x+557*cos(second()*TWO_PI/60.0), y-170*sin(second()*TWO_PI/60.0), 100, 100);
 
  float h_angle = map(hour(), 0, 12, 0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(h_angle);
  stroke(600, 600, 600);
  line(0, 0, 0, -100); 
  popMatrix();
  fill(#FFD9FA);
  strokeWeight(5);

   ellipse (x+557*sin(second()*TWO_PI/60.0), y-170*cos(second()*TWO_PI/60.0), 100, 100);
 
}
 
 
void drawNumbers() {
  float r = 190;
  float inc = TWO_PI / 12;
  for (int i=1; i<=12; i++) {
    float xn = x+cos(i*inc - HALF_PI) * r;
    float yn = y+sin(i*inc - HALF_PI) * r;
    fill(0);
    text(i, xn, yn);
  }
}  
