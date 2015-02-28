
/*
Author: Anita Chen
Purpose: Assignment-6 "Fall, Falling, Fallen"
Concept:Fallen square & touch shake
reference:http:class exercise by Sheng-Fen Nik Chien       
 */
int _num = 10;
Circle[]_circleArr= {
};
void setup() {
  size(400, 400);
  background(0);
  smooth();
  drawCircles();
}
void draw() {
  frameRate(50);
  fill(0, 50);
  noStroke();
  rectMode(CORNER);
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
    y = random(height/2);
    radius = random(50) + 10;
    d=random(10);
    linecol = color(255, 0, random(255), 150);
    linecol2 = color(random(200));
    fillcol = color(random(240, 255));
    alph = random(255);
    xmove = sin(10)-random(-5, 5);
    ymove = random(15);
  }
  float customNoise(float value) {
    int count=int (value%(random(15)));
    float retValue=pow(sin(value), count);
    return retValue;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, 20);
    rectMode(CENTER);
    rect(x, y, radius*2, radius*2);
    strokeWeight(1);
    stroke(0, alph);
    noFill();
    rect(x, y, d, d);
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
          stroke(linecol, alph);
          strokeWeight(1.5);
          float x1, y1;
          float noiseval=random(20);
          float radVariance, thisRadius, rad;
          beginShape();      
          for (float ang=0; ang<=360; ang+=2) { 
            radVariance = customNoise(noiseval);
            thisRadius = overlap+radVariance;            
            rad = radians(ang);                                  
            x1 = midx + (thisRadius * cos(rad));
            y1 = midy + (thisRadius * sin(rad));
            curveVertex(x1, y1);
          }
          endShape(CLOSE);
        }
      }
    }
    drawMe();
  }
}
void keyPressed() {
  saveFrame("Falling .jpg");
}


