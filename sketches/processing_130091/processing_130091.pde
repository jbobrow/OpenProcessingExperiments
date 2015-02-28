
// Exercise Program for the lecture on "Fractals"
// a program to animate branches of tree
//tree no tree
//like a rotate paint brush
///press key to save image
//by KokFu Lok

int _numChildren = 6;
int _maxLevels = 5;
Branch _trunk;

void setup() {
  size(750, 500);
  background(255);
  //noFill();
  newTree();
}

void draw() {
  //background(255,90);
  fill(220, 6);
  rect(0, 0, width, height);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
}

void newTree() {
  _trunk = new Branch(3, 0, width/2, 50);
  _trunk.drawMe();
}


// the Branch class
class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; // line style 
  float len, lenChange; // length 
  float rot, rotChange; // rotation
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    strokeW = (1/level)*9;
    alph = 255/level; 
    len = (1/level)*random(50); 
    lenChange = random(-1, 1); 
    rotChange =  -0.5;

    updateMe(ex, ey);

    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] = new Branch(level+1, x, endx, endy);
      }
    }
  }

  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    rot += rotChange; 
    len -= lenChange*random(50); 
    if (len<0 || len>250) { 
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
    stroke(random(endx), 50, random(endy), alph*0.2); 
    //line(x-endy/4, y-endx/4, endx, endy);
    // line(x,  endy, endx,y);
    line((x+endx)/2, (y+endy)/2, endx, endy);
    noStroke();
    fill(y/height*255, x/width*255, (endx+endy)/(height+width)*255, alph);
    ellipse(endx, endy, len/10, len/10);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}

void keyPressed() {
  saveFrame("##.png");
}



