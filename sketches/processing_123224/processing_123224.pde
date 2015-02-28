
//busy buble
//by XinhanYen,Email:archi730@hotmail.com
//inspire by Exercise Program for the lecture on "Emergence"
// a program to draw bouncing circles using objects
// for Design Programming Design, Fall 2013 NCKU
// schien@mail.ncku.edu.tw


int _num = 10;
Circle[] _circleArr = {
};
void setup() {
  size(1000, 300);
  background(10);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background(10);
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

//

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
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(100)+80;
    xmove = random(14) - 7;
    ymove = random(8) - 4;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 100);
    noFill();
    ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width-radius)) { 
      x =width-radius;
      xmove= -(xmove+10);
    }
    if (x < (radius)) { 
      x = radius;
      xmove= -(xmove-10);
    }
    if (y > (height-radius)) { 
      y = height-radius;
      ymove= -(ymove+10);
    }
    if (y < (radius)) { 
      y = radius;
      ymove= -(ymove-10);
    }
 
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(255, 100);
          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap+random(10), overlap+random(10));
        }
      }
    }
    drawMe();
  }
}



