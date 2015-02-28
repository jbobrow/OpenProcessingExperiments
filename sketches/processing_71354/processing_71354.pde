
class bolt {
  float line1X;
  float line1Y;
  float line2X;
  float line2Y;
  float[][][] lineXY = new float[2][2][10];

  bolt(float X1, float Y1, float X2, float Y2) {
    line1X = X1;
    line1Y = Y1;
    line2X = X2;
    line2Y = Y2;

    // little line XY
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        for (int k = 0; k < 10; k++) {
          lineXY[i][j][k] = random(-5, 5);
        }
      }
    }
  }
  void spark() {
    stroke(random(255),random(255),random(255),random(100));
    for (int x = 0; x < 10; x++) {
      line(line1X + lineXY[0][0][x], line1Y + lineXY[0][1][x], line2X + lineXY[1][0][x], line2Y + lineXY[1][1][x]);
    }
  }
}


