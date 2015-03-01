
float r=0;

void setup()
{
  size(400,400);
  background(0);
  stroke(255);
  noStroke();
}

void draw()
{
  translate(200,200);
  rotate(r);
  ellipse(0+r,0,4,4);
  r=r+0.2;
}


