
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;

void setup() {
  size(640, 640);

}

void draw() {
  background(255);
  
    int xpos = x; // actual x position.  Add to this line
    int ypos = y;
    
    if (xpos > width-100 || xpos < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
    }
  for (int i = 0; i <= 100; i += 50){
    ellipse(i+xpos, y, 20, 20);
  }
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}




