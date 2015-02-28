
int _numChildren = 10;
int _maxLevels = 5;
Branch _trunk;
Branch Q;

void setup() {
  size(600, 1000);
  background(0,0,50);
  noFill();
  stroke(0,250.50);
  newTree();
  frameRate(100);
}
 
void draw() {
  background(0,0,35);
  _trunk.updateMe(width/2, height-100);
  _trunk.drawMe();
   
  Q.updateMe(width/2,0 );
  Q.drawMe();
}
 
void newTree() {
  _trunk = new Branch(1, 20, width+50, height);
  _trunk.drawMe();
  Q = new Branch(1,30,width/2,0);
  Q.drawMe();
}
 
 
// the Branch class
class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotationt
  Branch[] children = new Branch[0];
 
  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    strokeW = (1/level)*10;
    alph = 200/level;
    len = (1/level)*random(200);
    lenChange = random(index);
    rotChange = random(50);
    updateMe(ex, ey);
 
    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] = new Branch(level+1, x, endx, endy);
      }
    }
  }
 
  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>200) {
      lenChange *= -1;
    }
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));
    //endx = x+(level*(random(50)));
    //endy = y-(level*random(50));
 
    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }
 
  void drawMe() {
    strokeWeight(strokeW);
    stroke(250, alph);
    fill(255, alph);
    //strokeWeight(_maxLevels-level+1);
    line(x, y, endx, endy);
    //ellipse(x, y, 5, random);
    ellipse(endx, endy, len/12, len/12);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}

