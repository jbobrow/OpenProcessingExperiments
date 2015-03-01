
/*
 * Creative Coding
 * Excercise for Week 3, 04 - FingerPaintTop
 * by DEFurugen
 * With virtual top code by Phillips Cousins
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */


float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand

void setup() {
  size(500, 500);
  // initial position in the centre of the screen
  x = width/2;
  y = height/2;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(0);
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  //fill(20, 25);
  //rect(0, 0, width, height);
  //rad = radians(frameCount);

  // calculate new position
  x += dx;
  y += dy;

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-180 || x < 180) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }

  if (y > height-180 || y < 180) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

  float bx = x + 80 * sin(rad);
  float by = y + 80 * cos(rad);

  fill(180);

  float radius = 80 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);

  stroke(25, 50);
  //line(bx, by, handX, handY);
  ellipse(handX, handY, 3, 3);
  
  //virtual top design code courtesy of Phillip Cousins
  fill(0,200,200); 
  rect(handX-4-dx, handY-60, 9+dx,25); 
  fill(100,100,200); 
  rect(handX-3, handY-60,6, 25); 
  fill(0,0,200); 
  triangle(handX, handY, handX-20, handY-35, handX+20, handY-35); 
  fill(100,200,200); 
  triangle(handX, handY, handX-23-dx*8, handY-35, handX+23+dx*8, handY-35); 
  fill(0,0,200); 
  line(handX-dx, handY-35, handX, handY);
}



