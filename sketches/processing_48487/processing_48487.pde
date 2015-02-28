
void setup()
{
  size(400, 600);
  background(165, 55, 55);
  frameRate(30);
}

void draw()
{
  textSize(45);
  fill(58,160,65);
  text("Merry Christmas!", 5, 100);

}

void mouseDragged()
{
  fill(126,126,131);
  ellipse( mouseX, mouseY, 50, 50);
}


