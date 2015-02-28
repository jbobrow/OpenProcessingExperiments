
void setup() {
  size(800, 600);
  frameRate(1);
}

void draw() {
  background(0);
  noStroke();

  float base = 50;
  float newBase;
  float offset;
  float triHeight = (base/2)*sqrt(3);
  float color1;
  float color2;
  float color3;

  for (int i=0; i<=9; i++) {
    for (int j=0; j<=7; j++) {
      // make cube smaller based on closeness to center
      if (i==0 || i==9 || j==0 || j==7) {
        offset = 0;
      }
      else {
        if (i==1 || i==8 || j==1 || j==6) {
          offset = 5;
        }
        else {
          if (i==2 || i==7 || j==2 || j==5) {
            offset = 15;
          }
          else {
            if (i==3 || i==6 || j==3) {
              offset = 25;
            }
            else {
              offset = 35;
            }
          }
        }
      }
      //change the size of the base
      newBase = base-offset;
      color1 = random(0, 85);
      color2 = random(86, 170);
      color3 = random(171, 256); 
      //draw cube in line if it is in an even row, shifted to
      //the left if it is an odd row
      if (j%2 == 0) {
        drawHexagon(i*2*triHeight+offset, j*1.5*base+offset/2, 
        newBase, color1, color2, color3);
      }
      else {
        drawHexagon(i*2*triHeight-triHeight+offset, 
        j*1.5*base+offset/2, newBase, color1, color2, color3);
      }
    }
  }
  //draw the bottom row that is partially offscreen
  for (int i=0; i<=9; i++) {
    color1 = random(0, 85);
    color2 = random(86, 170);
    color3 = random(171, 256); 
    drawHexagon(i*2*triHeight, 8*1.5*base, base, color1, color2, 
    color3);
  }
}

void drawHexagon(float x, float y, float base, float color1, 
float color2, float color3) {
  float triHeight = (base/2)*sqrt(3);
  //top rhombus
  fill(color1, color2, color3);
  drawRhombus(x, y, base, 0);
  //left rhombus
  fill(color2, color3, color1);
  drawRhombus(x+triHeight, y+base/2, base, 1);
  //right rhombus
  fill(color3, color1, color2);
  drawRhombus(x+triHeight, y+base/2, base, 2);
}

void drawRhombus(float x, float y, float base, int orientation) {
  float triHeight = (base/2)*sqrt(3);
  if (orientation == 0) {
    //horizontal rhombus, starting from left
    drawEquilateralTriangle(x, y, base, 3);
    drawEquilateralTriangle(x+2*triHeight, y, base, 1);
  }
  if (orientation == 1) {
    //vertical, left-tilted rhombus, starting from top-left
    drawEquilateralTriangle(x, y, base, 1);
    drawEquilateralTriangle(x-triHeight, y+base/2, base, 3);
  }
  if (orientation == 2) {
    //vertical, right-tilted, starting from top-right
    drawEquilateralTriangle(x, y, base, 3);
    drawEquilateralTriangle(x+triHeight, y+base/2, base, 1);
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


