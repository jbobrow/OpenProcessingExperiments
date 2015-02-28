
//Lin Lien Ya , Institute of Industrial design.
//season greeting

int _numChildren =5;
int _maxLevels =5;

Branch _trunk;
void setup() {
  size(750, 500);
  background(0);
  noFill();
 
  frameRate(4);
}
void draw(){
  float _size=random(0,30);
  noStroke();
  fill(0,_size+120);
  ellipse(random(width),random(width), _size, _size);
   newTree();
   fill(0);
textSize(15);
text("- Merry Christmas -",width/2-30,height/2-100);

}

void newTree() {
  for (int i=0;i<5;i++) {   
    //  _trunk = new Branch(1, 0,random(0,width), random(0,height)+height/2);
    _trunk = new Branch(1, 0, random(30)+width*2/3, height+random(30)+height*1/3);
    _trunk.drawMe();
  }
}
void mouseClicked() {
  background(0);
}
class Branch {
  float level, index;
  float x, y,alph;
  float endx, endy;
  Branch[] children = new Branch[0];
  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    alph = 255/level;
    updateMe(ex, ey);
    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int i=0; i<_numChildren; i++) {
        children[i] = new Branch(level+1, x, endx, endy);
      }
    }
  }

  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    endx = x+(level*(random(80)-40));
    endy = y-(level*random(50));
  }

  void drawMe() {
    strokeWeight(_maxLevels-level+1);
    stroke(255-level*10,alph);//color become more deeper.
    line(x, y, endx, endy);
    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}


