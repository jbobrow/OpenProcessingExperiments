
//Season's Greeting
//Use animate branches
//emergence
//Test 021 [Date:20131217] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛 Juihsun,Lin

int _numChildren = 15;
int _maxLevels = 3;
int _numChildren2 =  4;
int _maxLevels2 = 4;
Branch _trunk;
Branch _trunk2;
float radius = 4;
Circle[] _circleArr = {
}; 


void setup() {

  size(600, 600);
  background(31, 56, 77);
  smooth();  
  //frameRate(3);
  newTree();
  drawCircles();
}


void draw() {
  background(31, 56, 77);

  _trunk.updateMe(width/3, height/3);
  _trunk.drawMe();
  _trunk2.updateMe(width/6, height/6);
  _trunk2.drawMe();

  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}

void newTree() {
  _trunk = new Branch(1, 3, width/2, 30);
  _trunk.drawMe();
  _trunk2 = new Branch(6, 0, width/2, 60);
  _trunk.drawMe();
}

void drawCircles() {
  for (int i=0; i<_numChildren; i++) { 
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr =(Circle[])append(_circleArr, thisCirc);
  }
}


//====================Object====================================
//Branch class==================================================

class Branch {
  float level, index; 
  float x, y;
  float endx, endy;
  //=====================================  
  float strokeW, alph;  // line style
  float len, lenChange; // length
  float rot, rotChange; // rotation
  //=====================================
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    //======================================
    strokeW = (1/2*(level-1))*200;
    alph = 255/level;
    len = (1/level)*random(100);
    lenChange = random(20)-5;
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
    if (len<0 || len>600) {
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
    fill(255, alph);
    stroke(random(20), alph);
    fill(random(255), random(255), random(255), alph);
    line(x/2, y/2, endx/2, endy/2);
    ellipse(x, y, len/12, len/12);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}

class Branch2 {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph; // line style
  Branch2[] children = new Branch2[0];

  Branch2(float lev, float ind, float ex, float ey) {
    level = lev;
    index = ind;
    strokeW = level*1.5;
    alph = 255/level;
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
    stroke(random(113, 255), random(149, 241), 0, alph);
    line(x, y, endx, endy);

    for (int i=0;i<children.length;i++) {
      children[i].drawMe2();
    }
  }
}

//Circle======================================================
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Circle() {
    x = random(width);
    y = random(height);
    radius = random(50) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(100, random(190), 234, 50);
    alph = random(255);
    xmove = random(10)-5;
    ymove = random(5);
  }
  float customNoise(float value) {
    int count=int (value%(random(10)));
    float retValue=pow(sin(value), count);
    return retValue;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 50);
    strokeWeight(2);
    ellipse(x, y, 20, 20);
  }

  void updateMe() {
    x += xmove;
    y += ymove;

    if (x > width-radius) { 
      x=width-radius;
      xmove = -xmove;
    }
    if (x <= radius) { 
      x=radius;
      xmove = -xmove;
    }
    if (y > height-radius) { 
      y=height-radius;
      ymove = -ymove;
    }
    if (y <= radius) { 
      y=radius;
      ymove = -ymove;
    }

    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis- radius- otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx= (x + otherCirc.x)/2;
          midy= (y + otherCirc.y)/2;
          noFill();
          overlap *= -2;
          triangle(x, y, midx, midy, otherCirc.x, otherCirc.y);

          stroke(linecol, alph);
          strokeWeight(1);
          ellipse(midx, midy, overlap, overlap);
          float x1, y1;
          float noiseval=random(50);
          float radVariance, thisRadius, rad;

          beginShape();     
          for (float ang=0; ang<=360; ang+=15) {
            radVariance = customNoise(noiseval);
            thisRadius = overlap+radVariance;           
            rad = radians(ang);                                 
            x1 = midx + (thisRadius * sin(rad));
            y1 = midy + (thisRadius * cos(rad));
            curveVertex(x1, y1);
          }
          endShape(CLOSE);

          touching = true;
          break;
        }
      }
    }
    if (touching) {
      if (alph > 0) { 
        alph--;
      }
    } 
    else {
      if (alph<255) { 
        alph += 5;
      }
    }
    drawMe();
  }
}




void keyPressed() {
  saveFrame("SeasonsGreeting-####.png");
}



