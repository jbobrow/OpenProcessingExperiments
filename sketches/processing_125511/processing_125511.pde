
//Fractals
//animate branches
//Test 020 [Date:20131211] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛 Juihsun,Lin
// Code from Design Programming Design, Fall 2013 NCKU
// schien@mail.ncku.edu.tw

int _numChildren = 5;
int _maxLevels = 5;
Branch _trunk;

void setup() {
  size(500, 500);
  background(255);
  noFill();
  newTree();
}

void draw() {
  background(255);
  _trunk.updateMe(width/2, height/4);
  _trunk.drawMe();
}

void newTree() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
}


// the Branch class
class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  //=====================================  
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation
  //=====================================
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    //======================================
    strokeW = (1/level)*5;
    alph = 255/level;
    len = (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    //======================================
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

    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    strokeWeight(strokeW);
    stroke(random(255), alph);
    fill(random(255), alph);
    line(endx, endy, endx, endy);
    ellipse(endx, endy, len/12, len/12);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}



