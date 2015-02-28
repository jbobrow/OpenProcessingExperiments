
//yi-ting sie
//課程練習：fractals
//透過碎形的衍生方式，讓點與點相互連接，並產生分支。
//Sheng-Fen Nik Chien (2011), Complexity - fractals, 數位學習平台─數位資訊創作 http://moodle.ncku.edu.tw/course/view.php?id=43022。  


class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float why) {
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
    endx = x+(level*(random(180)-80));
    endy =y+50+(level*random(50));
  }

  void drawMe() {
    stroke(100,200,100);
    strokeWeight(_maxLevels-level+2);
    line(x, y, endx, endy);
    ellipse(x, y, 10, 10);
    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}
int _numChildren = 5;
int _maxLevels = 3;
Branch _trunk;
void setup() {
  size(550, 500);
  background(255);
  fill(250,100,50);
  smooth();
  newTree();
}
void newTree() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
}

void keyPressed(){
saveFrame("fractals001-####.png");
}


