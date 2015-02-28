

int x_direction = 5;
int y_direction = 3;      // start moving up
int x_value;              // Ball's x posiiton
int y_value;              // ball's y position
void setup()
{
  size(400,400);          // make screen 400x400 pixels
  background(128);        // set backgroung to white
  strokeWeight(22);      // a fairly large ball
  stroke(255,0,0);      // red in color
  x_value = width/3;    // start a third of the way over
  y_value = height/2;   // and halfway down
}


void draw()
{
  stroke(128);
  point(x_value, y_value);
  if (x_value >= width-10 || x_value < 10)     // if at one of the sides
  {
      x_direction = x_direction * -1;          // change x direction
  }
  
  if (y_value >= height-10 || y_value < 10)    // if at the top or bottom
  {
      y_direction = y_direction * -1;          // change y direction
  }
  
  x_value = x_value + x_direction;             // move diagonally
  y_value = y_value + y_direction;
  stroke(255,0,0);                             // red
  point(x_value, y_value);
  saveFrame("bouncing.jpg");
}

