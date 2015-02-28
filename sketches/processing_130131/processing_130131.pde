
//basic from nick schien in class
// schien@mail.ncku.edu.tw
//re-code by jui chi lin
PImage img;
void setup() {

  size(500, 500);
  background(255);
  smooth();
  noFill();
  newTree();
}
void draw() {
  background(255);
  textSize(30);
  fill(248, 107, 116);
  //text("Happy New Year", 120, 380); 
  text("Happy New Year of Horse", 120, 450);
  textSize(24);
  text(" 2014!!",390, 480);
  textSize(18);
  text("Greeting from JC Lin",220,480);
  fill(0, 102, 153);

  _trunk.updateMe(width/2, height/4);

  _trunk.drawMe();
}


class Branch {

  float level, index;

  float x, y;

  float endx, endy;
  float strokeW, alph; // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, 
  float ex, float ey) {

    level = lev;

    index = ind;
    strokeW = (1/level)*100;
    alph = 255/level;
    len = (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(10)-5;

    updateMe(ex, ey);
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
    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>200) {
      lenChange *= -1;
    }
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));
    //endx = x+(level*(random(100)-80));
    //endy = y+50+(level*random(50));
    for (int i=0; i<children.length; i++)
    {

      children[i].updateMe(endx, endy);
    }


    //  endx = x + 150;

    // endy = y + 15;
  }


  void drawMe() {
    color clr;
    clr = color(random(170, 255), random(80, 120), random(40, 120));
    noStroke();
    fill(clr, alph);
    //line(x, y, endx, endy);
    //ellipse(endx, endy, len/12, len/12);
    // quad(x, y, endx, y, endy, x, endx, endy);
    fill(clr, alph);
    quad(x, y, endx, endy, endx, y, endy, x);
    quad(x, endx, endy, y, endx, x, y, endy);
    quad(x, endy, y, endx, endx, x, y, endy);

    for (int i=0;i<children.length;i++)
    {
      children[i].drawMe();
    }
  }
}
int _numChildren = 3;

int _maxLevels = 3;

Branch _trunk;





void newTree() {

  _trunk = new Branch(1, 0, width/2, 50);

  _trunk.drawMe();
}



