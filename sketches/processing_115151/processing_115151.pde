
void setup()
{
  background(0,0,0);
  size(600, 600);
  rectMode(CORNERS);
}
int x=0;
void draw()
{
  noStroke();
  fill(0,0,0,12);
  rect(0,0,600,600);
  x ++ ; 
  fill(map(x,0,600,0,255),100,0);
  ellipse(x,200*sin(map(x,0,600,0,PI)*2)+300,4,4);   
  if (x == 600)
  x=0;
}



