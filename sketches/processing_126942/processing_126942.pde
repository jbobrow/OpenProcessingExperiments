
// re-code the demo Program for the lecture on "Emergence"
// for Design Programming Design, Fall 2013 NCKU
//tutor: Pro. Sheng-Fen Nik Chien
//re-code by Jui-Chi Lin

int _num = 21;      
Circle[] _circleArr = {
};  

void setup() { 
  size(500, 500); 
  strokeWeight(1); 
  drawCircles();
  frameRate(20);
} 

void draw() {    
  background(11, 16, 19);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
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
    alph = random(255);

    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    fill(random(66), random(96), random(45),random(200));
    noStroke();
  }

  void updateMe() {

    y += ymove;

    if (y > (height+radius)) { 
      y=0-radius;
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
          stroke(224, 60, 138, random(50));
          strokeWeight(2);
          overlap *= -1;
          quad(x, y, otherCirc.x, otherCirc.y, x, otherCirc.y, x, otherCirc.y);
        }
      }
    }

    drawMe();
  }
}



