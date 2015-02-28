
int x;
int y;

void setup()
{
  size(400,400);
  background(255);
  smooth();
}

void draw()
{
  for(x=5;x<=width;x+=30)
  for(y=5;y<=height;y+=30)
  {
  fill(0);
  strokeWeight(2);
  stroke(23,220,20);
  ellipse(x+10,y+10,20,20);
  ellipse(x+10,y+10,10,10);
  noFill();
  stroke(13,100,20);
  ellipse(x+10,y+10,25,25);  
  }
}
