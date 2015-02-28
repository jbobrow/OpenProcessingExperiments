
PImage y;
void setup()

{
  size(502, 506);
  noStroke();
  frameRate(5);
  y = loadImage ("Penguin1.jpg");
}

void draw()
{

  background(y);
  int i = 1;
  while (i<=100)
  {
    fill (240);
    ellipse(random(500), random(500), 20, 20);
    i++;
  }
}


