
PVector location;
PVector direction;
float speed;
 
 
void setup ()
{
  size(600, 200);
  smooth();
 
  frameRate (30);
 
  initVariables();
}
 
void draw ()
{
  background (#57385c);
 
  strokeWeight (2);
  stroke (#A75265);
  fill (#ffedbc);
  
  moveBall();
  checkEdges ();
  drawBall();
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
 
  PVector velocity = direction.get(); // kopiert direction
  velocity.mult (speed);
  location.add (velocity);
}
 
void drawBall ()
{
  ellipse (location.x, location.y, 40, 40);
}
 
void initVariables ()
{

  location = new PVector (width/2, height/2);
 
  angle = random (TWO_PI);
  direction = new PVector (cos (angle) * 1, sin (angle) * 1);
 
  speed = random (3, 6);

}
 
void mousePressed ()
{
  initVariables ();
}
 
// init
// zeichnen
// move
// kantenÃ¼berprÃ¼fung
