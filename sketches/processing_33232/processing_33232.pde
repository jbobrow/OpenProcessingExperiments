
int diam = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() 
{
  size(640, 200);
  fill(0,50,70);
  noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(102,40,140);
  
  // Update the position of the shape
  //everytime you start the draw function it's going to add so it will to that direction
  xpos +=  xspeed * xdirection ;
  ypos +=  yspeed * ydirection ;
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-diam || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-diam || ypos < 0) {
    ydirection *= -1;
  }
  
 if(dist(mouseX,mouseY,xpos,ypos) <= diam/2) {
   xdirection *= -3;
 }

  // Draw the shape
  ellipse(xpos+diam/2, ypos+diam/2, diam, diam);
}


