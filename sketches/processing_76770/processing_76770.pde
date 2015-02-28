
//Add push up if only 1/5 below.
//Add run through check if bite touches beginning & end of brick that creature is touching.


//This makes a box around the object to test for collision detection.
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
  //True = hit; false = not hit
  if (xoverlap(Obj1,Obj2)) {
    if (yoverlap(Obj1,Obj2)) {
      return true;
    }
  }
  return false;
}

boolean xoverlap(Collider Obj1, Collider Obj2) {
  for (int i = Obj1.cx-floor(float(Obj1.cw)/2); i <= Obj1.cx+ceil(float(Obj1.cw)/2); i++) {
    if (i > Obj2.cx-floor(float(Obj2.cw)/2) && i < Obj2.cx+ceil(float(Obj2.cw)/2)) {
      return true;
    }
  }
  return false;
}

boolean yoverlap(Collider Obj1, Collider Obj2) {
  for (int j = Obj1.cy-floor(float(Obj1.ch)/2); j <= Obj1.cy+ceil(float(Obj1.ch)/2); j++) {
    if (j > Obj2.cy-floor(float(Obj2.ch)/2) && j < Obj2.cy+ceil(float(Obj2.ch)/2)) {
      return true;
    }
  }
  return false;
}

boolean HitPlatform(Collider Obj1, TestBox[] Platforms) {
  for (int i=0; i<Platforms.length; i++) {
    if (Collision(Obj1,Platforms[i].bc)) {
      return true;
    }
  }
  return false;
}

boolean BelowPlatform(Collider Obj1, TestBox[] Platforms) {
  boolean checker = false;
  for (int i=0; i<Platforms.length; i++) {
    if (xoverlap(Obj1,Platforms[i].bc)) {
      if (Obj1.cy-Obj1.ch/2 > Platforms[i].cy-Platforms[i].ch/2) {
        checker = true;
      }
    }
  }
  return checker;
}

boolean WayAbovePlatform(Collider Obj1, TestBox[] Platforms) {
  boolean checker = false;
  for (int i=0; i<Platforms.length; i++) {
    if (Collision(Obj1,Platforms[i].bc)) {
      if (Obj1.cy+Obj1.ch/4 < Platforms[i].cy-Platforms[i].ch/2) {
        checker = true;
      }
      else {
        checker = false;
      }
    }
  }
  return checker;
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
    fill(255,0,0,255);
    rect(cx, cy, cw, ch);
  }
  void biteDraw() {
    noStroke();
    fill(255,255);
    rect(cx, cy, cw, ch);
  }
}

