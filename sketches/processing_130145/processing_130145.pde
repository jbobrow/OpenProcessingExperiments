
//fall,falling, fallen
//Fall, 2013, ncku
//HorusWang


int _num = 20; 
float radius = 10;
Circle[] _circleArr = {
};  

void setup() { 
  size(500, 500); 
  background(255); 
  smooth();
  strokeWeight(1); 
  fill(100, 50); 
  drawCircles();
  frameRate(30);
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

//create circles
class Circle {
  int n = 255;
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;


  Circle() {
    x = random(width);
    y = random(height);
    radius = random(10,100);
    linecol = color(n, n, n, random(50,n));
    fillcol = color(n, n, n, random(50,n));
    alph = random(n);

    xmove = random(10)+-7;
    ymove = random(10)-20;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, random(50,n));
    noFill();
    ellipse(x, y, 10, 10);
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
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(0, 100);
          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }


    drawMe();
  }
}



