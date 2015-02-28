
//Jonah Abramson
//MouseBall
//8/6/13

//set ups program
void setup() {
  //sets size of window
  size(600,500);
  //sets background color
  background(0);
  //sets frame rate
  frameRate(60);
}

//declaring the variables and their values
int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

//tells the computer what to draw
void draw() {
  //refreshes/clears background
  background(0);
  //sets the fill color
  fill(255);
  //sets the size and position of the ball
  ellipse(x, y, 25, 25);
  if (mousePressed) {
   x = mouseX;
   y = mouseY;
  }
  x = x + dx;
  y = y + dy;
  
  //makes the rectangle move
  if ( x < 0 || x > 475) {
    dx = -1 * dx;
  }
  
  if ( y <  0 || y > 475) {
    dy = -1 * dy;
  }
}
