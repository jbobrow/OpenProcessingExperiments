
void setup()
{
  size(500,500);
  background(255);
  fill(255);
  stroke(0);
  rectMode(CENTER);
}

void draw()
{
  translate(250,250);
  rotate(radians(mouseX));
  rect(0,0,500-(mouseX*4),500-(mouseX*4));
}
