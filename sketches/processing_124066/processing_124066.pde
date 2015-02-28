
// reference to Design Programming Design, Fall 2013 NCKU
// and schien@mail.ncku.edu.tw
// praticeS,by chen, wu-zhi
// class practice




int _num = 3;      
Circle[] _circleArr = {
};  

void setup() { 
  size(900, 600); 
  background(150); 
  strokeWeight(0.5); 
  fill(150, 50); 
  drawCircles();
} 

void draw() {    
  //background(255);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
} 

void mouseReleased() { 
  drawCircles();
  drawCircles();
  drawCircles();
  drawCircles();
  drawCircles();
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
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;
  int s=second();

  Circle() {
    x = random(width);
    y = random(height);
    radius = random(width) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(50);

    xmove = random(5) - 2.5;
    ymove = random(5) - 2.5;
  }

  void drawMe() {
    rectMode(CENTER);
    noStroke();
    fill(fillcol, 100*alph);
    rect(x, y, radius*2+5*s, radius*2+5*s);
    stroke(linecol, 150);
    noFill();
    rect(x+0.1, y+0.1, 10+5*s, 10+5*s);
    //line(radius*2-x, radius*2-y, 3*x, 3*y);
  }

  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+5*radius)) { 
      x=0-radius;
    }
    if (x < (0-5*radius)) { 
      x=width+radius;
    }
    if (y > (height+5*radius)) { 
      y=0-radius;
    }
    if (y < (0-5*radius)) { 
      y=height+radius;
    }
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (5*x +5* otherCirc.x)/8;
          midy = (y + otherCirc.y)/4;
          stroke(linecol, 100*alph);
          noFill();
          //strokeWeight(1);
          overlap *= -1;
          rect(midx, midy, overlap, overlap);
          ellipse(midx, midy, 0.1*overlap, 0.1*overlap);
          line(midx, midy, overlap, overlap);
          line(overlap, overlap, midx, midy);
        }
      }
    }
    if (touching) {
      if (alph > 0) { 
        alph--;
      }
    } 
    else {
      if (alph<100) { 
        alph += -2;
      }
    }
    drawMe();
  }
}



