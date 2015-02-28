
int x = 100;
int y = 100;
int xspeed = 1;
int yspeed = 3;


void setup() {
  size(400,400);
  background(255);
}

void draw() {
  background(255);
  noStroke();
  fill(255,10);
 
  x = x + xspeed;
  y = y + yspeed;
  
 if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  
  fill(175);
  ellipse(x,y,16,16);
}
