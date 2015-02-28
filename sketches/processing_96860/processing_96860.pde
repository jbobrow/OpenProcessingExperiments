
int rad = 40;      
float xpos, ypos;       

float xspeed = 19;  
float yspeed = 16; 

int xdirection = 1;  
int ydirection = 1; 


void setup() 
{
  size(1000, 540);
  noStroke();
  fill(204, 102, 0);
  frameRate(30);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(0);
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
  ellipse(xpos, ypos, rad, rad);
}


