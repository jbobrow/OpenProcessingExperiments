
int x1 = 1;
int y1 = 50;
int xspeed = 10;
int yspeed = 1;
int x3 = 50;
int y3 = 50;


void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
}
 
void draw() {
 
  if (x1 > width || x1 < 0) {
    if (x1 > width) {
      xspeed = int(random(-10, -1));
      x1 = width;
    }
    else{
      xspeed = int(random(1, 10));
      x1 = 0;
    }
  }
  x1 = x1 + xspeed;
 
  if (y1 > height || y1 < 0) {
    if (y1 > height) {
      yspeed = int(random(-10, -1));
      y1 = height;
    }
    else{
      yspeed = int(random(1, 10));
      y1 = 0;
    }
  }
  y1 = y1 + yspeed;
 
  fill(0);
  stroke(180,0,0);
  strokeWeight(1);
  line(x3, y3, x1, y1);
 

}




