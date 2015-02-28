
public class Feather {

  float leng = 0;
  color fillC = 0;
  color strokeC = 0;
  
  Feather(float _leng) {
    leng = _leng;
  }

  void draw() {
    featherShape();
  }
  void featherShape() {
    stroke(strokeC);
    fill(fillC);
    strokeWeight(2);
    pushMatrix();
    translate(-leng * 0.1,-leng * 0.02);
    beginShape();
    vertex(leng * 0.1,leng * 0.02);
    curveVertex(leng * 0.1,leng * 0.02);
    curveVertex(leng * 0.21, leng * -0.06);
    curveVertex(leng * 0.32, leng * -0.1);
    curveVertex(leng * 0.48, leng * -0.11);
    curveVertex(leng * 0.65, leng * -0.1);
    curveVertex(leng * 0.81, leng * -0.09);
    curveVertex(leng * 0.87, leng * -0.08);
    curveVertex(leng * 0.94, leng * -0.06);
    curveVertex(leng * 0.98, leng * -0.03);
    curveVertex(leng, 0);  
    curveVertex(leng * 0.98, leng * 0.016);
    curveVertex(leng * 0.94, leng * 0.02);
    curveVertex(leng * 0.81, leng * 0.03);
    curveVertex(leng * 0.65, leng * 0.04);
    curveVertex(leng * 0.48, leng * 0.042);  
    curveVertex(leng * 0.42, leng * 0.048);
    curveVertex(leng * 0.32, leng * 0.05);
    curveVertex(leng * 0.16, leng * 0.04);
    curveVertex(leng * 0.1,leng * 0.02);
    vertex(leng * 0.1,leng * 0.02);
    endShape();
    popMatrix();
    stroke(0);
    fill(0);
  }
}


