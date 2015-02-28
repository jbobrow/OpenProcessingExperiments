
//yi-ting sie
//課程練習：class
//運用滑鼠在畫面上的點選，讓畫面每次隨意產生五個線條。
//Sheng-Fen Nik Chien (2011), Complexity, 數位學習平台http://moodle.ncku.edu.tw/course/view.php?id=43022 

int _num = 5;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  strokeWeight(5);
  fill(mouseX, mouseY, 200);
  drawCircles();
}

void draw() {
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
  }
}

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 5;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    rect(x, y, radius*1/8, radius*2);
    stroke(linecol, 250);
    noFill();
    rect(x, y, 5, 5);
  }
}

void keyPressed() {  
 saveFrame("class001.jpg");  
 }

