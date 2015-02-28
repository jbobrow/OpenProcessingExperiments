
// pactice emerge pattern by function class
// circles move back when their center point touch the boundry 
// the center of the moving circles will line up when they touch each other
// by chen-hsin chang

int _num = 10;
Circle[] _circleArr = {
};
void setup() {
  size(500, 300);
  background(255);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
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
    radius = random(20) + 10;
    linecol = color(mouseX, random(255), random(255));
    fillcol = color(mouseX, random(255), random(255));
    alph = random(20);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    strokeWeight(0.1);
    noFill();
  }

  // reverse array when circle touch the edge
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { 
      xmove=-xmove;
    }
    if (x < (0-radius)) { 
      xmove=-xmove;
    }
    if (y > (height+radius)) { 
      ymove=-ymove;
    }
    if (y < (0-radius)) { 
      ymove=-ymove;
    }
    // moving
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          stroke(0, 100);
          strokeWeight(3);
          noFill();
          line(x, y, otherCirc.x, otherCirc.y);
          //xmove=-xmove;
          //ymove=-ymove;
          overlap *= -1;
        }
        if ((dis-radius-otherCirc.radius) < 0) {
          touching = true;
          break;
        }
      }
    }


    drawMe();
  }
}



