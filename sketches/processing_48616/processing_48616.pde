
int _numChildren = 4;
int _maxLevels = 7;
Branch _trunk;
//=======================================
void setup() {
  size(900, 600);
  background(0);
  frameRate(50);
  stroke(255);
  noFill();
  smooth();
  newTree();
}

void newTree() {
  _trunk = new Branch(1, 0, width/2, 100);
  _trunk.drawMe();
}
void draw() {
background(0);
_trunk.updateMe(width/2, 590);
_trunk.drawMe();
}

//=======================================
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
    len = (1/level)*random(100);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    updateMe(ex, why);
    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] =new Branch(level+1, x, endx, endy);
      }
    }
  }
  //========================================
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
  //==========================================
  void drawMe() {
   strokeWeight(5);
stroke(255, alph);
fill(120,20,30, alph);
    line(x, y, endx, endy);
    ellipse(endx, endy, len/12, len/12);
    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}


