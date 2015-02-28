
DigitalClock digitalClock;
 
void setup() {
  size(600, 600);
  smooth();
  digitalClock = new DigitalClock(40, width/2, height/2+15);
}
 
void draw() {
  background(255);
  fill(255);
  ellipse(width/2, height/2, 300, 300);
  //秒針
  pushMatrix();
  strokeWeight(2);
  line(width/2, height/2, width/2-35, 420);
  popMatrix();
  //分針
  pushMatrix();
  strokeWeight(5);
  line(width/2, height/2, width/2+90, 260);
  popMatrix();
  //時針
  pushMatrix();
  strokeWeight(10);
  line(width/2, height/2, width/2-60, 270);
  popMatrix();
  digitalClock.getTime();
  digitalClock.display();
  //save("0812033.png");
}
 
class DigitalClock extends Clock {
  int fontSize;
  float x, y;
 
  DigitalClock(int _fontSize, float _x, float _y) {
    fontSize = _fontSize;
    x = _x;
    y = _y;
  }
 
  void getTime() {
    super.getTime();
  }
 
  void display() {
    //文字設定
    PFont myFont = loadFont("BodoniSvtyTwoITCTT-Bold-48.vlw");
    textFont(myFont);
    textSize(40);
    textAlign(CENTER);
    //秒
    pushMatrix();
    fill(0);
    String t = nf(s, 2);
    text (t, width/2-50, 505);
    popMatrix();
    //分
    pushMatrix();
    String u = nf(m, 2);
    text (u, width/2+180, 230);
    popMatrix();
    //時
    pushMatrix();
    String v = nf(h, 2);
    text (v, width/2-180, 230);
    popMatrix();
  }
}
 
class Clock {
  int h, m, s;
  Clock() {
  }
    
  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}

