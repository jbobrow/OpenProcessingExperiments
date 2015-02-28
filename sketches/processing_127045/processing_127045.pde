
//exercise on fractals
//rotation change level up
//wait for more time and different patterns will be seen 
//by chen-hsin chang

int _numChildren = 10;
int _maxLevels = 3;
Branch _trunk;

void setup() {
  size(750, 500);
  background(255);
  noFill();
  newTree();
}
//add animation
void draw() {
  background(0);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
}
void newTree() {
  _trunk = new Branch(1, 0, width/10, 50);
  _trunk.drawMe();
}


class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  //add new properties
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation



  //add self-reference
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    //initialize them in the constructor
    strokeW = (1/level)*10;
    alph = 255/level;
    len = (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(100);



    updateMe(ex, ey);
    //add self-reference
    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] = new Branch(level+1, 
        x, endx, endy);
      }
    }
  }

  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    //recalculate end points
    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>200) {
      lenChange *= -1;
    }
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));


    //endx = x + 150;
    //endy = y + 15;

    //add self-reference
    //endx = x+(level*(random(100)-50));
    //endy = y+50+(level*random(50));

    //add animation
    for (int i=0; i<children.length; i++)
    {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    //add self-reference
    //strokeWeight(_maxLevels-level+1);

    fill(255, alph);

    ellipse(x, y, 5, 5);

    //draw big circles and thick lines
    strokeWeight(strokeW/5);
    stroke(255, alph);
    line(x, y, endx, endy);
    fill( mouseX, 100, 100, alph);
    ellipse(endx, endy, len/6, len/6);
    //add self-reference
    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe();
    }
  }
}



