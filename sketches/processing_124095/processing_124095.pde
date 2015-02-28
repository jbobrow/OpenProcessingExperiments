
// Exercise Program for the lecture on "Fractals"
// a basic program to make branches of tree
// for Design Programming Design, Fall 2013 NCKU
// schien@mail.ncku.edu.tw

int _numChildren = 3;
int _maxLevels = 5;
Branch _trunk;
Branch tron;
void setup() {
  size(700, 700);
  background(255);
  noFill();
  newTree();
  frameRate(3);
}
void draw() {
//background(255);
_trunk.updateMe(50, random(height), 1);
_trunk.drawMe();
tron.updateMe(width-50, random(height), -1);
tron.drawMe();
fill(255);
textSize(15);
text("fantastic",width/2-30,height/2);
}

void newTree() {
  _trunk = new Branch(1, 0, 50, random(height),1);
  _trunk.drawMe();
  tron = new Branch(1, 0, width-50, random(height),-1);
  tron.drawMe();
  
}


// the Branch class
class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float pt ;
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey , float pt) {
    level = lev;
    index = ind;
    updateMe(ex, ey ,pt);

    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] = new Branch(level+1, x, endx, endy , pt);
      }
    }
  }

  void updateMe(float nx, float ny , float t) {
    x = nx;
    y = ny;
    endx = x+t*(10+(level*random(50)));
    endy = y+(level*(random(100)-50));
    for(int i=0; i<children.length; i++)
{
children[i].updateMe(endx, endy,t);
}
  }

  void drawMe() {
    stroke(random(255),random(255),random(255),10);
    strokeWeight(_maxLevels-level+1);
    line(x, y, endx, endy);
    //ellipse(x, y, 5, 5);
    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}



