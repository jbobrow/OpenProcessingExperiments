
void setup()
{
  size(400,400);
  background(0);
  noStroke();
}
void draw()
{
 fill(0,10);
 rect(0,0,width,height);
 
 fill(random(255),random(255),random(255));
 ellipse(random(width),random(height), 4,4);
}

