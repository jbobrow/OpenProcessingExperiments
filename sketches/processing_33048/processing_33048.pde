
int diam = 60;
float xpos, ypos;

float xspeed = 2.5;
float yspeed = 2.3;

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup()
{
  size (600, 400);
   noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw()
{
 background(255, 0, 0);
 //changing position-redrawing
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

//bounce
if(xpos >width-diam || xpos < 0) {
   xdirection *= -1;
}
if(ypos >height-diam || ypos < 0) {
  ydirection *= -1;
}
//interaction with mouse.  if the distance of center is less than 30, reverse direction
  if (dist(xpos, ypos, mouseX, mouseY) <= diam/2) {
    ydirection *= -1;
  }
   if (dist(xpos, ypos, mouseX, mouseY) <= diam/2) {
    xdirection *= -1;
   }
   
  //draw circle
    ellipse(xpos+diam/2, ypos+diam/2, diam, diam);
    println(xpos+", "+ypos);
}

