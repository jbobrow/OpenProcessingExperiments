
//Program: processing.org
//Programmer: Tamrat N Damtew
//Date: June 3 2014.
//The ball rotates until it hits the edge which changes its direction.

int rad = 45;  // determines the width of the shape
float xpos, ypos;

float xspeed = 2.8;   // determines the speed
float yspeed = 2.2;   // determines the speed

int xdirection = 1;
int ydirection = 1;

void setup()
{
  size(440, 260);
  noStroke();
  frameRate(40);
  ellipseMode(RADIUS);
  
  xpos = width/2; // detrermoines where the shape starts.
  ypos = height/2;
}
    void draw()
    {
      background(25,250,50);
      //modifies the shape
      xpos = xpos + (xspeed * xdirection);
      ypos = ypos + (yspeed * ydirection);
      if (xpos > width-rad || xpos < rad) {
        xdirection *= -1;
      }
      if (ypos > height-rad || ypos < rad) {
        ydirection *= -1;
      }
      
      ellipse(xpos, ypos, rad, rad); // this draws the shape
    }
