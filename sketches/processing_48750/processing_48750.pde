
//Author: Herbert Hsu
//Purpose: Assignment to illustrate the idea of seasons greeting. The color of Chinese New Year is applied
//Reference: In class exercise and examples from Generative Art(Pearson2011)


//----------main
int _numChildren = 6;
int _maxLevels = 4;
Branch _trunk;
Branch _trunk2;
void setup() {
  size(750, 500);
  background(255);
  noFill();
  smooth();
  frameRate(32);
  newTree();
}
void newTree() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk2= new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
  _trunk2.drawMe();
}
void draw() {
  background(210,31,63);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
  _trunk2.updateMe(width/3, height/3);
  _trunk2.drawMe();
}

//----------obj
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
    strokeW = (1/level)*10;
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
   // strokeWeight(strokeW);
   noStroke();
   
    fill(255,255,0);
    ellipse(endx, endy, len/12, len/12);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}
void keyPressed(){
saveFrame("newyear.jpg");

}


