
PImage rage;
float x = 150;
float y = 150;

void setup()
{

  size(600, 600);
  rage = loadImage ("rage.jpg");
}
void draw()
{

  background(254);
  x = x + random(-3, 3);
  y = y + random(-3, 3);
  image(rage, x, y, 300, 300);
  fill(0);
  textSize(20);
  text("Watch Gangnam style for 500 hours....", x, y);
}
