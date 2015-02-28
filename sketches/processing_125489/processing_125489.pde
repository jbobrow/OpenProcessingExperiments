
// Exercise [ XI ] : Trees and not trees
// This is a Whomping Willow in Harry Potter...
// lin wenyu  (ken3101462@gmail.com)

int _numChildren = 5;
int _maxLevels = 5;
Branch _trunk;

void setup() {
  size(800, 600);
  background(0);
  frameRate(10);
  noFill();
  newTree();
}

void draw() {
  //background(0);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();

  fill(0, 100);
  rect(0, 0, width, height);
}

void mouseReleased() {
  newTree();
}

void newTree() {
  _trunk = new Branch(1, 0, width/2, height);
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

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    strokeW = (1/level)*10;
    alph = 255/level;
    len = (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(5)-5;
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
    len += lenChange;
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
    //stroke(random(255),random(255),random(255),alph);
    stroke(100, random(150, 200), 140, alph);
    //fill(random(255),random(255),random(255),alph);
    fill(100, random(150, 200), 140, alph);
    line(x, y, endx, endy);
    ellipse(endx, endy, len/20, random(len/20));
    ellipse(random(endx), random(endy), len/12, random(len/12));
    for (int i=0;i<children.length;i++) { 
      children[i].drawMe();
    }
  }
}



