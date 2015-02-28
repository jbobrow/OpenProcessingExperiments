
PVector location;
PVector direction;
float speed;


void setup ()
{
  size(600, 200);
  smooth();

  frameRate (30);
  initVariables();
  
  background (#57385c);
}

void draw ()
{

  strokeWeight (2);
  stroke (#A75265, 120);
  fill (#ffedbc);

  moveBall();
  checkEdges ();
  drawBall( );
}

void checkEdges ()
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

void moveBall ()
{
  float angle = atan2 (mouseY - location.y, mouseX - location.x);
  PVector target = new PVector ( cos (angle), sin (angle));
  target.mult (0.2);

  direction.add (target);
  direction.normalize();

  PVector velocity = direction.get(); // kopiert direction
  velocity.mult (speed);
  location.add (velocity);
}

void drawBall ()
{
  ellipse (location.x, location.y, 12, 12);
}

void initVariables ()
{
  location = new PVector (width/2, height/2);

  float angle = random (TWO_PI);
  direction = new PVector (cos (angle) * 1, sin (angle) * 1);

  speed = random (3, 6);
}

void mousePressed ()
{
  if (mouseButton == RIGHT) background (#57385c);
  initVariables ();
}

