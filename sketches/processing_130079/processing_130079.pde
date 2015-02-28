
//Kang-Yu Om Liu 
//happy holiday
//give you s
//20140126

int _numChildren = 9;
int _maxLevels = 3;
Branch _trunk;

void setup() {
  size(750, 300);
  background(119, 145, 138);
  noFill();
  newTree();
  frameRate(15);
}

void draw() {
  background(119, 145, 138);
  fill(255, 12);
  textSize(160);
  text("HAPPY", 140, 140);
    text("HOLIDAY",25, 280);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
}

void newTree() {
  _trunk = new Branch(1, 0, width/2, 250);
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
    strokeW = (1/level)/150;
    alph = 255/level; 
    len = (1/level)*random(200); 
    lenChange = random(10)-5; 
    rotChange = random(20)-5;

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
    stroke(0, alph);     
    line(x, y, endx, endy);
    fill(255, alph);
    ellipse(endx, endy, len/12, len/12);
    arc(x,y,30,30, 1, 2.20);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}



