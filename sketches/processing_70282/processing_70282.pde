
//Jordan Leung 1315, Computer Programming 4,5
void setup()
{
  size(500,500);
  background(0);
  smooth();
  
 
}

int x=10;
int y=1;
int change=1;
void draw()
{
  if (x>500)
{
  change=-1;
}
  if (x<0)
  {
    change=1;
  }
  noStroke();
  fill(255-x,x,x,20);
  rect(0,0,500,500);
  
  stroke(x,255-x,x);
  ellipse(x,250,x,x);
  ellipse(500-x,250,x,x);
  ellipse(250,x,x,x);
  ellipse(250,500-x,x,x);
  ellipse(x,x,x,x);
  ellipse(500-x,500-x,x,x);
  ellipse(500-x,x,x,x);
  ellipse(x,500-x,x,x);
  x=x+change;
  y=y+5;
  
}
