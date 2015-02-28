
/**
 * This program randomly produces shapes that grow or
 * shrink as they move across the screen, leaving a fading trail
 * as they go.
 */

TrailShape[ ] t;  // the shapes to be drawn
int nShapes;      // number of shapes currently on screen
int nextShapeTime;  // how many frames to wait before generating next shape

/* Put all the limits in one place for ease of modification */
int MAX_SHAPETYPES = 5;
int MAX_SHAPES = 100;
int MIN_SPEED = 1;
int MAX_SPEED = 5;
int MIN_SIZE = 20;
int MAX_SIZE = 50;
int SHAPE_INTERVAL_MIN = 10;
int SHAPE_INTERVAL_MAX = 40;
float MIN_PERCENT = -0.2;
float MAX_PERCENT = 0.2;

void setup() {
  size(200, 200);
  background(255);
  frameRate(20);
  noFill();
  smooth();
  
  t = new TrailShape[MAX_SHAPES]; // keep a maximum of 100 objects
  nShapes = 0;
  nextShapeTime = 1;
}

void draw()
{
  background(255);
  if (frameCount == nextShapeTime)
  {
    generateShape();
  }
  for (int i = 0; i < nShapes; i++)
  {
    t[i].display();
  }
}

void generateShape()
{
  /*
   * Select a random color, speed (1-5 pixels/iteration),
   * starting size (between 20-50), and
   * a percentage by which the size increases or decreases
   * as the shape moves.
   */
  int shapeType = int(random(MAX_SHAPETYPES));
  color c = randomColor();
  int dx = int(random(MIN_SPEED, MAX_SPEED + 1) * randomSign());
  int dy = int(random(MIN_SPEED, MAX_SPEED + 1) * randomSign());
  int startSize = int(random(MIN_SIZE, MAX_SIZE + 1));
  float dPercent = random(MIN_PERCENT, MAX_PERCENT);
  int x = int(random(0, width));
  int y = int(random(0, height));

  /*
   * Now create a random shape and add it to the array
   */
  switch (shapeType)
  {
  case 0:
    t[nShapes] = new TrailCircle(x, y, dx, dy,
    startSize, dPercent, c);
    break;
  case 1:
    t[nShapes] = new TrailTriangle(x, y, dx, dy,
    startSize, dPercent, c);
    break;
  case 2:
    t[nShapes] = new TrailSquare(x, y, dx, dy,
    startSize, dPercent, c);
    break;
  case 3: // pentagons and hexagons
  case 4:
    t[nShapes] = new TrailPolygon(x, y, dx, dy,
    startSize, dPercent, c, shapeType + 2);
    break;
  }
  // make sure there are no more than 100 shapes on screen at any time
  nShapes = (nShapes + 1) % MAX_SHAPES;
  
  // and figure out when to create the next shape
  nextShapeTime = frameCount + SHAPE_INTERVAL_MIN +
    int(random(0, SHAPE_INTERVAL_MAX - SHAPE_INTERVAL_MIN + 1));
}

/*
 * Randomly returns -1 or +1.
 * This is a convenience method to make other code easier to read.
 */
int randomSign()
{
  return (random(1) < 0.5) ? -1 : 1;
}

/*
 * Generate a random color.
 * Limits are set to COLOR_MAX so that we don't get a white object
 * (which is really hard to see on a white background) or
 * one that is too light to see.
 */
color randomColor()
{
  final int COLOR_MAX = 240;
  return color(int(random(COLOR_MAX)), int(random(COLOR_MAX)), int(random(COLOR_MAX)));
}


