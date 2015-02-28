
int numLines = 20;
int distance;

void setup()
{
  size(500, 500);
  smooth();
  noFill();
  stroke(18, 255, 233);
  distance = width / numLines;
}


void draw()
{
  background(0);
  for (int l = 0; l <= numLines; l ++) {
  line(l*distance, 0, mouseX, mouseY);
  line(l*distance, width, mouseX, mouseY);
  }
}
