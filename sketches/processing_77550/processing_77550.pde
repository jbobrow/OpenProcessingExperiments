
//Box
BreakPlatforms[] platforms = new BreakPlatforms[0];
int breakboxsize = 32;

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
  if (Obj1.ch*Obj1.cw > Obj2.ch*Obj2.cw) {
    Collider templider = Obj1;
    Obj1 = Obj2;
    Obj2 = templider;
  }
  if (xoverlap(Obj1,Obj2)) {
    if (yoverlap(Obj1,Obj2)) {
      return true;
    }
  }
  return false;
}

boolean xoverlap(Collider Obj1, Collider Obj2) {
  for (int i = Obj1.cx-floor(float(Obj1.cw)/2); i <= Obj1.cx+floor(float(Obj1.cw)/2); i++) {
    if (i > Obj2.cx-floor(float(Obj2.cw)/2) && i < Obj2.cx+floor(float(Obj2.cw)/2)) {
      return true;
    }
  }
  return false;
}

boolean yoverlap(Collider Obj1, Collider Obj2) {
  for (int j = Obj1.cy-floor(float(Obj1.ch)/2); j <= Obj1.cy+floor(float(Obj1.ch)/2); j++) {
    if (j > Obj2.cy-floor(float(Obj2.ch)/2) && j < Obj2.cy+floor(float(Obj2.ch)/2)) {
      return true;
    }
  }
  return false;
}

class BreakPlatforms {
  int cw; //width
  int ch; //height
  int cx; //center x position
  int cy; //center y position
  BoxCollumns[] bpBox = new BoxCollumns[0];
  BreakPlatforms (int localx, int localy, int localw, int localh) {
    cx = localx;
    cy = localy;
    cw = localw;
    ch = localh;
    for (int i=0; i<cw; i+=breakboxsize) {
      BoxCollumns[] tempbp = bpBox;
      bpBox = new BoxCollumns[tempbp.length+1];
      for (int k=0; k<tempbp.length; k++) {
        bpBox[k] = tempbp[k];
      }
      bpBox[bpBox.length-1] = new BoxCollumns(cx-floor(float(cw)/2)+i,cy,ch);
      /*for (int j=0; j<floor(float(ch)/2)-cy+2*height; j+=breakboxsize) {
        BoxPoints[] tempbp = bpBox;
        bpBox = new BoxPoints[tempbp.length+1];
        for (int k=0; k<tempbp.length; k++) {
          bpBox[k] = tempbp[k];
        }
        bpBox[bpBox.length-1] = new BoxPoints(cx-floor(float(cw)/2)+i,cy,ch);
      }*/
    }
  }
  void platformDraw() {
    for (int i=0; i<bpBox.length; i++) {
      bpBox[i].collumnDraw();
    }
  }
  boolean platformCollide(Collider Obj1) {
    if (inPlatformX(Obj1)) {
      if (inPlatformY(Obj1)) {
        for (int i=0; i<bpBox.length; i++) {
          if (bpBox[i].collumnCollide(Obj1)) {
              return true;
          }
        }
        return false;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  boolean inPlatformX (Collider Obj1) {
    for (int i = Obj1.cx-floor(float(Obj1.cw)/2); i <= Obj1.cx+floor(float(Obj1.cw)/2); i++) {
      if (i > cx-floor(float(cw+breakboxsize)/2) && i < cx+floor(float(cw+breakboxsize)/2)) {
        return true;
      }
    }
    return false;
  }
  boolean inPlatformY (Collider Obj1) {
    for (int i = Obj1.cy-floor(float(Obj1.ch)/2); i <= Obj1.cy+floor(float(Obj1.ch)/2); i++) {
      if (i > cy-floor(float(ch+breakboxsize)/2) && i < 2*height) {
        return true;
      }
    }
    return false;
  }
  void platformBreak(Collider Obj1) {
    if (inPlatformX(Obj1)) {
      if (inPlatformY(Obj1)) {
        for (int i=0; i<bpBox.length; i++) {
          bpBox[i].breakCheck(Obj1);
        }
      }
    }
  }
}

class BoxCollumns {
  int cx;
  int cy;
  int ch;
  int cw = 0;
  BoxPoints[] bpBox = new BoxPoints[0];
  BoxCollumns (int newx, int newy, int newh) {
    cx = newx;
    cy = newy;
    ch = newh;
    for (int j=0; j<floor(float(ch)/2)-cy+2*height; j+=breakboxsize) {
      BoxPoints[] tempbp = bpBox;
      bpBox = new BoxPoints[tempbp.length+1];
      for (int k=0; k<tempbp.length; k++) {
        bpBox[k] = tempbp[k];
      }
      bpBox[bpBox.length-1] = new BoxPoints(cx,cy-floor(float(ch)/2)+j);
    }
  }
  void collumnDraw() {
    for (int i=0; i<bpBox.length; i++) {
      bpBox[i].breakDraw();
    }
  }
  boolean collumnCollide(Collider Obj1) {
    if (inCollumnX(Obj1)) {
      if (inCollumnY(Obj1)) {
        for (int i=0; i<bpBox.length; i++) {
          if (bpBox[i].pbreak == 0) {
            if (Collision(bpBox[i].inbox,Obj1)) {
              return true;
            }
          }
        }
        return false;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  boolean inCollumnX (Collider Obj1) {
    for (int i = Obj1.cx-floor(float(Obj1.cw)/2); i <= Obj1.cx+floor(float(Obj1.cw)/2); i++) {
      if (i > cx-floor(float(cw+breakboxsize)/2) && i < cx+floor(float(cw+breakboxsize)/2)) {
        return true;
      }
    }
    return false;
  }
  boolean inCollumnY (Collider Obj1) {
    for (int i = Obj1.cy-floor(float(Obj1.ch)/2); i <= Obj1.cy+floor(float(Obj1.ch)/2); i++) {
      if (i > cy-floor(float(ch+breakboxsize)/2) && i < 2*height) {
        return true;
      }
    }
    return false;
  }
  void breakCheck(Collider Obj1) {
    if (inCollumnX(Obj1)) {
      if (inCollumnY(Obj1)) {
        for (int i=0; i<bpBox.length; i++) {
          if (bpBox[i].pbreak == 0) {
            if (Collision(bpBox[i].inbox,Obj1)) {
              bpBox[i].breakpoint();
            }
          }
        }
      }
    }
  }
}

class BoxPoints {
  int pbreak = 0;
  Collider inbox;
  BoxPoints(int localx, int localy) {
    inbox = new Collider(localx,localy,breakboxsize,breakboxsize);
  }
  void breakpoint() {
    pbreak ++;
  }
  void breakDraw() {
    //Draw point falling later?
    if (pbreak == 0 && OnScreen(inbox.cx,inbox.cy)) {
      stroke(0,255);
      fill(255,0,0,255);
      rect(inbox.cx, inbox.cy, inbox.cw, inbox.ch);
    }
    else {
      
    }
  }
}

boolean OnScreen(int localx, int localy) {
  if (localx > myCreature.creX-(width/2+breakboxsize) && localx < myCreature.creX+(width/2+breakboxsize)) {
    if (myCreature.creY < 1.5*height && localy > myCreature.creY-(height/2+breakboxsize) && localy < myCreature.creY+(height/2+breakboxsize)) {
      return true;
    }
    else if (localy > height-breakboxsize && localy < 2*height+breakboxsize){
      return true;
    }
    else {
      return false;
    }
  }
  else {
    return false;
  }
}

void makePlatforms() {
  MyRandom();
  platforms = new BreakPlatforms[floor((random(50))+25)/4];
  for (int i=0; i<platforms.length; i++) {
    MyRandom();
    int newhigh = 2*breakboxsize*floor((200+levelHmod()*random(height))/float(2*breakboxsize));
    if (newhigh > 4*height) {
      newhigh = 2*breakboxsize*floor(float(4*height)/float(2*breakboxsize));
    }
    int newwide = breakboxsize*floor((400+random(width*10))/float(breakboxsize));
    if (i==0) {
      platforms[i] = new BreakPlatforms(width/2,height,newwide,2*breakboxsize*floor(200/float(2*breakboxsize)));
    }
    else {
      platforms[i] = new BreakPlatforms(platforms[i-1].cx+platforms[i-1].cw/2+floor(newwide/2)+levelfall(),height,newwide,newhigh);
    }
  }
}

float levelHmod() {
  //This allows super high platforms in the stage, based on difficulty (level).
  for (int i = 0; i < yourlevel-1; i++) {
    float needbite = random(1);
    if (needbite < 1/float(final_level)) {
      return 10;
    }
  }
  return 1;
}

int levelfall() {
  //This allows gaps in the stage, based on difficulty (level).
  for (int i = 0; i < yourlevel-1; i++) {
    float fallthrough = random(1);
    if (fallthrough < 1/float(final_level)) {
      return floor(width/2+random(yourlevel*maxspeed));
    }
  }
  return 0;
}

void drawPlatforms() {
  for (int i=0; i<platforms.length; i++) {
    platforms[i].platformDraw();
  }
}

boolean HitPlatform(Collider Obj1) {
  for (int i=0; i<platforms.length; i++) {
    if (platforms[i].platformCollide(Obj1)) {
      return true;
    }
  }
  return false;
}

Collider WayAbovePlatform(Collider Obj1) {
  Collider cupdate = Obj1;
  for (int i=0; i < floor(float(Obj1.ch)/breakboxsize/2); i++) {
    cupdate.colPos(Obj1.cx,cupdate.cy-breakboxsize);
    if (!HitPlatform(cupdate)) {
      return cupdate;
    }
  }
  return Obj1;
}

void BreakPlatforms(Collider Obj1) {
  for (int i=0; i<platforms.length; i++) {
    platforms[i].platformBreak(Obj1);
  }
}

