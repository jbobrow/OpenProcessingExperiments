
void setup()
{
  size(600, 600);
  smooth();
  stroke(0, 102);
}

void draw()
{
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  line(mouseX, mouseY, pmouseX, pmouseY);
}


