
int x = 200;
int y = 20; 
int xspeed = 3;
int yspeed = 3;
int spacing = 50;
void setup() {
  size(800, 600);

}

void draw() {
  background(255);
  
    int xpos1 = x; // actual x position.  Add to this line
    int ypos1 = y;
    int xpos2 = x + spacing;
    int xpos3 = x + spacing*2;
    
    if (xpos1 > width || xpos1 < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
    } else if (xpos2 > width || xpos2 < 0) {
      xspeed = -xspeed;
    } else if (xpos3 > width || xpos3 < 0) {
      xspeed = -xspeed;
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
    }
    ellipse(xpos1, y, 20, 20);
    ellipse(xpos2, y, 20, 20);
    ellipse(xpos3, y, 20, 20);
  
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}


