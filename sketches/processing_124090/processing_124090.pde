
//use class to define objects.Rain & Umbrellas.
//Lin,Lien Ya   institute of Industrial design.
int _num =160;
Circle[]_circleArr= {
};
Circle2[]_circleArr2= {
};
void setup() {
  size(500, 500);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  background(255);
  for (int i=0;i<_circleArr.length;i++) {
    Circle thisCirc=_circleArr[i];
    thisCirc.updateMe();
  }
  for (int i=0;i<_circleArr2.length;i++) {
    Circle2 thisCirc2=_circleArr2[i];
    thisCirc2.updateMe2();
  }
}


void mouseReleased() {
  //drawCircles();
  if (_num>0) {
    for (int i=0; i<20; i++) {
      _circleArr =(Circle[])shorten(_circleArr);
      _circleArr2 =(Circle2[])shorten(_circleArr2);
      _num=_num-1;
    }
  }
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    Circle2 thisCirc2 = new Circle2();
    thisCirc2.drawMe2();
    _circleArr =(Circle[])append(_circleArr, thisCirc);
    _circleArr2 =(Circle2[])append(_circleArr2, thisCirc2);
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
    radius = random(50) + 10;
    linecol = color(random(255), random(255));
    fillcol = color(random(50, 105), random(50, 105), random(100, 255), random(175));
    alph = random(100, 255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    line(x, y, radius/2, radius*2);
    stroke(linecol, 150);
  }
  void updateMe() {
    // x += xmove;
    y += ymove;
    if (x > (width+radius)) {
      x=0-radius;
    }
    if (x < (0-radius)) {
      x=width+radius;
    }
    if (y > (height+radius)) {
      y=0-radius;
    }
    if (y < (0-radius)) {
      y=height+radius;
    }

    //  boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          stroke(0, 200);
          strokeWeight(1);
          overlap *= -1;
          beginShape();
          noFill();
          vertex(x, y);
          vertex((x+otherCirc.x)/2, (y+otherCirc.y)/2+8);
          vertex(otherCirc.x, otherCirc.y);
          endShape();
          // line(x, y, otherCirc.x, otherCirc.y);
        }
        drawMe();
      }
    }
  }
}

class Circle2 {
  float x2, y2;
  float radius2;
  color linecol2, fillcol2;
  float alph2;
  float xmove2, ymove2;

  Circle2() {
    x2 = random(width);
    y2 = random(height);
    radius2 = random(50) + 10;
    linecol2 = color(0, 0, random(255), random(255));
    fillcol2 = color(0, 0, random(255), random(255));
    alph2 = random(100, 255);
    xmove2 = random(10) - 5;
    ymove2 = random(10);
  }

  void drawMe2() {
    stroke(linecol2);
    strokeWeight(1);
    line(x2, y2, x2+radius2/4, y2+radius2/2);
    //stroke(linecol2, 150);
    //fill(0);
    //ellipse(x2, y2, 10, 10);
  }
  void updateMe2() {
    // x += xmove;
    y2 += ymove2;
    if (x2 > (width+radius2)) {
      x2=0-radius2;
    }
    if (x2 < (0-radius2)) {
      x2=width+radius2;
    }
    if (y2 > (height+radius2)) {
      y2=0-radius2;
    }
    if (y2 < (0-radius2)) {
      y2=height+radius2;
    }
    drawMe2();
  }
}



