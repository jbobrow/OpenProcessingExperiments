
void setup()
{
  size(500, 500);
  frameRate(90);
  smooth();
  colorMode(HSB);
  rectMode(CENTER);
  background(0);
}

void draw()
{
  stroke(255);
  line(random(0,displayHeight), random(0, displayHeight),random(0, displayHeight),random(0, displayHeight) );
}
