
/*Author: Anita Chen
Purpose: Fractals. Assignment: Season's Greetings
Concept: Christmas
Reference:class exercise by Sheng-Fen Nik Chien*/

int _numChildren = 3;
int _maxLevels = 6;
int _numChildren2 = 4;
int _maxLevels2 = 4;
Branch _trunk;
Branch _trunk2;
Branch2 _trunk3;
//=================main program==============================

void setup() {
  size(500, 500);
  background(0);
  noFill();
  smooth();
  newTree();
  frameRate(8);
}
void newTree() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
  _trunk2 = new Branch(1, 0, width/4, 100);
  _trunk2.drawMe();
  _trunk3 = new Branch2(0, 0, width/5, 0);
  _trunk3.drawMe2();
}

void draw() {
  noStroke();
  fill(0, 100);
  rect(0, 0, width, height);
  _trunk.updateMe(width/3, height/3);
  _trunk.drawMe();
  _trunk2.updateMe(width*0.75, height*0.75);
  _trunk2.drawMe();
  _trunk3.drawMe2();
  _trunk3.updateMe2(width/5, 0);
}

//====================object=================================
class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float why) {
    level = lev;
    index = ind;
    strokeW = (1/(level-1))*5;//level-1=hide first level strokeW
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
    fill(255, alph);
    if (level==2) {
      stroke(random(193), 26, random(8), alph);
    }
    else if (level==3) {
      stroke(random(113), random(149), 0, alph);
    }
    else if (level==4) {
      stroke(random( 255), random( 241), 0, alph);
    }
    else {
      stroke(225, random(255), 30, alph);
    }
    line(x, y, endx, endy);
    ellipse(endx, endy, len/12, len/12);
    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}
class Branch2 {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; // line style
  Branch2[] children = new Branch2[0];

  Branch2(float lev, float ind, float ex, float why) {
    level = lev;
    index = ind;
    strokeW = level*1.5;
    alph = 255/level;
    updateMe2(ex, why);
    if (level < _maxLevels2) {
      children = new Branch2[_numChildren2];
      for (int x=0; x<_numChildren2; x++) {
        children[x] = new Branch2(level+1, x, endx, endy);
      }
    }
  }


  void updateMe2(float ex, float why)
  {
    x = ex;
    y = why;
    endx = x+(level*(random(70)-35));
    endy =y+50+(level*random(70));
  }
  void drawMe2() {
    strokeWeight(strokeW);
    stroke(random(113,255), random(149,241), 0,alph);
    line(x, y, endx, endy);

    for (int i=0;i<children.length;i++) {
      children[i].drawMe2();
    }
  }
}
void keyPressed() {
  saveFrame("Christmas.jpg");
}


