
// watercolor rain by ben chun
// 16 September 2010

void setup()
{
  size(640,480);
  background(160);
  noStroke();
  smooth();
}

void draw()
{
  fill(160, 100);
  noStroke();
  int numDrops = (int)random(5,25); 
  for(int i=0; i<numDrops; i++)
  {
    raindrop();
  }
  stroke(0);
  strokeWeight(8);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void raindrop()
{
  float d = random(5, 20);
  ellipse(random(0, width), random(0,height), d, d);
}


