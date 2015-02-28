
void semicircle(float xLeft, float yLeft, float xRight, float yRight) {
  pushMatrix();
  float diameter = dist(xLeft, yLeft, xRight, yRight);
  float angle = atan2(yRight - yLeft, xRight - xLeft);
  arc((xLeft + xRight) / 2, (yLeft + yRight) / 2, diameter, diameter, angle, angle + PI);
  popMatrix();
}

