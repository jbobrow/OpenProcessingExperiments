
PShape myShape;

void setup ()
{
  size (600, 600);
  smooth();

  myShape = loadShape ("floral.svg");

  background (#57385c);
}

void draw ()
{
}

void drawShape ()
{
  float x = random (width);
  float y = random (height);
  float angle = random (TWO_PI);
  float zoom = random (0.2, 1);
  
  translate (x, y);
  rotate (angle);
  scale (zoom);


  shape (myShape, 0, 0);

}

void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    drawShape ();
  }
  else {
    background (#57385c);
  }
}


