
// Backface Culling 2D
// If a ray can strike a line because its normal faces the ray, render the line in black.
// Otherwise, render it in gray.
// Ted Brown # January 6, 2011

PFont font;
Line line1, line2, line3, line4;

void setup() {
/////////////////////////////////////////////////////////////////////////////////
  size(600, 600);
  font = createFont("Verdana", 12);
  textFont(font);
  textAlign(CENTER);
  stroke(0);
  fill(0);
  line1 = new Line(50, 0, 50, height);
  line2 = new Line(550, height, 550, 0);
  line3 = new Line(0, 300, width, 600);
  line4 = new Line(width, 300, 0, 0);
}

void draw() {
/////////////////////////////////////////////////////////
  background(255);
  float hx = width/2;
  float hy = height/2;
  float theta = getTheta(mouseX, mouseY, hx, hy);
  float mx = hx + (cos(theta) * 100);
  float my = hy + (sin(theta) * 100);
  stroke(0);
  line(hx, hy, mx, my);

  line1.render(theta);
  line2.render(theta);
  line3.render(theta);
  line4.render(theta);

}

boolean rayCanStrikeFacing (float rayTheta, float facingTheta) {
/////////////////////////////////////////////////////////
  float reflection = abs(rayTheta - facingTheta);
  if (reflection > HALF_PI && reflection < TWO_PI - HALF_PI) return true;
  else return false;
}

class Line {
//-----------------------------------------------------------------------------//
  
  PVector v1, v2;
  float facing, theta;
  
  Line(float x1, float y1, float x2, float y2) {
  //////////////////////////////////////
    v1 = new PVector(x1, y1, 0f);
    v2 = new PVector(x2, y2, 0f);
    theta = getTheta(v1, v2);
    facing = theta + radians(90); // uses "clockwise" normal facing
  }
  
  void render(float theta) {
  //////////////////////////////////////
    if (rayCanStrikeFacing(theta, facing)) stroke(0);
    else stroke(192);

    line(v1.x, v1.y, v2.x, v2.y);
    float nx1 = (v1.x + v2.x) / 2;
    float ny1 = (v1.y + v2.y) / 2;
    float nx2 = nx1 + (cos(facing) * 10);
    float ny2 = ny1 + (sin(facing) * 10);
    line(nx1, ny1, nx2, ny2);
  }
  
}

float getTheta (float x1, float y1, float x2, float y2) {
/////////////////////////////////////////////////////////
  return atan2(y1 - y2, x1 - x2);
}

float getTheta (PVector v1, PVector v2) {
/////////////////////////////////////////////////////////
  return atan2(v1.y - v2.y, v1.x - v2.x);
}


