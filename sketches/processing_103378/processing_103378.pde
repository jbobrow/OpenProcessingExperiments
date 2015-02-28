
void setup()
{
  size(600, 600);
  background(255);
}

void draw()
{
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, height, 0, 255);
  float green = dist(mouseX, mouseY, width/2, height/2);
  float x = map(mouseX, 0, width, 0, 100);
  float y = map(mouseY, 0, height, 0, 100);
  float a = map(mouseX-mouseY, 0, width, 0, 100);
  float b = map(mouseX + mouseY, 0, width+height, 0, 100);
  fill(255, 255, 255, 25);
  noStroke();
  rect(0, 0, width, height);
  fill(red, green, blue, 100);
  stroke(red, green, blue, 150);
  strokeWeight(3);
  frameRate(30);
  ellipse(mouseX, mouseY, 1, 1);
  ellipse(mouseX+x, mouseY+x, b, b);
  ellipse(mouseX-y, mouseY+y, a, a);
  ellipse(mouseX+a, mouseY-a, y, y);
  ellipse(mouseX-b, mouseY-b, x, x);
  
}
