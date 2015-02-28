
// Exercise [ X ] : class object & array & move
// modify 
// lin wenyu  (ken3101462@gmail.com)

int _num = 10;
Circle[] _circleArr= {
};

void setup() {
  size(800, 300);
  background(0);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  for (int i=0;i<_circleArr.length;i++) {
    Circle thisCirc=_circleArr[i];
    thisCirc.updateMe();
  }
  fill(0, 50);
  rect(0, 0, width, height);
}

void mouseReleased() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr =(Circle[])append(_circleArr, thisCirc);
  }
}

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  Circle() {
    x = random(110, width-110);
    y = random(110, height-110);
    radius = random(80)+10 ;
    linecol = color(240, random(40, 100), 50);
    fillcol = color(240, random(40, 100), 50);
    alph = random(200);
    xmove=random(20)-10;
    ymove=random(20)-10;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius, radius);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width-radius/2)) { 
      xmove=-xmove;
    }
    if (x < (0+radius/2)) { 
      xmove=-xmove;
    }
    if (y > (height-radius/2)) { 
      ymove=-ymove;
    }
    if (y < (0+radius/2)) { 
      ymove=-ymove;
    }
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius/2 - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(255);
          noFill();
          overlap *= 2;
          ellipse(midx, midy, overlap, overlap);
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
        alph += 2;
      }
    }
    drawMe();
  }
}




