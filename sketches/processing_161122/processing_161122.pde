
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);

  if (x > width-50 || x < 0+50) {
    xspeed = -xspeed;
  }
  if (y > height || y < 0) {
    yspeed = -yspeed; 
  }
  
  fill(0,255,0);
  ellipse(x, y, 20, 20);
  fill(0,0,255);
  ellipse (x+50, y, 20, 20);
  fill(255,0,0);
  ellipse (x-50, y, 20, 20);


  x+=xspeed; // this effectively moves them
  y+=yspeed;
}



