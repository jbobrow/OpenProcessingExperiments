
PImage hintergrund;
PImage hund;

void setup()
{
  size(500, 375);
  hintergrund = loadImage("Hintergrund.jpg");
  hund = loadImage("Hund.png");
}

void draw()
{
  background(0);
  image(hintergrund, 0, 0);

  float transparenz = map(mouseX, 0, 200, 0, 255);

  tint (255, transparenz);

  image(hund, mouseX-50, 100);
}



