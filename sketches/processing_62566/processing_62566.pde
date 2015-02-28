
int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    
float x2pos, y2pos;

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

int x2direction = 1;  // Left or Right
int y2direction = 1;  // Top to Bottom

void setup() 
{
  size(640, 200);
  noStroke();
  frameRate(60);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;

  x2pos = width/6;
  y2pos = height/6;






}

void draw() 
{
  background(3);

  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }

  // Draw the shape
  // Draw the shape
  ellipse(xpos+size/2, ypos+size/2, size, size);

  x2pos = x2pos + (xspeed * x2direction);
  y2pos = y2pos + (yspeed * y2direction);


  if (x2pos > width-size || x2pos < 0) {
    x2direction *= -1;
  }
  if (y2pos > height-size || y2pos < 0) {
    y2direction *= -1;
  }

  // Draw the shape
  // Draw the shape
  ellipse(x2pos+size/2, y2pos+size/2, size, size);




}
