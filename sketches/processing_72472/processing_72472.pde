
class Eyebrow {
  float x1, y1, x2, y2, x3, y3;
  color ebc;
  float ebd;

  Eyebrow(float x1Pos, float y1Pos, float x2Pos, float y2Pos, float x3Pos, float y3Pos, float ebDict, color ebColor)
  {
    x1 = x1Pos;
    y1 = y1Pos;
    x2 = x2Pos;
    y2 = y2Pos;
    x3 = x3Pos;
    y3 = y3Pos;
    ebd = ebDict;
    ebc = ebColor;
  }
  void display() {
    stroke(1);
    fill(ebc);
    smooth();
    triangle(x1, y1, x2, y2, x3, y3);
    pushMatrix();
     translate(300, 0);
    triangle(-x1, y1, -x2, y2, -x3, y3);
    popMatrix();
  }
  void rotateeb() {
    stroke(1);
    fill(ebc);
    smooth();
    
    pushMatrix();
     translate(x1, y1);
    rotate(PI/15.0);
    triangle(x1, y1, x2, y2, x3, y3);
    popMatrix();

    pushMatrix();
    translate(x1 + 100, y1);
    rotate(PI/15.0);
    triangle(x1, y1, x2, y2, x3, y3);
//    triangle(0,0, ebd-x2-x1+3*x3, y2, x3+ebd, y3);
    popMatrix();
  }

}

