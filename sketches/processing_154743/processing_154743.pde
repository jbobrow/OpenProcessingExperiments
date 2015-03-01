
PVector [] loc = new PVector [300];
PVector [] dir = new PVector [300];
float [] s = new float [300];

float noiseScale = 80;
float noiseStength = 1;


boolean displayEllipse = true;


void setup ()
{
  size (600, 600);
  // smooth();
  frameRate (50);

  initVariables();
}

void draw ()
{
  //background (#57385c);
  background(254, 190, 126);
  displayNoiseGrid (25, noiseScale, noiseStength);
  displayNoiseField (25, noiseScale, noiseStength);

  fill (#ffedbc);
  stroke (#57385c);
  strokeWeight (2);

  int i = 0;
  while (i < s.length)
  {
    moveBall(loc [i], dir [i], s [i]);
    checkEdges (loc [i], dir [i]);
    if (displayEllipse ) drawBall( loc [i]);
    i = i + 1;
  }
}

void checkEdges (PVector location, PVector direction)
{
  if (location.x < 0)
  {
    location.x = random (width);
    location.y = random (width);
  }
  if (location.x > width)
  {
    location.x = random (width);
    location.y = random (width);
  }

  if (location.y < 0)
  {
    location.x = random (width);
    location.y = random (width);
  }
  if (location.y > height)
  {
    location.x = random (width);
    location.y = random (width);
  }
}

void moveBall (PVector location, PVector direction, float speed)
{

  float angle = noise (location.x / noiseScale, location.y / noiseScale, (float) frameCount / noiseScale) * TWO_PI * noiseStength; 
  direction.x = cos (angle);
  direction.y = sin (angle);


  PVector velocity = direction.get(); // kopiert direction
  velocity.mult (speed); 
  location.add (velocity);
}

void drawBall (PVector location)
{

  ellipse (location.x, location.y, location.z, location.z);
}

void initVariables ()
{
  int i = 0;
  while (i < s.length) 
  {
    PVector location = new PVector (random (width), random (height), 10);

    float angle = random (TWO_PI);
    PVector direction = new PVector (cos (angle) * 1, sin (angle) * 1);

    float speed = random (1, 3);

    loc [i] = location;
    dir [i] = direction;
    s[i] = speed;

    i = i + 1;
  }
}

void mousePressed ()
{
  noiseScale = random (10, 200);
  noiseStength = random (0.3, 10);
  initVariables ();
}

void displayNoiseField (int steps, float noiseScale, float noiseStrength)
{
  stroke (#FFFFFF);
  strokeWeight (1);
  for (int i = 0; i < width; i += steps)
  {
    for (int j = 0; j < height; j += steps)
    {
      float noiseVal = noise (i / noiseScale, j / noiseScale, frameCount / noiseScale) * TWO_PI * noiseStrength;
      arrow (i, j, steps, 10, noiseVal);
    }
  }
}

void displayNoiseGrid(int steps, float noiseScale, float noiseStrength)
{
  noStroke();
  for (int i = 0; i < width; i += steps)
  {
    for (int j = 0; j < height; j += steps)
    {
      float noiseVal = noise (i / noiseScale, j / noiseScale, frameCount / noiseScale) * 255 * noiseStrength;
      fill (#57385c, noiseVal);
      rect (i, j, steps, steps);
    }
  }
}

void arrow (float x, float y, float r, float ar, float angle)
{
  float endX = x + cos (angle)*r;
  float endY = y + sin (angle)*r;
  line (x, y, endX, endY );
  line (endX, endY, endX + cos (angle-PI * 0.88) * ar, endY + sin (angle-PI*0.88) * ar);
  line (endX, endY, endX + cos (angle-PI * 1.12) * ar, endY + sin (angle-PI*1.12) * ar);
}

void keyPressed ()
{
 displayEllipse = !displayEllipse;
}

