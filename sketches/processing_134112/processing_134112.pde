
float beginX = 22.0;  // Initial x-coordinate
float beginY = 34.0;  // Initial y-coordinate
float endX = 22;   // Final x-coordinate
float endY = 34;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
int i = -1;
int ang = 0;
int nodraw = 0;

int[] cordsX = {61, 170, 183, 255, 359, 299, 253, 352, 414, 377, 434, 461, 500, 541, 587, 500, 587, 615};
int[] cordsY = {330, 36, 322, 267, 248, 200, 269, 319,  36, 323, 202, 320, 320, 200, 312, 300, 312, 195};
int[] angle =  {  0,  0,   0,   0,   0,   1,   0,   1,   0,   0,   1,   0,   0,   1,   0,   1,   1,   1};
int[] draw =   {  0,  0,   0,   1,   0,   0,   0,   0,   1,   0,   0,   0,   1,   0,   0,   1,   0,   0};  

void setup() {
  size(640, 360);
  background(255,33,33);
  noStroke();
}

void draw() {
  fill(0, 2);
  //rect(0, 0, width, height);
  pct += step;
  if (pct <= 1.0) {
    if (ang == 0) {
      x = beginX + (pct * distX);
      y = beginY + (pow(pct, exponent) * distY);
    } else {
      y = beginY + (pct * distY);
      x = beginX + (pow(pct, exponent) * distX);
    }
  } else {
    nextend();
  }
  if (nodraw == 0) {
    fill(255);
    ellipse(x, y, 20, 20);
  }
}

void nextend() {
  if (i >= cordsX.length - 1) {
    textSize(32);
    text("Happy Valentines Day <3", 10, 30); 
    return;
  } else { 
    i++; 
  }
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = cordsX[i];
  endY = cordsY[i];
  ang = angle[i];
  nodraw = draw[i];
  if (nodraw == 1) {
    step = 0.20;
  } else {
    step = 0.01;
  }
  distX = endX - beginX;
  distY = endY - beginY;
}

void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
  
  System.out.println(endX + "," + endY);
}


