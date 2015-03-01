
// day 6: new random line confined to a frame

float x1, y1;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand
int currentFrame = 0;

void setup() {
  size(500, 500);
  // initial position in the centre of the screen
  x1 = width/2;
  y1 = height/2;
  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  //background
  background(0,0,50);
}


void draw() {
  //different speed, differnt directions
  float max = 4;
  float min = 3;
  
// calculate new position
  x1 += dx;
  y1 += dy;
  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if ( x1 > width-50 || x1 < 50) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }
  if (y1 > height-50 || y1 < 50) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

  // circles that come a line with out a background fill
  noStroke();
  fill(255,0,50);
  ellipse(x1,y1,8,8);
 
}




