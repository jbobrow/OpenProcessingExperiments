
PVector[] test = { 
  new PVector(127.0, 99.0), 
  new PVector(84.0, 121.0), 
  new PVector(106.0, 271.0), 
  new PVector(83.0, 355.0), 
  new PVector(181.0, 393.0), 
  new PVector(306.0, 384.0), 
  new PVector(408.0, 340.0), 
  new PVector(373.0, 215.0), 
  new PVector(432.0, 97.0), 
  new PVector(330.0, 52.0), 
  new PVector(210.0, 99.0), 
  new PVector(142.0, 69.0), 
  new PVector(128.0, 99.0)
  };

  int numIntersections;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
}

void draw() {
  background(0);
  numIntersections = 0;
  fill(255);
  for ( int i = 1; i < test.length; i++ ) {
    numIntersections += segIntersection(mouseX, mouseY, width, mouseY, test[i].x, test[i].y, test[i-1].x, test[i-1].y);
  }
  if ( numIntersections % 2 != 0 ) {
    println("INSIDE");
    fill(255, 0, 0);
  }
  else {
    println("OUTSIDE");
  }
  beginShape();
  for ( int i = 0; i < test.length; i++ ) {
    vertex(test[i].x, test[i].y);
  }
  endShape(CLOSE);
  println(numIntersections + " " + mouseX + " " + mouseY);
}

int segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float bx = x2 - x1; 
  float by = y2 - y1; 
  float dx = x4 - x3; 
  float dy = y4 - y3;
  float b_dot_d_perp = bx * dy - by * dx;
  if (b_dot_d_perp == 0) {
    return 0;
  }
  float cx = x3 - x1;
  float cy = y3 - y1;
  float t = (cx * dy - cy * dx) / b_dot_d_perp;
  if (t < 0 || t > 1) {
    return 0;
  }
  float u = (cx * by - cy * bx) / b_dot_d_perp;
  if (u < 0 || u > 1) { 
    return 0;
  }
  if (y4 > y3) {
    if (y2 == y4) {
      return 0;
    }
  } 
  else {
    if (y2 == y3) {
      return 0;
    }
  }
  return 1;
}


