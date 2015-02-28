
int radius = 50;
float ellipX = random(30, 470);
float ellipY = random(30, 470);
int diffi = 5;
void setup()
{
  size(500, 500);
}

void draw()
{
  float afstand = sqrt((mouseX-ellipX)*(mouseX-ellipX)+(mouseY-ellipY)*(mouseY-ellipY));
  background(255, 255, 255);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(ellipX, ellipY, radius, radius);

  if ( afstand <= radius)
  {
    ellipX = random(30, 470);
    ellipY = random(30, 470);
    radius = radius-diffi;
    fill(249, 28, 19);
    stroke(249, 28, 19);
    ellipse(ellipX, ellipY, radius, radius);
  }
  if ( radius <= 10)
  {
    radius = 50;
    ellipX = random(30, 470);
    ellipY = random(30, 470);
    fill(249, 28, 19);
    stroke(249, 28, 19);
    ellipse(ellipX, ellipY, radius, radius);
  }
}
