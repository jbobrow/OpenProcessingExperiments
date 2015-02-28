
//Visualize the emergence, practice in class.
//Stella Wang, 2013/12/04

int _num = 10;
Circle[] _circleArr = {
};

void setup() {
  size(800, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw () {
  background(255);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}


void mouseReleased() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr =(Circle[])append(_circleArr, 
    thisCirc);
  }
}


class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(60) + 10;
    linecol = color(random(255));
    fillcol = color(random(25), random(255), random(255));
    alph = random(100, 200);
    xmove = random(10)*.5 ;
    ymove = random(10)*.4 ;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x += xmove*.2;
    y += ymove*.8;
    if (x > (width+radius)) { 
      xmove *= -1;
    }
    if (x < (0-radius)) { 
      xmove *= -1;
    }
    if (y > (height+radius)) { 
      ymove *= -1;
      alph = alph - 100;
    }
    /*    if (y < (0-radius)) { 
     ymove *= -1;
     }
     */

    //touching test

    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float ratiox, ratioy;
          ratiox = (otherCirc.x*radius + x*otherCirc.radius)/(radius+otherCirc.radius);
          ratioy = (otherCirc.y*radius + y*otherCirc.radius)/(radius+otherCirc.radius);
          stroke(0, 100);
          noFill();
          overlap *= -1;
          ellipse(ratiox, ratioy, overlap, overlap);
          line(x, y, otherCirc.x, otherCirc.y);
        }
        if (overlap < radius - otherCirc.radius) {
          stroke(0, 150);
          noFill();
          line(x, y, otherCirc.x, otherCirc.y);
        }
      }
    }

    drawMe();
  }
}

