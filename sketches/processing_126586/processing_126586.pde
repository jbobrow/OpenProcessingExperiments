
// re-code the demo Program for the lecture on "Emergence"
// for Design Programming Design, Fall 2013 NCKU
//tutor: Pro. Sheng-Fen Nik Chien
//re-code by Jui-Chi Lin

int _num = 15;      
Circle[] _circleArr = {
};  

void setup() { 
  size(500, 500); 
  background(30, 60, 90, 90); 
  strokeWeight(1); 
  fill(150, 50); 
  drawCircles();
} 

void draw() {    
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
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;


  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    alph = random(255);

    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noFill();
    noStroke();
    //fill(fillcol, alph);
    //ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);

    ellipse(x, y, 10, 10);
  }

  void updateMe() {
    y += ymove;
    if (y > (height+radius)) { 
      y=0;
    }
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(random(255), random(100));
          overlap *= -1;
          linecol = color(random(255), random(255), random(255));
          quad(x, y, x, otherCirc.y, x, otherCirc.y, otherCirc.x, otherCirc.y);
        }
      }
    }

    drawMe();
  }
}



