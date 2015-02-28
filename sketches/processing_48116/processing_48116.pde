
/*Emergence Patterns with class*/

int _num = 10;
Circle[]_circleArr= {
};
void setup() {
  size(400, 400);
  background(255);
  smooth();
  drawCircles();
}
void draw() {
  frameRate(15);
  fill(255, 50);
  noStroke();
  rect(0, 0, width, height);
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
    Circle thisCirc=new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}
class Circle {  
  float x, y;
  float radius, d;
  color linecol, linecol2, fillcol;
  float alph;
  float xmove, ymove;
  float angle=0.0;

  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
    d=random(10);
    linecol = color(random(255), random(255), random(255));
    linecol2 = color(random(200));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove = random(customNoise(10))*6;
    ymove = random(customNoise(10))*8;
  }
  float customNoise(float value) {
    int count=int (value%(random(5)));
    float retValue=pow(sin(value)*10, count);
    return retValue;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, d, d);
  }
  void updateMe() {
    x += xmove;
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
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap=dis-radius-otherCirc.radius;
        if (overlap<0) {
          float midx, midy;
          midx=(x+otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          noFill();
          overlap *= -1;
          stroke(linecol2, alph);
          strokeWeight(1);
          ellipse(midx, midy, overlap, overlap);
          stroke(linecol, alph);
          strokeWeight(1.5);
          line(x, y, midx, midy);
        }
      }
    }
    // drawMe();
  }
}
void keyPressed() {
  saveFrame("emergence.jpg");
}


