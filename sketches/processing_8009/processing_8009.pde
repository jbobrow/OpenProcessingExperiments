

float circleX = 200;
float circleY = 200;
float circleRadius = 100;

float lineX1 = 350;
float lineY1 = 350;
float lineX2, lineY2;

void setup() {
  size(400, 400); 
  ellipseMode(RADIUS);
  smooth();
}

void draw() {
  background(204);

  lineX2 = mouseX;
  lineY2 = mouseY;

  if (circleLineIntersect(lineX1, lineY1, lineX2, lineY2, circleX, circleY, circleRadius) == true) {
    fill(0); 
  } 
  else {
    fill(255);
  }

  ellipse(circleX, circleY, circleRadius, circleRadius);
  line(lineX1, lineY1, lineX2, lineY2);

}

// Code adapted from Paul Bourke:
// http://local.wasp.uwa.edu.au/~pbourke/geometry/sphereline/raysphere.c
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) {
  float dx = x2 - x1;
  float dy = y2 - y1;
  float a = dx * dx + dy * dy;
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
  float c = cx * cx + cy * cy;
  c += x1 * x1 + y1 * y1;
  c -= 2 * (cx * x1 + cy * y1);
  c -= cr * cr;
  float bb4ac = b * b - 4 * a * c;

  //println(bb4ac);

  if (bb4ac < 0) {  // Not intersecting
    return false;
  } 
  else {
    
    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
    float ix1 = x1 + mu*(dx);
    float iy1 = y1 + mu*(dy);
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
    float ix2 = x1 + mu*(dx);
    float iy2 = y1 + mu*(dy);

    // The intersection points
    //ellipse(ix1, iy1, 10, 10);
    //ellipse(ix2, iy2, 10, 10);
    
    float testX;
    float testY;
    // Figure out which point is closer to the circle
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) {
      testX = x2;
      testY = y2; 
    } else {
      testX = x1;
      testY = y1; 
    }
    
    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) {
      return true;
    } else {
      return false;
    }
  }
}




