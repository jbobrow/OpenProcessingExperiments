
// Clark Li 
// Tree and Fireflies
//This practice is to use the fractals logic, with class order. Try to create the image tree and fireflies.

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; 
  float len, lenChange;
  float rot, rotChange;
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    strokeW = (1/level)*5;
    alph =random(150)/level*10;
    len = (5/level)*random(10);
    lenChange = random(6);
    rotChange = random(3);
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
    rot += rotChange*2/3;
    len -= lenChange*2/3;
    if (len<0 || len>150) {
      lenChange *= -1;
    }
    float radian = radians(rot/2);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));
    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    strokeWeight(strokeW);
    stroke(0, 160, 0, 80);
    fill(255, 240, 0, 80);
    line(x, y, endx, endy);
    ellipse(endx, endy*2.5, len/15, len/15);
    noStroke();
    fill(240, 280, 200, alph*20);
    ellipse(endx, endy, len/50, len/50);
    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe();
    }
  }
}
//drawing
int _numChildren = 6;
int _maxLevels = 5;
Branch _trunk;

void setup() {
  size(750, 500);
  background(200);
  noFill();
  newTree();
}
void newTree() {
  _trunk = new Branch(1, 2, width*80, 50);
  _trunk.drawMe();
}

void draw() {
  background(0);
  _trunk.updateMe(width/2, height*2/5);//startting location
  _trunk.drawMe();
}




