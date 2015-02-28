
class Collider {
  int cw; //width
  int ch; //height
  int cx; //center x position
  int cy; //center y position
  Collider (int localx, int localy, int localw, int localh) {
    cx = localx;
    cy = localy;
    cw = localw;
    ch = localh;
  }
  void colPos (int localx, int localy) {
    cx = localx;
    cy = localy;
  }
  void colSize (int localw, int localh) {
    cw = localw;
    ch = localh;
  }
}

boolean Collision(Collider Obj1, Collider Obj2) {
  for (int i = Obj1.cx-floor(float(Obj1.cw)/2); i <= Obj1.cx+ceil(float(Obj1.cw)/2); i++) {
    if (i > Obj2.cx-floor(float(Obj2.cw)/2) && i < Obj2.cx+ceil(float(Obj2.cw)/2)) {
      for (int j = Obj1.cy-floor(float(Obj1.ch)/2); j <= Obj1.cy+ceil(float(Obj1.ch)/2); j++) {
        if (j > Obj2.cy-floor(float(Obj2.ch)/2) && j < Obj2.cy+ceil(float(Obj2.ch)/2)) {
          return true;
        }
      }
    }
  }
  return false;
}

class TestBox {
  int cw; //width
  int ch; //height
  int cx; //center x position
  int cy; //center y position
  Collider bc;
  TestBox (int localx, int localy, int localw, int localh) {
    cx = localx;
    cy = localy;
    cw = localw;
    ch = localh;
    bc = new Collider(cx,cy,cw,ch);
  }
  void boxPos (int localx, int localy) {
    cx = localx;
    cy = localy;
    bc.colPos(cx,cy);
  }
  void boxSize (int localw, int localh) {
    cw = localw;
    ch = localh;
    bc.colSize(cw,ch);
  }
  void boxDraw() {
    stroke(0,255);
    fill(255,255);
    rect(cx, cy, cw, ch);
  }
}

