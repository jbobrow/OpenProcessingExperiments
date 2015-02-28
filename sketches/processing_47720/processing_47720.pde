
int _num =6 ;
Circle[] _circleArr = {
};
void setup() {
  size(500, 300);
  background(255);
  smooth();
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
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

class Circle {
  float x, y;
  float radius;
  float radius2;
  float mx=mouseX;
  float my=mouseY;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Circle() {
    x = mx+random(300);
    y = my+random(300);
    radius = random(50) + 15;
    radius2 = random(10);
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);

    stroke(linecol, 150);
    fill(255);
    noStroke();

    fill(255, 2);
    rect(0, 0, width, height);
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
    if (radius>=0 ) {
      radius-=0.3;
    }
    if (radius<0) {
      radius=random(100);
    }
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        if ((dis-radius-otherCirc.radius) < 0) {
  stroke(random(255),random(255),random(255));
  strokeWeight(dis/40);
          line(x,y,otherCirc.x,otherCirc.y);     
   touching = true;
          break;

        }
      }
    }

    if (touching) {
      xmove*=-1;
      ymove*=-1;
      
    }

   // drawMe();
  }
}
void keyPressed(){  

  saveFrame("w.jpg");  

} 


