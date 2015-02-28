
// draw the eye protect

int x, y, start, angle;
int distance = 200;
float xpos, ypos;

void setup() {
  size(600, 500);
  smooth();
  noStroke();
  fill(#0033FF, 120);
  frameRate(5); // 5 frames per second
  x = width/2;
  y = height/2;
}

void draw() {
  int d = 5;
  background(200);
  for (int start=angle; start<360+angle; start+=15) {
    xpos = x + distance*cos(radians(start)); // x coordinate of the circle
    ypos = y + distance*sin(radians(start)); // y coordinate of the circle
    ellipse(xpos, ypos, d, d);
    d += 2; // increase the diameter of the circle; decrease will make the movement anti-decrease
  }
  /* 
   start angle has the same step with "start";
   different step with "start" will make the circle "moved".
  */
  angle += 15;  
}
