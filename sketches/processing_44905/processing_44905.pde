
 PImage lupin;
 PImage castle;
 
int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom




void setup() 
{
  size(768,576);
 
  noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  xpos = width/4;
  ypos = height/2;
   castle = loadImage ("night_castle.jpg");
   lupin =loadImage ("lupin.gif");
}

void draw() 
{
 background (castle);
 
 
  
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
  //translate (mouseX,mouseY);
 
 image (lupin,xpos+size/10, ypos+size/2);
}

