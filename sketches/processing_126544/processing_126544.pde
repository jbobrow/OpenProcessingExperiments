
//1204 InClassPractice
//N76014087 TePangChiang
//combine ccenter to make square

int _num = 10;
Circle[] _CircleArr = {
};

void setup() {
  size(900, 300);
  smooth();
  strokeWeight(2);
  fill(150, 50);
  drawCircle();
}

void draw() {
  background(255);
  for (int i=0; i<_CircleArr.length; i++) {
    Circle thisCircle = _CircleArr[i];
    thisCircle.updateMe();
  }
}

void mouseReleased() {
  drawCircle();
}

void drawCircle() {
  for (int i=0; i<_num; i++) {
    Circle thisCircle = new Circle();
    thisCircle.drawMe();
    _CircleArr =(Circle[])append(_CircleArr, 
    thisCircle);
  }
}

class Circle {
  float x, y;
  float Length;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Circle() {
    x = random(80, width-80);
    y = random(80, height-80);
    Length = random(70)+10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(10), random(10), random(200));
    alph = random(50,150);
    xmove = random(10, 20)-7;
    ymove = random(10, 20)-7;
  }
  void drawMe() {
    rectMode(CENTER);
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, Length*2, Length*2);
    stroke(linecol, 150);
    noFill();
    //ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x += xmove;
    //y += ymove;
    if (x > (width-Length)) { 
      xmove = -xmove;
    }
    if (x < (Length)) { 
      xmove = -xmove;
    }
    /*if (y > (height-Length)) { 
      ymove = -ymove;
    }
    if (y < (Length)) { 
      ymove = -ymove;
    }*/
    boolean touching = false;
    for (int i=0; i<_CircleArr.length; i++) {
      Circle otherCircle = _CircleArr[i];
      if (otherCircle != this) {
        float dis = dist(x, y, otherCircle.x, otherCircle.y);
        float overlap = dis - Length - otherCircle.Length;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCircle.x)/2;
          midy = (y + otherCircle.y)/2;
          //stroke(random(150, 250), 0, 0, random(50, 100));
          //strokeWeight(random(2, 4));
          //line(midx, 0, midx, otherCircle.y);
          //line(midx, midy, otherCircle.x, otherCircle.y);
          overlap *= -1;
          rectMode(CORNER);
          stroke(random(150, 250), random(150, 200));
          strokeWeight(random(1, 3));
          noFill();
          //ellipse(midx, midy, overlap, overlap);
          rect(midx, midy, overlap, overlap);
        }
      }
    }
    drawMe();
  }
}



