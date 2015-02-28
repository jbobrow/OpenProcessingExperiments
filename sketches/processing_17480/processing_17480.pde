
AnalogClock analogClock;
DigitalClock digitalClock;
 
void setup() {
  size(320, 240);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
  digitalClock = new DigitalClock(40, width/2, height/2+15);
}
 
void draw() {
  background(204);
  analogClock.getTime();
  analogClock.displayAna();
  digitalClock.getTime();
  digitalClock.displayDig();
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
   
  void displayAna() {
    //盤
    noStroke();
    fill(255);
    ellipse (x, y, 200, 200);
    //針の色
    stroke(204);
    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate((h + 1 + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(4);
    line(0, 0, 0, -60);
    popMatrix();
    //分・秒
    pushMatrix();
    translate(width/2, height/2);
    strokeWeight(2);
    line(0, 0, 0, -80);
    strokeWeight(1);
    line(0, 0, 0, -90);
    popMatrix();
  }
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
   
  void displayDig() {
    textSize(fontSize);
    textAlign(CENTER);
    fill(0);
    text ("- " + nf((60 - m), 2) + "'" + nf((60 - s), 2) + " = ?", x, y);
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
