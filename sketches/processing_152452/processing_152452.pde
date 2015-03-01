
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang, Jon McCormack as Modified by K. L!tz
 * 
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */
float x1, y1;      // current drawing position
float dx1, dy1;    // change in position at each frame
float rad1;       // radius for the moving hand

float x2, y2;      // current drawing position
float dx2, dy2;    // change in position at each frame
float rad2;       // radius for the moving hand

void setup() {
  size(800, 500);

  // initial position in the centre of the screen
  x1 = width/3;
  y1 = height/3;

  // dx and dy are the small change in position each frame
  dx1 = random(-1, 1);
  dy1 = random(-1, 1);
  
  // initial position in the centre of the screen
  x2 = 2*width/3;
  y2 = 2*height/3;

  // dx and dy are the small change in position each frame
  dx2 = random(-1, 1);
  dy2 = random(-1, 1);
  background(0);
}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  rad1 = radians(frameCount);
  rad2 = radians(frameCount);

  // calculate new position
  x1 += dx1;
  y1 += dy1;

  x2 += dx2;
  y2 += dy2;

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x1 > width-100 || x1 < 100) {
    dx1 = dx1 > 0 ? -random(min, max) : random(min, max);
  }

  if (y1 > height-100 || y1 < 100) {
    dy1 = dy1 > 0 ? -random(min, max) : random(min, max);
  }

  float bx1 = x1 + 100 * sin(rad1);
  float by1 = y1 + 100 * cos(rad1);
  //second movement
  if (x2 > width-100 || x2 < 100) {
    dx2 = dx2 > 0 ? -random(min, max) : random(min, max);
  }

  if (y2 > height-100 || y2 < 100) {
    dy2 = dy2 > 0 ? -random(min, max) : random(min, max);
  }

  float bx2 = x2 + 100 * sin(rad2);
  float by2 = y2 + 100 * cos(rad2);

  fill(180);

  float radius1 = 100 * sin(rad1*0.1);
  float handX1 = bx1 + radius1 * sin(rad1*3);
  float handY1 = by1 + radius1 * cos(rad1*3);

  stroke(255, 50);
  line(bx1, by1, handX1, handY1);
  ellipse(handX1, handY1, 2, 2);
  //second top
  
  float radius2 = 100 * sin(rad2*0.1);
  float handX2 = bx2 + radius2 * sin(rad2*3);
  float handY2 = by2 + radius2 * cos(rad2*3);

  stroke(255, 50);
  line(bx2, by2, handX2, handY2);
  ellipse(handX2, handY2, 2, 2);
}


