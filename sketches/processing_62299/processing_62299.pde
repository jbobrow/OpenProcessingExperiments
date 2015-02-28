
void setup()
{
  size(600, 800);
  background(255, 255, 255);
  frameRate(600);
  fill(0, 0, 0);
  textSize(30);
  text("Blue:B Red:R Yellow:Y Brown:Z Clear:Q", 10, 700);
  text("Fade:W Orange:O Purple:P -:Small+:Large", 10, 730);
}

void draw()
{
  if (key=='p')
  {
    stroke(128, 0, 128);
    fill(128, 0, 128);
  }
  if (key=='o')
  {
    stroke(255, 69, 0);
    fill(255, 69, 0);
  }
  if (key == 'g')
  {
    stroke(0, 200, 0);
    fill(0, 200, 0);
  }
  if (key == 'r')
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
  }
  if (key == 'b')
  {
    stroke(0, 0, 255);
    fill(0, 0, 255);
  }
  if (key== 'z')
  {
    stroke(85, 58, 3);
    fill (85, 58, 3);
  }
  if (key == 'q')
  {
    background(255);
    fill(0, 0, 0);
    text("Blue:B Red:R Yellow:Y Brown:Z Clear:Q", 10, 700);
    text("Fade:W Orange:O Purple:P -:Small+:Large", 10, 730);
  }
  if (key=='w')
  {
    fill(255, 255, 255, 1);
    rect(-1, -1, 600, 800);
  }
  if (key == 'y')
  {
    stroke(255, 255, 0);
    fill(255, 255, 0);
  }
}
void mouseDragged()
{
  if (key == '-')
  {
    ellipse(mouseX, mouseY, 5, 5);
  }
  else if (key == '=')
  {
    ellipse(mouseX, mouseY, 20, 20);
  }
  else
    ellipse(mouseX, mouseY, 10, 10);
}
