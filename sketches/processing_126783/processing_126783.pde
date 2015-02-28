
//Trees and not trees
//Reference: Fractals by Professor Sheng-Fen Nik Chien
//Chiming Lu

int _numChildren = 4;
int _maxLevels = 4;
Branch _trunk;
Branch Q;

void setup() {
  size(500, 500);
  background(0);
  noFill();
  stroke(255);
  newTree();
  frameRate(7);
}

void draw() {
  background(0);
  _trunk.updateMe(width/2, height-150);
  _trunk.drawMe();
  
  Q.updateMe(width/2,0 );
  Q.drawMe();
}

void newTree() {
  _trunk = new Branch(1, 20, width/2, height);
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
    alph = 255/level;
    len = (1/level)*random(200);
    lenChange = random(index)-5;
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
    //endx = x+(level*(random(100)-50));
    //endy = y-50-(level*random(50));

    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    strokeWeight(strokeW);
    stroke(255, alph);
    fill(255, alph);
    //strokeWeight(_maxLevels-level+1);
    line(x, y, endx, endy);
    //ellipse(x, y, 5, 5);
    ellipse(endx, endy, len/12, len/12);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}



