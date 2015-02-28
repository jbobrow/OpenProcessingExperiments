
void setup(){
  size(400,400);
  background(0);
  smooth();
  stroke(255);
  noFill();
}
float r=20,a=0;
void draw(){
  float x=r*cos(a);
  float y=r*sin(a);
  ellipse(width/2+x,height/2+y,50,50);
  a=a+0.1;
  r=r+0.3;
}
