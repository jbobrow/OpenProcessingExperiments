
//yi-ting sie
//Homework: Fall, Falling, Fallen
//透過線條的相互交疊呈現秋天收穀的景色，並運用橘色、褐色、綠色來表示落葉垂落的意思。
//Sheng-Fen Nik Chien (2011), Complexity, 數位學習平台http://moodle.ncku.edu.tw/course/view.php?id=43022


float _num = 100;
Liness[] _linessArr = {
};

void setup() {
  size(500, 500);
  frameRate(1); //秒數
  background(128, 64, 0, 250);
  smooth();
  strokeWeight(random(1));
  fill(random(198), random(99), random(0), 100);
  drawLiness();
}

void draw() {
  background(128, 64, 0, 250);
  for (int i=0; i<_linessArr.length; i++) {
    Liness thisLin = _linessArr[i];
    thisLin.updateMe();
  }
}

void mouseReleased() {
  drawLiness();
}

void drawLiness() {
  for (int i=0; i<_num; i++) {
    Liness thisLin = new Liness();
    thisLin.drawMe(); 
    _linessArr = (Liness[])append(_linessArr, thisLin);
  }
}

class Liness {
  float x, y;
  float radius;
  color linecol;
  float alph;
  float xmove, ymove;
  Liness() {
    x = random(width);
    y = random(height);
    radius = random(100);
    linecol = color(random(198), random(99), random(0));
    alph = random(255);
  }

  void drawMe() {//開始的圖形
    rect(x, y, radius*1/50, radius*2);
    stroke(random(198), random(99), random(0),100);
    fill(random(198), random(99), random(0),100);
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
    for (int i=0; i<_linessArr.length; i++) {
      Liness otherLin = _linessArr[i];
      if (otherLin != this) {
        float dis = dist(x, y, otherLin.x, otherLin.y);
        float overlap = dis - radius - otherLin.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherLin.x)/2;
          midy = (y + otherLin.y)/2;
          stroke(random(198), random(99), random(0), 100);
          fill(random(198), random(99), random(0), 100);
          overlap *= -1;
          rect(midx, midy, overlap*1/50, overlap);
        }
      }
    }

    //drawMe();
  }
}


void keyPressed() {  
  saveFrame("Homework Fall Falling Fallen.jpg");
}


