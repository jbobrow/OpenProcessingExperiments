
void largeEllipse(int xPos, int yPos, int xWidth, int xHeight) {
  int rotDegrees = 0;
  int degreeIncrease = 60;
  fill(0, 0);

  while (rotDegrees < 360) {
    stroke(random(100, 255), random(100, 255), random(100, 255), random(100, 255));
    strokeWeight(random(2, 6));
    rotate(radians(rotDegrees));
    ellipse(xPos, yPos, xWidth, xHeight);
    rotDegrees = rotDegrees + degreeIncrease;
  }
}


