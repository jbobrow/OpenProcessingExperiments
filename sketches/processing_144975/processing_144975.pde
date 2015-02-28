
int _num = 30;    
Circle[] _circleArr = {
};
void setup() {
  size(600, 600);
  background(255);
  strokeWeight(5);
  fill(150, 100);
}
 
void draw() {  
  background(0);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=20; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}
  
 
 
class Circle {
  float x, y, x1, y1, x2, y2;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  float rot;
  Circle() {
    x = random(width);
    y = random(height);
    x1 = random(width);
    y1 = random(height);
   
    radius = random(5, 50);
    linecol = color(200,30,40);
    fillcol = color(200,100,100);
    alph = random(30, 150);
    xmove = random(-1, 2);
    ymove = random(-1, 2); //- 5;
    rot=radians(x*2);
  }
 
  void drawMe() {
    stroke(3);
    fill(136,40);
    ellipse(x, y, x1, x1);
    stroke(linecol, 75);
    fill(200, 200);
    ellipse(x, y, 50, 50);
    ellipse(x1, y1, 100, 100);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    x1 += xmove*0.1;
    y1 += ymove*0.3;
    x2 += xmove*0.1;
    y2 += ymove*0.3;
    if (x > (width+radius)) {
      x=width+radius;
      xmove= -xmove;
    }
    if (x < (0-radius)) {
      x=0-radius;
      xmove= -xmove;
    }
    if (y > (height+radius)) {
      y=height+radius;
      ymove= -ymove;
    }
    if (y < (0-radius)) {
      y=0-radius;
      ymove= -ymove;
    }
    if (x2 > (width+radius)) {
      x2=width+radius;
      xmove= -xmove;
    }
   fill(255, 255, 255);
 ellipse (300, 250, 100, 100);
  if (mousePressed == true) {
    for (int x = -20; x < width; x += 20) {
      float mx = mouseX / 2;
      fill(random(255), random(255), random(255));
ellipse (100, 100, 100, 100);
    }
  }

    drawMe();
  }
}

