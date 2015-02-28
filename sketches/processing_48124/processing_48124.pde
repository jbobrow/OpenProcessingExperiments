
//yi-ting sie
//課程練習：class
//運用滑鼠在畫面中點擊，每次會多出五個圓圈，並且隨意的畫面中流動。
///Sheng-Fen Nik Chien (2011), Complexity, 數位學習平台http://moodle.ncku.edu.tw/course/view.php?id=43022 

int _num = 5;
Circle[] _circleArr = {
};
void setup() {
  size(500, 500);
  background(0);
  smooth();
  strokeWeight(1);
  drawCircles();
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
    x = random(width/2);
    y = random(height/2);
    radius = random(50);
    linecol = color(random(255), random(255), random(40));
    fillcol = color(255, 255, random(40));
    alph = random(150);
    xmove = random(2);
    ymove = random(2);
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*3, radius*3);
    stroke(150);
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
    drawMe();
  }
}

void keyPressed() {  
 saveFrame("class002.jpg");  
 }

