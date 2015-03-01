
//not my original code at all

int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 3.1;  // Speed of the shape

int xdirection = 7;  // Left or Right
int ydirection = 4;  // Top to Bottom


void setup() 
{
  size(640, 360);
  background(143, 240, 198);
  frameRate(65);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/3;
  ypos = height/2;
}

void draw() 
{

  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  fill(random(255),0,random(255));
  rectMode(CENTER);
  rect(xpos, ypos, rad, rad);
}
