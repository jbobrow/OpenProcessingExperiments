
void setup() {
  size(600, 600);
  frameRate(1);
}

void draw() {
  background(154, 78, 193);
  noStroke();

  float opacity; 
  int orientation;
  float triangleX;
  float triangleY;
  float base;
  float redValue;
  float greenValue;
  float blueValue;
  float smallTriX;
  float smallTriY;

  for (int i=5; i > 0; i--) {
    //4 sizes of triangles
    for (int j=0; j <= 12; j++) {
      //12 triangles of each size, biggest on the bottom
      triangleX = random(0, width);
      triangleY = random(0, height);
      orientation = int(random(0, 4));
      //change the size of the triangles based on iteration 
      //through top loop 
      base = i*60;
      redValue = random(0, 130);
      blueValue = random(130, 255);
      greenValue = random(120, 230);
      opacity = 50+6*i;
      fill(redValue, greenValue, blueValue, opacity);
      drawEquilateralTriangle(triangleX, triangleY, base, 
      orientation);
      smallTriX = triangleCenterX(triangleX, triangleY, base, 
      orientation);
      smallTriY = triangleCenterY(triangleX, triangleY, base, 
      orientation);
      opacity = 100;
      base /= 10;
      fill(redValue, greenValue, blueValue, opacity);
      drawSmallTriangle(smallTriX, smallTriY, base, orientation);
    }
  }
}

void drawEquilateralTriangle(float x, float y, float base, 
int orientation) {
  float triHeight = (base/2)*sqrt(3);
  if (orientation == 0) {
    //input point at top
    triangle(x, y, x-base/2, y+triHeight, x+base/2, y+triHeight);
  }
  if (orientation == 1) {
    //input point at right
    triangle(x, y, x-triHeight, y-base/2, x-triHeight, y+base/2);
  }
  if (orientation == 2) {
    //input point at bottom
    triangle(x, y, x-base/2, y-triHeight, x+base/2, y-triHeight);
  }
  if (orientation == 3) {
    //input point at left
    triangle(x, y, x+triHeight, y-base/2, x+triHeight, y+base/2);
  }
}

float triangleCenterX(float x, float y, float base, 
int orientation) {
  float triHeight = (base/2)*sqrt(3);
  float centerX = 0;
  if (orientation == 0) {
    //input point at top
    centerX = x;
  }
  if (orientation == 1) {
    //input point at right
    centerX = x-triHeight/2-15;
  }
  if (orientation == 2) {
    //input point at bottom
    centerX = x;
  }
  if (orientation == 3) {
    //input point at left
    centerX = x+triHeight/2+15;
  }
  return centerX;
}

float triangleCenterY(float x, float y, float base, 
int orientation) {
  float triHeight = (base/2)*sqrt(3);
  float centerY = 0;
  if (orientation == 0) {
    //input point at top
    centerY = y+triHeight/2+15;
  }
  if (orientation == 1) {
    //input point at right
    centerY = y;
  }
  if (orientation == 2) {
    //input point at bottom
    centerY = y-triHeight/2-15;
  }
  if (orientation == 3) {
    //input point at left
    centerY = y;
  }
  return centerY;
}

void drawSmallTriangle(float x, float y, float base, 
int orientation) {
  float triHeight = (base/2)*sqrt(3);
  if (orientation == 0) {
    //input point at top
    triangle(x, y, x-base/2, y+triHeight, x+base/2, y+triHeight);
  }
  if (orientation == 1) {
    //input point at right
    triangle(x, y, x-triHeight, y-base/2, x-triHeight, y+base/2);
  }
  if (orientation == 2) {
    //input point at bottom
    triangle(x, y, x-base/2, y-triHeight, x+base/2, y-triHeight);
  }
  if (orientation == 3) {
    //input point at left
    triangle(x, y, x+triHeight, y-base/2, x+triHeight, y+base/2);
  }
}

