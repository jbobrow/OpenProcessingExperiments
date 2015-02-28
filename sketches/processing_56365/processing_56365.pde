
int[] xPositions = new int[10];

void setup() {
  size(400, 400);
  background(255);
  for (int n = 0; n < xPositions.length; n ++ ) {
    xPositions[n] = (int) random (0, width);
  }
}

void draw() {
  background(255);
  increasePosition(xPositions);
  for (int n=0;n<xPositions.length;n++) {
    ellipse(xPositions[n], height/(n+1), 25, 25);
  }
}

void increasePosition(int a[]) {
  for (int n=0;n<xPositions.length;n++) {
    a[n] ++;
    if (a[n]>width) {
      a[n]=0;
    }
  }
}


