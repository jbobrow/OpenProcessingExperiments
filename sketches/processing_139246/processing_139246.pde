
int x=0;
int up=1; 
void setup() 
{
  size(400,400);
}
void draw(){
  background(255,142,89);
  ellipse(150,120,120,120);
  rectMode(CENTER);
  rect(200,120,120,120);
  stroke(46,216,58); 
  strokeWeight(20);
  line(90,100,26,70); 
  line(90,140,30,160);
  line(300,100,260,100); 
  line(300,140,260,140);
 
  x=x+1;
  if (x==40) 
  {
    x=0;
    up=up*-1;
  }
  if (up==1)
  {
    line(150,60,80,10);
  } else
    line(150,60,80,30);
  }



