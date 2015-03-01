
class Bubble {
  float x, y;
  color bColor;
  float bRadius;

  Bubble(float tx, float ty, color tColor, float tRadius) {
    x = tx;
    y = ty;
    bColor = tColor;
    bRadius = tRadius;
  }

  void update() {
    noStroke();
    fill(bColor);
    ellipse(x, y, bRadius, bRadius);
    fill(_bgColor);
    ellipse(x+bRadius*0.08, y+bRadius*0.08, bRadius*0.6, bRadius*0.6);
  }
}


