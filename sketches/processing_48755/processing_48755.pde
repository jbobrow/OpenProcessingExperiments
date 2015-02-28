

//author:Robertlun,ncku arch
//purpose: homework.season's greeting.
//concept:the light of cold day.
//reference: from the teacher"Sheng-Fen Nik Chien."
 



int _numChildren = 8; 
int _maxLevels = 4;
 
Branch _trunk;
 
/////////main 
void setup() {
  size(750,500);
  background(255);
  noFill();
  smooth();
  newTree();
  frameRate(8);
}
 
void draw() {
  background(25);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
}
 
 void newTree() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
}
 
//////////////////////// object
class Branch {
  float level, index; 
  float x, y;
  float endx, endy;
  float strokeW, alph;  
  float len, lenChange;  
  float rot, rotChange; 
  Branch[] children = new Branch[0];
 
  Branch(float lev, float ind, float ex, float why) {
    level = lev;
    index = ind;
    strokeW = (1/level)*10;
    alph = 255/level;
    len = (1/level)*random(0);
    lenChange = random(2)-1;
    rotChange = random(20)-5;
    updateMe(ex, why);
 
    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] = new Branch(level+1, x, endx, endy);
      }
    }
  }
 
  void updateMe(float ex, float why) {
    x = ex;
    y = why;
     
    rot += rotChange;
     
    len -= lenChange;
    if (len<0 || len>200) { lenChange *= -1; }
     
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));
     
    for(int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }   
  } 
 
  void drawMe() {
    strokeWeight(strokeW);
    stroke(255, alph);
    fill(255,255,255, alph);
    //line(x, y, endx, endy);
    ellipse(endx+300, endy+300, len/2.5, len/2.5);
    ellipse(endx-300, endy-300, len/2.5, len/2.5);
    fill(225,220,10, alph+200);
    ellipse(random(300,445), endy+50, len/9, len/9);
    ellipse(random(300,445), endy-50, len/9, len/9);
   //line(random(100), random(100), len/8, len/8);
    for(int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}


