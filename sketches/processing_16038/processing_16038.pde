
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
    noStroke();
    ellipse (x, y, 200, 200);
    stroke(0);
    strokeWeight(4);
    line(x, y , 60 * cos((h + m/60.0) % 12 * TWO_PI/12 - HALF_PI) + x, 60 * sin((h + m/60.0) % 12 * TWO_PI/12 - HALF_PI) + y);
    strokeWeight(2);
    line(x, y , 80 * cos((m + s/60.0) * TWO_PI/60 - HALF_PI) + x, 80 * sin((m + s/60.0) * TWO_PI/60 - HALF_PI) + y);
    strokeWeight(1);
    line(x, y , 90 * cos(s * TWO_PI/60 - HALF_PI) + x, 90 * sin(s * TWO_PI/60 - HALF_PI) + y);
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
