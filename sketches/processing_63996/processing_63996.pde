
void setup()
{
  size(400,400);
  strokeWeight(0);
  background(0,random(255),0);
  frameRate(20);
}

void draw()
{
  smooth();
  fill(random(64),random(256),random(64));
  ellipse(200,200,random(450),random(450));
}

