
PShape myShape;
PShape [] layers;

float angle = 0;
float r = 300;
float shapeSize = 1;

color [] c = {
  #ffffff, #A75265, #000000, #ffedbc
};

void setup ()
{
  size (600, 600);
  smooth();

  myShape = loadShape ("floral.svg");

  layers = myShape.getChildren();

  int i = 0;
  while (i < layers.length)
  {
    layers [i].disableStyle();
    i = i +1;
  }

  frameRate (30);
  background (#57385c);
}

void draw ()
{
}

void drawLayers ()
{
  int i = 0;
  while (i < layers.length)
  {
    pushMatrix();
    drawShape (i);
    popMatrix();
    i = i + 1;
  }
}

void drawShape (int index)
{
  float x = random (width);
  float y = random (height);
  float angle = random (TWO_PI);
  float zoom = random (0.2, 1);

  translate (x, y);
  rotate (angle);
  scale (zoom);

  noStroke();
  fill (random (255));
  shape (layers [index], 0, 0);
}

void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    drawLayers ();
  }
  else {
    background (#57385c);
  }
}

void keyPressed ()
{
  saveFrame ("#####.png");
}


