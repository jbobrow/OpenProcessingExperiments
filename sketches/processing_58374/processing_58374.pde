
int x;
int xspeed;
int line ;
int rect;

void setup() 
{
  size(400, 400);
  stroke(255);
  xspeed=1;
  
}

void draw() 
{
  
  background(100, 50, 70);
  fill(255,50);
  rect(0,30,x,340);
  noStroke();
  line (x, 30, x, 340);
  
  x=x+xspeed;
  if (x>=0) 
  {
  
  if(x>=width-line || x<=line)
  {
    xspeed=xspeed*-1;
  }
  
  }
}



