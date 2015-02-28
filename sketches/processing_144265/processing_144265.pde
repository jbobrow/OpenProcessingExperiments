
float x,y;
void setup(){
  size(600,600);
  smooth();
  strokeWeight(2);
  textSize(20);
  x=width/2;
  y=height/2;
}
void draw(){
  background(18,148,171);
  drawclock();
}
void drawclock(){
  fill(246,246,246);
  ellipse(x,y,450,450);
  rectMode(CENTER);
  rect(x,y,450,450)
  drawNumbers();
  float S_angle=map(second(),0,60,0,2*PI);
  pushMatrix();
  translate(x,y);
  rotate(S_angle);
  stroke(0);
  line(0,0,0,-150);
  popMatrix();
  float m_angle=map(minute(),0,60,0,2*PI);
  pushMatrix();
  translate(x,y);
  rotate(m_angle);
  stroke(36,166,189);
  line(0,0,0,-125);
  popMatrix();
  float h_angle=map(hour(),0,12,0,2*PI);
  pushMatrix();
  translate(x,y);
  rotate(h_angle);
  stroke(0,112,135);
  line(0,0,0,-100);
  popMatrix();
}
  void drawNumbers(){
    float r=190;
    float inc=2*PI/12;
    for (int i=1; i<=12; i++){
      float xn=x+cos(i*inc-HALF_PI)*r;
      float yn=y+sin(i*inc-HALF_PI)*r;
      fill(50);
      text(i,xn,yn);
    }}
