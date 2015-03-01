
PVector [] loc = new PVector [300];
PVector [] dir = new PVector [300];
float [] s = new float [300];

float noiseScale = 80;
float noiseStength = 1;


void setup ()
{
  size (600, 600);
  smooth();
  frameRate (30);

  initVariables();
  background (#57385c);
}

void draw ()
{
  //  background (255);

  fill (#57385c, 15);
  noStroke();
  rect (0, 0, width, height);

  fill (#ffedbc);
  noStroke();
   stroke (#A75265, 120);

  int i = 0;
  while (i < s.length)
  {
    moveBall(loc [i], dir [i], s [i]);
    checkEdges (loc [i], dir [i]);
    drawBall( loc [i]);
    i = i + 1;
  }
}

void checkEdges (PVector location, PVector direction)
{
  if (location.x < 0)
  {
    location.x = random (width);
    location.y = random (height);
  }
  if (location.x > width)
  {
    location.x = random (width);
    location.y = random (height);
  }

  if (location.y < 0)
  {
    location.x = random (width);
    location.y = random (height);
  }
  if (location.y > height)
  {
    location.x = random (width);
    location.y = random (height);
  }
}

void moveBall (PVector location, PVector direction, float speed)
{
  
  float angle = noise (location.x / noiseScale, location.y / noiseScale, frameCount / noiseScale) * TWO_PI * noiseStength; 
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
    PVector location = new PVector (random (width), random (height), random (2, 8));

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

// init
// zeichnen
// move
// kantenÃ�Â¼berprÃ�Â¼fung

