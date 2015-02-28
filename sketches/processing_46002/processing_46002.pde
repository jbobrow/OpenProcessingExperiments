
class Brazo {
  Cabeza ca;
  //variables 
  float px=0, py=0, lony=40;
  int diam=7;
  Brazo() {
    ca= new Cabeza();
  }
  void dibuja() {
    pushMatrix();
    translate(0, py-2*lony+(-lony*1.5/2));
    ca.dibuja();
    stroke(cr,cg,cb, 210);
    strokeWeight(2);
    line(px, py, px, py+2*lony);
    pushMatrix();
    translate(0, 2*lony);
    noStroke();
    fill(cr,cg,cb);
    ellipse(px, py, lony/10, lony/10);
    popMatrix();
    popMatrix();
  }
}


