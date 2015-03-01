
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;

void setup() {
  size(800, 600);

}

void draw() {
  background(255);

    
    if (x+100 > width || x+100 < 0) { // left wall
      xspeed = -xspeed; // go the other way
    }
    if (x > width || x < 0) { // right wall
      xspeed = -xspeed; // go the other way
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
    }
    
    ellipse(x, y, 20, 20);
    ellipse(x+50,y,20,20);
    ellipse(x+100,y,20,20);
  
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}


