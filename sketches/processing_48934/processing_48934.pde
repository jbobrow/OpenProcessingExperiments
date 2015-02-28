
void setup()
{
  size(400, 600);
  background(random(255), random(150), 100);
  fill(200, 300, 0);
  smooth();
  ellipse(200, 300, 300, 300);
}

void draw()
{
  ellipse(200, 300, 300, 300);
  fill(random(200), random(200), random(200));
  strokeWeight(10);
  line(210, 200, 210, 300);
  strokeWeight(10);
  line(175, 200, 175, 300);
  strokeWeight(10);
  line(300, 375, 100, 375);
}


