
int _num = 10;
Circle[]_circleArr = {
};

void setup() {
  size(900, 900);
  background(85, 115, 134);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  
  background(random(255), random(255), random(255), 40);
  for (int i=0;i<_circleArr.length;i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased() {
  drawCircles();
  println(_circleArr.length);
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Circle () {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, 20);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
  }

  void updateMe() {
    x+=xmove*2;
    y+=ymove*2;
    if (x>(width+radius)) {
      x=0-radius;
    }
    if (x<(0-radius)) {
      x=height+radius;
    }
    if (y>(height+radius)) {
      y=0-radius;
    }
    if (y<(0-radius)) {
      y=height+radius;
    }


    for (int i=0;i<_circleArr.length;i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap<0) {
          float midx, midy;
          midx = (x+ otherCirc.x)/2;
          midy = (y+ otherCirc.y)/2;
          stroke(0, 100);
          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }

    drawMe();
  }
}

