
int[] xPoints = new int[40];
int[] yPoints = new int[40];
int[] xPoints2 = new int[40];
int[] centerXpoints = new int[20];
int[] centerXpoints2 = new int[20];
int[] centerYpoints = new int[20];
int[] centerYpoints2 = new int[20];

void setup() {
  size(600, 600);
  background(0);
  smooth();
  for (int i = 0; i < xPoints.length; i++) {
    xPoints[i] = width - i * width / 40;
  }
  for (int i = 0; i < yPoints.length; i++) {
    yPoints[i] = i * height / 40;
  }
  for (int i = 0; i < xPoints2.length; i++) {
    xPoints2[i] = i * width / 40;
  }
  for (int i = 0; i <centerXpoints.length; i++) {
    centerXpoints[i] = i * width / 40;
  }
  for (int i = 0; i <centerXpoints2.length; i++) {
    centerXpoints2[i] = width - i * width / 40;
  }
  for (int i = 0; i <centerYpoints.length; i++) {
    centerYpoints[i] = height / 2 - i * height / 40;
  }
  for (int i = 0; i <centerXpoints2.length; i++) {
    centerYpoints2[i] = height / 2 + i * height / 40;
  }
}


void draw() {
  strokeWeight(.01);
  for (int i = 1; i < xPoints.length; i++) {
    stroke(mouseY, 0, mouseX);
    line(xPoints[i], 0, 0, yPoints[i]);
    line(xPoints2[i], 0, height, yPoints[i]);
    stroke(0 , mouseX, mouseY);
    line(xPoints[i], height, width, yPoints[i]);
    line(xPoints2[i], width, 0, yPoints[i]);
  }
  stroke(mouseY, 0, mouseX);
  for (int i = 1; i < centerXpoints.length; i++) {
    line(centerXpoints[i], height / 2, width / 2, centerYpoints2[i]);
    line(centerXpoints2[i], height / 2, width / 2, centerYpoints[i]);
  }
  stroke(0 , mouseX, mouseY);
  for (int i = 1; i < centerXpoints.length; i++) {
    line(centerXpoints[i], height / 2, width / 2, centerYpoints[i]);
    line(centerXpoints2[i], height / 2, width / 2, centerYpoints2[i]);
  }
}



