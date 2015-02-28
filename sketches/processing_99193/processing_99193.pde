
float redAmount;
float greenAmount;
float blueAmount;
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}
void draw()
{
  strokeWeight(4);
  fill(random (255), random(255), random(255));
  stroke(random (255), random(255), random(255));

  line(0, 0, mouseX, mouseY);
  rect(mouseX, mouseY, 50, 50);
}

void keyPressed()
{
}
