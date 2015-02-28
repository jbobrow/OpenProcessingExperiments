
//Season's Greeting
//Use animate branches
//emergence
//Test 021 [Date:20131217] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛 Juihsun,Lin

int _numChildren = 5;
int _maxLevels = 5;
int _numChildren2 = 4;
int _maxLevels2 = 4;
Branch _trunk;
Branch _trunk2;


void setup() {

  size(500, 500);
  background(31, 56, 77);
  smooth();  
  frameRate(3);
  newTree();
}


void draw() {
  background(31, 56, 77);

  _trunk.updateMe(width/5, height/10);
  _trunk.drawMe();
  _trunk2.updateMe(width/5, height/5);
  _trunk2.drawMe();
}

void mouseReleased() {
  newTree();
}

void newTree() {
  
  _trunk = new Branch(1, 0, width/2, 25);
  _trunk.drawMe();
  _trunk2 = new Branch(1, 0, width/4, 50);
  _trunk.drawMe();
}




//====================Object====================================
//Branch class==================================================

class Branch {
  float level, index; 
  float x, y;
  float endx, endy;
  //=====================================  
  float strokeW, alph,alph2;  // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation
  //=====================================
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    //======================================
    strokeW = (1/level)*0.01;
    alph = 255/level;
    alph2= 150/level;
    len = (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    //======================================
    updateMe(ex, ey);

    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int x=0; x<_numChildren; x++) {
        children[x] = new Branch(level+1, x, endx, endy);
      }
    }
  }


  void updateMe(float ex, float ey) {
    x = ex;
    y = ey;

    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>500) {
      lenChange *= -1;
    }
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));

    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
    boolean touching=false;
    for (int i=0;i<children.length;i++) {
 
      if (children[i]!=this) {
        float dis =dist(endx, endy, children[i].endx, children[i].endy);
        if ((dis-this.len-children[i].len)<0) {
          touching=true;
        }
      }
    }
    if (touching) {
      if (alph>0) {
        alph--;       
      }
    }
    else {
      if (alph<255) {
        //alph=alph-1;
        alph2+=0.03;
      }
    }
  }
  void drawMe() {

    strokeWeight(strokeW/2);
    fill(255, alph);
    stroke(random(20), alph2);
    fill(random(255), random(255), random(255), alph2);
    line(x, y, endx, endy);
    ellipse(x, y, len/2, len/2);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}

class Branch2 {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph3; // line style
  Branch2[] children = new Branch2[0];

  Branch2(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    strokeW = level*2;
    alph3 = 255/level;
    updateMe2(ex, ey);
    if (level < _maxLevels2) {
      children = new Branch2[_numChildren2];
      for (int x=0; x<_numChildren2; x++) {
        children[x] = new Branch2(level+1, x, endx, endy);
      }
    }
  }


  void updateMe2(float ex, float ey)
  {
    x = ex;
    y = ey;
    endx =x+(level*(random(70)-35));
    endy =y+50+(level*random(70));
  }
  void drawMe2() {
    strokeWeight(strokeW);
    stroke(random(113, 255), random(149, 241), 0, alph3);
    line(x, y, endx, endy);

    for (int i=0;i<children.length;i++) {
      children[i].drawMe2();
    }
  }
}
void keyPressed() {
  saveFrame("SeasonsGreeting-####.png");
}



