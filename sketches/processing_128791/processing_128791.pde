
/*秋是落下的季節，逐漸消逝的季節
 為了抓住點什麼，我們不斷計算這季節裡的殘影以紀念
 
 最後卻發現，人的行為－計算這件事－反而才真正代表這季節我們所留下的什麼
 
 --
 計算一個距離範圍內的falling lines，透過「畫出橢圓」來代表「計算」這個行為
 橢圓的黃色在黑夜是清楚的，而人們在夜裡、在夢中整理記憶
 代表最終留下的記憶，是因人類附加上去的行為意識而清晰
 
 The continuous falling means the feeling of time passing by in fall,
 just like falling leaves in wind.
 The continuouse of drawing means people want to capture something while things goes by.
 So they draw and keep the trace of ellipse.
 The color of trace(ellipse) is bright at night, and our brains arrange memories while dreaming.
 It says that the memory will be clear because of conscious behavior by themselves.
 */
//Measure the Falling Fall
//Stella Wang, Tainan, 2014/01/19

int _num = 5;
Line[] _lineArr = {
};

int t = 1;
float bg = 180;

void setup() {
  size(700, 700);
  background(bg);
  frameRate(10);
  drawLines();
}

void draw() {
  noStroke();
  fill(bg, 90);  //alph value: leave the trace of falling fall
  rect(0, 0, 700, 700);
  for (int i=0; i<_lineArr.length; i++) {
    Line thislin = _lineArr[i];
    thislin.updateMe();
  }
  drawLines();

  //change the background color(day ang night in fall)
  //use t to check ehether getting darker or lighter
  if (mousePressed == true) {
    if (t == 1) {
      bg += 10;
      if (bg > 255) {
        bg -= 10;
        t = 0;
      }
    }
    else if (t == 0) {
      bg -= 10;
      if (bg < 10) {
        bg += 10;
        t = 1;
      }
    }
  }
}

void drawLines() {
  for (int i=0; i<_num; i++) {
    Line thisLin = new Line();
    thisLin.drawMe();
    _lineArr = (Line[])append(_lineArr, thisLin);
  }
}

class Line {
  float x1, y1, x2, y2;
  float a;
  float xmov1, ymov1, xmov2, ymov2;

  Line() {
    x1 = random(-50, width);
    y1 = random(-50, height);
    x2 = x1 + noise(width)*100; //use noise to affect the growing trend(slope) of falling lines
    y2 = y1 + noise(height)*100+20; //+20 could make it more falling down
    a = random(50, 100);
  }

  void drawMe() {
    noFill();
    strokeWeight(1.5);
    stroke(random(0, 190), random(0, 140), random(0, 30), a); //colors of fall
    line(x1, y1, x2, y2);
  }

  //new line will begin from the middle of last line
  //use noise & random functions to make a continuous growing trend(slope) of falling lines
  void updateMe() {
    xmov1 = x2 - x1;
    ymov1 = y2 - y1;
    xmov2 = random(x2-x1) + 5;
    ymov2 = noise(x2-x1)*50;
    x1 += xmov1/2;
    y1 += ymov1/2;
    x2 += xmov2/2+noise(x2-x1)*8;
    y2 += ymov2/2+noise(x2-x1)*100;

    //this painting want to measure the specific distance(350~400) of falling lines
    //drawing ellipses means measure the distance
    //the visualization of "measure", ie ellipses, is the patterns result from emergence 
    boolean touching = false;
    for (int i=0; i<_lineArr.length; i++) {
      Line otherLin = _lineArr[i];
      if (otherLin != this) {
        float dis1 = dist(x2, y2, otherLin.x2, otherLin.y2);
        if (400 > dis1 && dis1 > 350) {
          strokeWeight(1);
          stroke(255, 255, 200, 80);
          float midx = (x2 + otherLin.x2)/2;
          float midy = (y2 + otherLin.y2)/2;
          ellipse(midx, midy, (otherLin.x2 - x2), (otherLin.y2 - y2));
        }
      }
    }

    drawMe();
  }
}



