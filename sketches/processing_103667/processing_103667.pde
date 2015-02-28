
void setup()
{
  size(600, 600);
  background(255);
  //background(100, 250, 225);
}

void draw()
{
  fill(255, 255, 255, 5);
  //fill(100, 250, 255, 5);
  stroke(0);
  rect(0, 0, width, height);
  float green = map(mouseX, 0, width, 150, 255);
  float blue = map(mouseX, 0, width, 255, 150);
  int radius = random(5, 80);
  fill(100, green, blue, 100);
  stroke(100, green, blue);
  strokeWeight(1);
  if(mousePressed)
  {
    ellipse(mouseX, mouseY, radius, radius);
    ellipse(map(mouseX, 0, width, width, 0), mouseY, radius, radius);
    ellipse(map(mouseX, 0, width, width, 0), map(mouseY, 0, height, height, 0), radius, radius);
    ellipse(mouseX, map(mouseY, 0, height, height, 0), radius, radius)
  }
  else
  {
    strokeWeight(2)
    line(pmouseX, pmouseY, mouseX, mouseY);
    line(map(pmouseX, 0, width, width, 0), pmouseY, map(mouseX, 0, width, width, 0), mouseY);
    line(map(pmouseX, 0, width, width, 0), map(pmouseY, 0, height, height, 0), map(mouseX, 0, width, width, 0), map(mouseY, 0, height, height, 0));
    line(pmouseX, map(pmouseY, 0, height, height, 0), mouseX, map(mouseY, 0, height, height, 0));
  }
}
