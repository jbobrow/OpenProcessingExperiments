
//Class Exercise
//Creating a tree


int _numChildren = 3;
int _maxLevels = 5;
Branch _trunk;


void setup() {
  size(750, 500);
  background(0);
  noFill();
  smooth();
  newTree();
}


void newTree() {
  _trunk = new Branch(0, 0, width/2, 0);
  _trunk.drawMe();
}


//CREATING THE OBJECT

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float
    ex, float why) {
    level = lev;
    index = ind;
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
    endx = x+(level*(random(100)-50));
    endy =y+50+(level*random(50));
  }
  void drawMe() {
    stroke(106,79,4);
    strokeWeight(_maxLevels-level+1);
    fill (26,17,0);
    line(x, y, endx, endy);
    ellipse(x, y,2,2);
    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}


