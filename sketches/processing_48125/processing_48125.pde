
//yi-ting sie
//課程練習：class
//透過滑鼠的每次點擊，每次產生出五個圓形，並藉由交疊出現的方體，進而浮現出其它的圖形。
//Sheng-Fen Nik Chien (2011), Complexity, 數位學習平台http://moodle.ncku.edu.tw/course/view.php?id=43022

int _num = 5;


Circle[] _circleArr = {
};
void setup() {
  size(400, 400);
  background(255);
  smooth();
  strokeWeight(random(3));
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
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);//透明度
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
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
          midx = (x + otherCirc.x)*2;
          midy = (y + otherCirc.y)/2;
          stroke(0, 100);
          noFill();
          overlap *= +1;
          rect(midx, midy, overlap*10, overlap);
        }
      }
    }
   //drawMe();
  }
}


void keyPressed() {  
 saveFrame("class003.jpg");  
 }

