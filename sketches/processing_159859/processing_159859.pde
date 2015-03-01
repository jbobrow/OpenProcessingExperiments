
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;
 
void setup() {
  size(800, 600);
 
}
 
void draw() {
  background(255);
   
    int xpos = x; // actual x position.  Add to this line
    int ypos = y;
     
    if (xpos > width-10 || xpos -130 < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
    }
    if (y > height-10 || y < 0 + 10) { // top and bottom walls
      yspeed = -yspeed; // go the other way
    }
    ellipse(xpos, y, 20, 20);
    ellipse(xpos-60, y, 20, 20);
    ellipse(xpos-120, y, 20, 20);
   
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}



