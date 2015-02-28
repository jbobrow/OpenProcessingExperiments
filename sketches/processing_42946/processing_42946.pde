
float s;
void setup()
{
  size(400,400);
  rectMode(CENTER);
}
void draw()
{
  background(255);
  fill(0);
  noStroke();
  
  for(int x=-0; x<=width; x+=15)
  {
  for(int y=-0; y<=height; y+=15)
  {
  s=20-dist(x,y,mouseX, mouseY)*.1;
  if(s<=0)
  {
  s=0;
  }
  pushMatrix();
  
  translate(x,y);
  rotate(PI*.25);
  rect(0,0,s,s);
  popMatrix();
  }
  }
}

