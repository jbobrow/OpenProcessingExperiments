
class Player1 {
  float pX;
  float pY;
  float easing; 

  Player1(float tempX, float tempY, float tempEasing) {
    pX =tempX;
    pY = tempY;
    easing = tempEasing;
  }
  void display() {
    float targetX=mouseX;
    float targetY= mouseY;
    pX += (targetX - pX) * easing;
    pY += (targetY - pY) * easing;
    fill(#15838E);
    ellipse(pX, pY, 30, 30);
  }
}


