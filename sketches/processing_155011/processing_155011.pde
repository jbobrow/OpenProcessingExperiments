
PShape myShape;
PShape [] layers;

float angle = 0;
float r = 250;
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

  frameRate (15);
  background (#57385c);
}

void draw ()
{
  translate (width/2, height/2);
  rotate (angle);

  shapeSize = map (r, 0, 300, 0.3, 1);
  scale (shapeSize);

  int index = frameCount % layers.length;

  //println (myShape.width);


  fill (c [(int) random (c.length)], map (r, 0, 300, 255, 10));
  noStroke();
  shape (layers [index], r, 0);

  angle = angle + random (PI/60, PI /15);

  if (angle > TWO_PI)
  {
    angle = angle - TWO_PI;
    r = r - 50;
  }

  if (r < 0)
  {
    background (#57385c);
    r = 250;
  }
}

void keyPressed ()
{
  saveFrame ("#####.png");
}


