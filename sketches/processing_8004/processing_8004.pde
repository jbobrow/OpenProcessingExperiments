

float circleX, circleY;
float circleRadius = 20;

float rectX = 100;
float rectY = 100;
float rectWidth = 190;
float rectHeight = 120;

void setup() {
  size(400, 400); 
  ellipseMode(RADIUS);
  smooth();
}

void draw() {
  background(204);

  circleX = mouseX;
  circleY = mouseY;

  if (rectCircleIntersect(rectX, rectY, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    fill(0); 
  } 
  else {
    fill(255); 
  }

  rect(rectX, rectY, rectWidth, rectHeight); 
  ellipse(circleX, circleY, circleRadius, circleRadius); 

}

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; } 
  if (circleDistanceY <= rh/2) { return true; }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}


