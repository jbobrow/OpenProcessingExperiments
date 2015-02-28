
int screenHeight = 640;
int screenWidth = 640;

void setup()
{
  size(screenHeight, screenWidth);
  background(0, 255, 0);
  drawCreeper();
}

void drawCreeper()
{
  fill(0, 0, 0);
  rect(80, 80, 80, 80);
  rect(400, 80, 80, 80);
  rect(160, 80, 80, 80);
  rect(480, 80, 80, 80);
  rect(80, 160, 80, 80);
  rect(400, 160, 80, 80);
  rect(160, 160, 80, 80);
  rect(480, 160, 80, 80);
  rect(240, 320, 80, 80);
  rect(320, 320, 80, 80);
  rect(240, 240, 80, 80);
  rect(320, 240, 80, 80);
  rect(400, 320, 80, 80);
  rect(160, 320, 80, 80);
  rect(160, 400, 80, 80);
  rect(400, 400, 80, 80);
  rect(160, 480, 80, 80);
  rect(400, 480, 80, 80);
  rect(320, 400, 80, 80);
  rect(240, 400, 80, 80);
}
