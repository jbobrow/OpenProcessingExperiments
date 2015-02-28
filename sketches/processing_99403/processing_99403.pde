
void setup()
{
  size(400, 500);
  background(255, 255, 255);
  smooth();
  frameRate(7);
}

void draw()
{
  fill(random(255), random(255), random(255),random(255));
  ellipse(random(400), random(500), random(50), random(50));
  rect(random(400), random(500), random(50), random(50));
  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
}
