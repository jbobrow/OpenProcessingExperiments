

float rX1 = 100;  // x
float rY1 = 100;  // y
float rW1 = 190;  // width
float rH1 = 120;  // height

float rX2;        // x
float rY2;        // y
float rW2 = 90;   // width
float rH2 = 20;   // height

void setup() {
  size(400, 400); 
  ellipseMode(RADIUS);
  smooth();
}

void draw() {
  background(204);
  
  rX2 = mouseX;
  rY2 = mouseY;
  
  if (rectRectIntersect(rX1, rY1, rX1+rW1, rY1+rH1, rX2, rY2, rX2+rW2, rY2+rH2) == true) {
    fill(0); 
  } else {
    fill(255); 
  }
  
  rect(rX1, rY1, rW1, rH1); 
  rect(rX2, rY2, rW2, rH2); 
  
}

boolean rectRectIntersect(float left, float top, float right, float bottom, 
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


