

float lineX1 = 50;
float lineY1 = 100;
float lineX2;
float lineY2;

float rectX = 100;
float rectY = 90;
float rectWidth = 200;
float rectHeight = 90;

void setup() {
  size(400, 400); 
  ellipseMode(RADIUS);
  smooth();
}

void draw() {
  background(204);

  lineX2 = mouseX;
  lineY2 = mouseY + 60;
  lineX1 = width-mouseX;
  lineY1 = height-mouseY + 60;

  if (lineRectangleIntersect(lineX1, lineY1, lineX2, lineY2, rectX, rectY, rectWidth, rectHeight) == true) {
    fill(0); 
  } 
  else {
    fill(255); 
  }

  line(lineX1, lineY1, lineX2, lineY2);
  rect(rectX, rectY, rectWidth, rectHeight);

}

// Code from Seb Lee-Delisle:
// http://sebleedelisle.com/2009/05/super-fast-trianglerectangle-intersection-test/

boolean lineRectangleIntersect(float x1, float y1, float x2, float y2, 
                               float rx, float ry, float rw, float rh) {
                                 
  float topIntersection;
  float bottomIntersection;
  float topPoint;
  float bottomPoint;

  // Calculate m and c for the equation for the line (y = mx+c)
  float m = (y2-y1) / (x2-x1);
  float c = y1 -(m*x1);

  // If the line is going up from right to left then the top intersect point is on the left
  if(m > 0) {
    topIntersection = (m*rx  + c);
    bottomIntersection = (m*(rx+rw)  + c);
  }
  // Otherwise it's on the right
  else {
    topIntersection = (m*(rx+rw)  + c);
    bottomIntersection = (m*rx  + c);
  }

  // Work out the top and bottom extents for the triangle
  if(y1 < y2) {
    topPoint = y1;
    bottomPoint = y2;
  } else {
    topPoint = y2;
    bottomPoint = y1;
  }

  float topOverlap;
  float botOverlap;

  // Calculate the overlap between those two bounds
  topOverlap = topIntersection > topPoint ? topIntersection : topPoint;
  botOverlap = bottomIntersection < bottomPoint ? bottomIntersection : bottomPoint;

  return (topOverlap<botOverlap) && (!((botOverlap<ry) || (topOverlap>ry+rh)));

}




