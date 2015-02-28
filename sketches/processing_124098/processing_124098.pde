
// reference to Design Programming Design, Fall 2013 NCKU
// and schien@mail.ncku.edu.tw
// praticeS,by chen, wu-zhi
// class practice


int _numChildren = 30;
int _maxLevels = 3;
Branch _trunk;

void setup() {
  size(900, 600);
  background(0);
  noFill();
  frameRate(15);
  newTree();
}

void draw() {
  background(0);
  _trunk.updateMe(mouseX, mouseY);
  _trunk.drawMe();
}

void newTree() {
  _trunk = new Branch(1, 0, 100, 0);
  _trunk.drawMe();
}


// the Branch class
class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; // line style 
  float len, lenChange; // length 
  float rot, rotChange; // rotation
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    strokeW = (1/level)*2;
    alph = 255/level; 
    len = (1/level)*random(200); 
    lenChange = random(10)-5; 
    rotChange = random(10)-5;

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
    stroke(255, alph); 
    fill(random(255), random(255), random(255), alph);
    line(x, y, endx, endy);
    ellipse(random(endx), random(endy), len/20, len/20);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}



