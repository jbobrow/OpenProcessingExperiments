
DigitalClock digitalClock;
 
void setup() {
  size(270, 270);
  digitalClock = new DigitalClock(60, width/2, height/2+15);
}
 
void draw() {
  background(0,0,0);
  digitalClock.getTime();
  digitalClock.display();
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
    textSize(fontSize);
    textAlign(CENTER);
    
    text (h + ":" + nf(m, 2) + ":" + nf(s, 2), x, y);
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


