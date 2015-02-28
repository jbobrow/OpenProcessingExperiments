
//Clark Li
//Practice the function of "Class"

int _num = 10;
Circle[]_circleA= {
};

void setup() {
  size(800, 450);
  background(200);
  smooth(20);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background(200);
  for (int i=0; i<_circleA.length; i++) {
    Circle thisCirc =_circleA[i];
    thisCirc.updateMe();
  }
}
void mousePressed() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleA=(Circle[])append(_circleA, thisCirc);
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
    radius = random(100) + 5;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove=random(10)-5;
    ymove=random(10)-5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, random(radius*2+10), radius*2);
    stroke(linecol, 200);
    noFill();
    ellipse(x, y, random(radius*2+10), 10);
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
      y=0-radius+height*2;
    }
    if (y < (0-radius)) { 
      y=height+radius;
    }
    drawMe();
  }
}



