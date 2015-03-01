
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
    
    if (xpos > width-145 || xpos < -40) { // left and right walls
      xspeed = -xspeed; // go the other way
    }
    if (y > height || y < 0+10) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
    }
    float spacing=10;
    while (spacing<100) {
    spacing=spacing+40;
    ellipse(xpos+spacing, y, 20, 20);
    }
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}
