
//emergence practice, moving particles
//Stella Wang, 2013/12/11

int _numChildren = 5;
int _maxLevels = 5;
Branch _trunk;

void setup() {
  size(750, 500);
  background(255);
  noFill();
  newTree();
}

void newTree() {
  _trunk = new Branch(1, 0, width/2, 450);
  _trunk.drawMe();
}

void draw() {
  background(255);
  _trunk.updateMe(width/2, 450);
  _trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;

  //Adding new properties
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation

  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    //Initialize them in the constructor
    strokeW = (1/level)*100;
    alph = 255/level;
    len = (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    //
    updateMe(ex, ey);

    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int i=0; i<_numChildren; i++) {
        children[i] = new Branch(level+1, 
        x, endx, endy);
      }
    }
  }

  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    //    endx = x+70+(level*(random(100)-50));
    //    endy = y-50-(level*random(50));

    ////Recalculate end points
    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>200) {
      lenChange *= -1;
    }
    float radian = radians(rot);
    endx = x+10+(len*cos(radian));
    endy = y+(len*sin(radian));
    //
    for (int i=0; i<children.length; i++)
    {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    stroke(random(50), random(50, 150), random(100, 200), random(100));

    strokeWeight(_maxLevels-level+1);
    line(x, y, endx, endy);
    ellipse(x, y, 5, 5);

    //Draw big circles and thick lines
    /*  strokeWeight(strokeW);
     stroke(0, alph);
     fill(255, alph);
     line(x, y, endx, endy);
     ellipse(endx, endy, len/12, len/12);
     */

    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe();
    }
  }
}

