
PImage elektroshock;
PImage shock;
float counter =0;

void setup()
{
  size(600, 400);
  elektroshock = loadImage("elektroshock.png");
  shock = loadImage("elektroshock_ausschnitt.png");
}

void draw()
{
  image(elektroshock, 0, 0);
  colorMode(HSB, 360, 100, 100);
  float farbe = map(sin(counter), -1, 1, 30, 100);
  
  pushMatrix();
  tint(360, farbe, 100);
  image(shock, 0, 0);
  noTint();
  popMatrix();

  if (mousePressed == true)
  {
    counter +=0.7;
  }
  else
  {
    counter += 0.15;
  }
}



