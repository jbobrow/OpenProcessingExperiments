
//Class Exercise
//Creating a tree


int _numChildren = 6;
int _maxLevels = 4;
Branch _trunk;


void setup() {
  size(750, 500);
  background(255);
  noFill();
  smooth();
  newTree();
}

void draw() {
  background(255);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
}

void newTree() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
}


//CREATING THE OBJECT

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
    strokeW = (1/level)*5;
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
    
    strokeWeight(strokeW);
    stroke(0,3,8,150);
    //stroke(0, alph);
    //fill(255, alph);
    line(x, y, endx, endy);
    
    noStroke();
    fill (2,19,54,190);
    ellipse(endx, endy, len/6, len/6);
    
    fill (77,3,1,90);
    ellipse(endx, endy, len/3, len/3);
    
    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}


