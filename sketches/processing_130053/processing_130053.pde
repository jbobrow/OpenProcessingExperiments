
//The drawing lines will make people focus on the middle.
//(maybe there will be a pattern like a quotation)
//People can write a greetnig phrase in the middle.

//Choose your season's greeting card:
//a. change the weight of line, press 1, 2, 3
//b. use space to reset the drawing pattern
//c. click the mouse to print the pattern you like as your card(png file)

//Emergence and fractals practice
//Stella Wang, 2014/01/25

int _numChildren = 2;
int _maxLevels = 2;
int w = 1;
Branch _trunk;

void setup() {
  size(900, 600);
  background(3, 0, 56);
  frameRate(20);
  noFill();
  newTree();
}

void newTree() {
  _trunk = new Branch(1, 0, width/2, height/2);
  _trunk.drawMe();
}

void draw() {
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
  if (frameCount > 900) {
    w = 0;  // decrease the effect of line
  }
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float dist, distChange;
  float rot, rotChange;

  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;

    dist = (1/level)*random(200);
    rot = (1/level)*random(10);
    distChange = random(10)-7;
    rotChange = random(10)-5;

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
    rot += rotChange;
    dist += distChange;

    float radian = radians(rot);
    endx = x+2+(dist*cos(radian));
    endy = y-100+(dist*sin(radian));

    if (endx > width || endx < 0) {
      endx *= -1;
    }
    if (endy > height || endy < 0) {
      endy *= -1;
    }
    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    stroke(random(endy-20)-20, random(endx), random(endx), random(20));
    strokeWeight(w);
    ellipse(width/2, height/2, endx, endy);

    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
  }
}

//w: change the weight of line(1-3)
//space: reset the greeting card
void keyPressed() {
  if (key == '1' || frameCount < 500) {
    w = 1;
  }
  else if (key == '2' || frameCount < 500) {
    w = 2;
  }
  else if (key == '3' || frameCount < 500) {
    w = 3;
  }
  if (key == ' ') {
    background(3, 0, 56);
    _trunk = new Branch(1, 0, width/2, height/2);
    frameCount = 0;
  }
}

void mouseClicked() {
  saveFrame("greeting####.png");
}


