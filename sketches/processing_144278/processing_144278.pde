
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Joo Yong Gill
// ID: 201420108

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
PFont font;

DigitalClock digitalClock;

void setup() {
  size(600, 600);
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  digitalClock = new DigitalClock(60, width/2, height/2+15);
  cx = width / 2;
  cy = height / 2;
  font = createFont("BanglaMN-Bold", 50);
}

void draw() {

  background(255);
  fill(255);
  ellipse(width/2, 250, 600, 500);
  strokeWeight(3);
  line(209, 434, 401, 434);
  line(240, 407, 266, 462);
  line(301, 405, 326, 459);
  line(351, 404, 373, 456);

  digitalClock.getTime();
  digitalClock.display();
  stroke(0);
  strokeWeight(1);

  noStroke();
  stroke(0);
  strokeWeight(3);
  fill(5, 61, 255); 
  rect(100, 100, hour()*5, hour()*5);
  fill(5, 255, 123); 
  rect(400, 100, minute()*4, minute()*4);
  fill(255, 5, 22);
  stroke(0);
  strokeWeight(2);
  ellipse(300, 300, second()*3, second()*3);
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
    textFont(font);
    textSize(fontSize);
    textAlign(CENTER);
    fill(89, 7, 234); 
    text(hour() + " : " + minute() + " : " + second(), x+10, y+250);
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

