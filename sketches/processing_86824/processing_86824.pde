
/**
 * Bounce. 
 * 
 * When the shape hits the edge of the window, it reverses its direction. 
 */
 
int rad = 120;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() 
{
  size(640, 480);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  background(240,147,53);
}

void draw() {
  
  
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
  fill(random(255),random(255),random(255),50);
  ellipse(xpos, ypos, rad, rad);
  stroke( mouseX, mouseY, mouseY, 125);
  strokeWeight(20);
  line( width/2, height/2, mouseX, mouseY);
  /*
  noStroke();
  fill(0,150,179,50);
  ellipse(width/2,height/2,100,100);
  */
  rect(random(width),random(height), 40, 200, 100);
  //rect(random(width), random(height), 200,100);
  
}

  


