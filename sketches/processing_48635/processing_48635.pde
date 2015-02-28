
//Class Exercise:Fractals
//Anita Chen

//=================main program==============================
int _numChildren = 3;
int _maxLevels = 6;
Branch _trunk;
Branch _trunk2;
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
}

void draw() {
  noStroke();
  fill(0, 100);
  rect(0, 0, width, height);
  _trunk.updateMe(width/3, height/3);
  _trunk.drawMe();
  _trunk2.updateMe(width*0.75, height*0.75);
  _trunk2.drawMe();
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
    strokeW = (1/(level-1))*6;//level-1=hide first level strokeW
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
    fill(200, alph);
    if (level==2) {
      stroke(255, 55, random(255), alph);
    }
    else if (level==3) {
      stroke(random(5), random(60, 140), random(120, 255), alph);
    }
    else if (level==4) {
      stroke(random(100, 255), alph);
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
void keyPressed() {
  saveFrame("tree.jpg");
}


