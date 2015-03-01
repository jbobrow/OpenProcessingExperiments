
void setup()
{
  size(600, 400);
  noStroke();
  rectMode(CENTER);

}

void draw()
{
  background(11);
  fill(255, 100);
  rect(mouseX, height/2, mouseY/2+12, mouseY/2+12);
  fill(200, 100, 20);
  ellipse(mouseY, height/2, mouseX/2+12, mouseX/2+12);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  fill(100, 30, 90);
  rect(inverseX, height/2, (inverseY/2)+12, (inverseY/2)+12);
  fill(250, 150);
  triangle(mouseY +50, mouseX -50, 350, 150, 150, 150);
}




