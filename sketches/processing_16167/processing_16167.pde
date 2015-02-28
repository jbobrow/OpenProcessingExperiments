

AnalogClock analogClock;
 
void setup() {
  size(240, 240);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
}
 
void draw() {
  background(204);
  analogClock.getTime();
  analogClock.display();
}
 
class AnalogClock extends Clock {
  float x, y;
   
  AnalogClock(float _x, float _y) {
    x = _x;
    y = _y;
  }
   
  void getTime() {
    super.getTime();
  }
   
  void display() {
    //盤
    noStroke();
    fill(255);
    ellipse (x, y, 200, 200);
    //文字の設定
    fill(0);
    textAlign(CENTER);
    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    textSize(36);
    text(h, 0, -20);
    popMatrix();
    //分
    pushMatrix();
    translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    textSize(24);
    text(m, 0, -50);
    popMatrix();
    //秒
    pushMatrix();
    translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    textSize(18);
    text(s, 0, -80);
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

