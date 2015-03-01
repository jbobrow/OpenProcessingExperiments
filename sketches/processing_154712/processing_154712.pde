
int num= 200;
PVector [] loc = new PVector [num];
PVector [] dir = new PVector [num];
float [] s = new float [num];


void setup ()
{
  size(600, 600);
  smooth();

  frameRate (30);

  initVariables();
}

void draw ()
{
    background (#57385c);

/*
  fill (#57385c, 50);
  noStroke();
  rect (0, 0, width, height);
*/
  stroke (#A75265, 120);
  fill (#ffedbc);
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
    location.x = 0;
    direction.x = direction.x * -1;
  }
  if (location.x > width)
  {
    location.x = width;
    direction.x = direction.x * -1;
  }

  if (location.y < 0)
  {
    location.y = 0;
    direction.y = direction.y * -1;
  }
  if (location.y > height)
  {
    location.y = height;
    direction.y = direction.y * -1;
  }
}

void moveBall (PVector location, PVector direction, float speed)
{
  float angle = atan2 (mouseY - location.y, mouseX - location.x);
  PVector target = new PVector ( cos (angle), sin (angle));
  target.mult (0.1);

  direction.add (target);
  direction.normalize();

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
    PVector location = new PVector (width/2, height/2, random (2, 8));

    float angle = random (TWO_PI);
    PVector direction = new PVector (cos (angle) * 1, sin (angle) * 1);

    float speed = random (3, 10);

    loc [i] = location;
    dir [i] = direction;
    s[i] = speed;

    i = i + 1;
  }
}

void mousePressed ()
{
  initVariables ();
}

// init
// zeichnen
// move
// kantenüberprüfung

