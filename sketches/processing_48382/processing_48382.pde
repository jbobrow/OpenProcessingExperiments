
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  textAlign(CENTER);
}

void draw()
{
  frameRate(frameCount);
  textSize(random(8, 36));
  fill(255, 0, 0, 10);
  rect(0, 0, width, height);
  fill(random(255), random(255), random(255));
  text("merry\n christmas!", random(width), random(height));
}
void keyPressed()
{
  if (key=='c')
    fill(255, 255, 255);
  rect(0, 0, width, height);
}


