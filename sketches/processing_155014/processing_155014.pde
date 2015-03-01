
PShape myShape;
PShape [] layers;

float angle = 0;
float r = 300;
float shapeSize = 1;

float lastX, lastY;
float lastX2, lastY2;

void setup ()
{
  size (600, 600);
  smooth();

  myShape = loadShape ("floral.svg");

  initLayers();

  lastX = width/2;
  lastY = height/2;
  lastX2 =lastX;
  lastY2 = lastY;

  frameRate (30);
  background (#57385c);
}

void draw ()
{
  if (mousePressed == true )
  {
    drawShape (mouseX, mouseY, random (TWO_PI), random (0.05, 0.5), iRandom (0, layers.length));
    drawLine (mouseX, mouseY);
  }
}

int iRandom (float minVal, float maxVal)
{
  int randomValue = (int) random (minVal, maxVal);

  return randomValue;
}

void drawLine (float x, float y)
{
  float maxDistance = 200;
  float distance = dist (x, y, lastX, lastY);

  float sw = map (distance, 0, maxDistance, 4, 0.1);
  sw = constrain (sw, 0.1, 4);
  float sc = map (distance, 0, maxDistance, 255, 0);
  sc = constrain (sc, 0, 255);
  strokeWeight (sw); 
  stroke (sc, sc);
  noFill();
  curve (x, y, x, y, lastX, lastY, lastX2, lastY2);

  lastX2 = lastX;
  lastY2 = lastY;

  lastX = x;
  lastY = y;
}

void drawShape (float x, float y, float angle, float zoom, int index)
{
  pushMatrix();
  translate (x, y);
  rotate (angle);
  scale (zoom);

  noStroke();
  color c = color (random (255));
  fill (c);
  shape (layers [index], 0, 0);
  popMatrix();

  stroke (c);
}

void initLayers ()
{
  layers = myShape.getChildren();

  int i = 0;
  while (i < layers.length)
  {
    layers [i].disableStyle();
    i = i +1;
  }
}


void keyPressed ()
{
  if (key == ' ')
  {
    background (#57385c);
  }
  if (key == 's') 
  {
    saveFrame ("#####.png");
  }
}


