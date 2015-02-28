
int _num=10;
Circle[] _circleArr= {
};
void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
 // frameRate(30);
  drawCircle();
}
void draw() {
  background(255);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
void mouseReleased() {
  drawCircle();
}
void drawCircle() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

//-----------------
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
    Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
  //  linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove=random(10)-5;
    ymove=random(10)-5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    
    rect(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
   // ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x += xmove*15*noise(x);
    y += ymove;
    if (x > (width-1/2*radius)) { 
      x=0-radius;
    }
    if (x < (0-radius)) { 
      x=width-1/2*radius;
    }
    if (y > (height+radius)) { 
      y=0-radius;
    }
    if (y < (0-radius)) { 
      y=height+radius;
    }
    drawMe();
  }
}
void keyPressed(){
saveFrame("busy traffic.jpg");
}

