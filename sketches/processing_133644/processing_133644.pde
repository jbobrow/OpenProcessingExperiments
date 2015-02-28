
void setup(){
  size(400,400);
  smooth();
  background(0);
}
void draw(){
  frameRate(50);
  noFill();
  float r=random(400);
  float m=random(400);
  float a=random(400);
  float b=random(400);
  stroke(r/1.7,m/1.7, 150);
  strokeWeight(1);
  point(a,b);
{
  for(int i=0;i<=400;i+=10)
  stroke(r/1.5,m/1.5,i,20);
  frameRate(40);
  strokeWeight(.5);
  triangle(r,m,m,r,200,200);
}}
  
