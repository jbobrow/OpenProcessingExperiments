
float ballY=0;
void setup()
{
  size(500, 700);
  background(255, 255, 255);
  smooth();
  frameRate(63.7385735);
}

void draw()
{  
  ellipse(mouseX, mouseY, 1, 17);
  if (key== 'R')
  {
    stroke(255, 0, 14);
  }
  if (key== 'r')
  {
    stroke(255, 255, 255);
  }
  if (key=='B')
  {
    stroke(0, 0, 255);
  }
  if (key== 'S')
  {
    stroke(237, 157, 72);
  }
  if (key=='T')
  {
    stroke(22, 240, 212);
  }
  if (key=='b')
  {
    stroke(0);
  }
}
