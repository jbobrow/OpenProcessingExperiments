

float circleX1 = 200;
float circleY1 = 200;
float circleRadius1 = 100;

float circleX2, circleY2;
float circleRadius2 = 20;


void setup() {
  size(400, 400); 
  ellipseMode(RADIUS);
  smooth();
}

void draw() {
  background(204);
  
  circleX2 = mouseX;
  circleY2 = mouseY;
  
  if (circleCircleIntersect(circleX1, circleY1, circleRadius1, circleX2, circleY2, circleRadius2) == true) {
    fill(0); 
  } else {
    fill(255); 
  }
  
  ellipse(circleX1, circleY1, circleRadius1, circleRadius1);
  ellipse(circleX2, circleY2, circleRadius2, circleRadius2);
  
}

boolean circleCircleIntersect(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } else {
    return false;
  }
}


