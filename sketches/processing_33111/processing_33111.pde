
//Nicole Del Senno
//N00211488

int diam = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

//float xspeed = 2.8;  // Speed of the shape
//float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

float gravity= 0.1;
float speed=1;


void setup() 
{
  size(640, 200);
  noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(102);
  
  //define speed to include gravity
  speed = speed + gravity;
 
  // Update the position of the shape
  xpos = xpos + speed;
  ypos = ypos + speed;
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-diam || xpos < 0) {
    //xdirection *= -1;
    speed=speed*-.9;
  }
  if (ypos > height-diam || ypos < 0) {
    //ydirection *= -1;
    speed=speed*-.9;
  }

  // Draw the shape
  ellipseMode(CORNER);
  ellipse(xpos,ypos,diam,diam);
}


