
int _numChildren = 3;
int _maxLevels = 4;
Branch _trunk;
void setup() {
  size(750, 1000);
  background(255);
  noFill();
  smooth();
  newTree();
}
void draw(){
background(255);
_trunk.updateMe(width/2, height/4);
_trunk.drawMe();
}
void newTree() {
  _trunk = new Branch(1, 0, width/2, height-50);
  _trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation
  Branch[] children = new Branch[0];
  Branch(float lev, float ind, float
    ex, float why) {
    level = lev;
    index = ind;
    strokeW = (1/level)*100;
    alph = 255/level;
    len = (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    updateMe(ex, why);
    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] =
          new Branch(level+1, x, endx, endy);
      }
    }
  }
  void updateMe(float ex, float why)
  {
    x = ex;
    y = why;
    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>200) { 
      lenChange *= -1;
    }
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));
    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }
  void drawMe() {
    strokeWeight(strokeW/(alph-50));
    stroke(0, alph);
    fill(255, alph);
    line(x, y, endx, endy);
    ellipse(endx, endy, len/12, len/12);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}


