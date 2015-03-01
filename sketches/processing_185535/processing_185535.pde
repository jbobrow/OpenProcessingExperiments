
//For this weeks assignment, I decided to figure out how to do problem #7 from the test since I wasn't able to attempt it at all last Thursday.

int rad = 40;        
float xpos, ypos;        

float xspeed = 2.8;  
float yspeed = 2.2;  

int xdirection = 1;  
int ydirection = 1;  


void setup() 
{
  size(640, 360);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(102);
  
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
 
  if (xpos > width-rad || xpos < rad+50) { //By trial and error, I figured out that +50 was the right amount of buffer I needed for the ellipse to properly bounce off the left wall.
    xdirection *= -1;
    rad-=5; // Added lines so that the ellipses get smaller everytime they bounce off the wall
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
    rad-=5;
  }

// This for loop represents something I struggled with on number 8 as well. 
// I was able to get the over all function on number 8, but I could not figure out how to write a loop which allows me to only write the ellipse () code once. 

  for(int i=0; i<3; i++) {
  float ref= xpos + (i*rad)-(2*rad);
  stroke(1);
  ellipse(ref, ypos, rad, rad);
  }
}


