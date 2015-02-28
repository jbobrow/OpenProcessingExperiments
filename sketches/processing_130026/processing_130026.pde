
int directionX = 5, directionY = 5;
float x, y, speed=0.5;
boolean NORTH, SOUTH, WEST, EAST;



void setup()
{
  size(500, 500);
  smooth();
  // place the square in center of screen 
  x = width>>1;    
  y = height>>1;
}
void draw()
{
// declare what each direction means in processing
  if (NORTH)  y -= directionY;
  if (SOUTH)  y += directionY;
  if (WEST)   x -= directionX;
  if (EAST)   x += directionX;
  background(0);


  // this checks for the boundaries of the screen and keeps square inside them
  if (x>width-20) x = width-20;
  if (x<0) x = 0;
  if (y>height-20)y = width-20;
  if (y<0) y = 0;


  fill (random(255), random(255), random(100)); 
  rect(x, y, 20, 20);
}
// movement in all directions
void keyPressed() {
  if (keyCode == UP    | keyCode == 'W') NORTH = true;
  else if (keyCode == DOWN  | keyCode == 'S')  SOUTH = true;
  else if (keyCode == LEFT  | keyCode == 'A')  WEST  = true;
  else if (keyCode == RIGHT | keyCode == 'D')  EAST  = true;
}


void keyReleased() {
  if (keyCode == UP    | keyCode == 'W')   NORTH = false;
  else if (keyCode == DOWN  | keyCode == 'S')   SOUTH = false;
  else if (keyCode == LEFT  | keyCode == 'A')   WEST  = false;
  else if (keyCode == RIGHT | keyCode == 'D')   EAST  = false;
}
