
void setup()
{
  size(600, 600);
  background(230, 175, 75);
}

void draw()
{
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(dist(mouseX, mouseY, width/2, height/2), 0, width, 0, 255);
  fill(red, green, blue);
  noStroke();
  ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed()
{
  diam = random(5, 200);
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(dist(mouseX, mouseY, width/2, height/2), 0, width, 0, 255);
  fill(red, green, blue);
  noStroke();
  ellipse(width/2, height/2, diam, diam);
  //ellipse(mouseX, mouseY, 10, 10);
}
