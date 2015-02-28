
class Ball {
  
  float x;
  float y;
  float dia;
  
  Ball(float x1, float y1, float d1) {
    x = x1;
    y = y1;
    dia = d1;
  }
  
  void drawBall() {
    
    x = mouseX;
    y = mouseY;
    
    noStroke();
    pushMatrix();
    noCursor();
    translate(x, y);
    ellipse(0, 0, dia, dia);
    popMatrix();
  }
}


