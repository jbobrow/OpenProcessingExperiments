
/*
Konkuk University
SOS iDesign

Name: Gwang il Lee
ID: 201420094

*/
int cx, cy;
DigitalClock digitalClock;

void setup() {
size(600, 600);
int radius = min(width, height) / 2;
digitalClock = new DigitalClock(60, width/2, height/2+15);
cx = width / 2;
cy = height / 2;
}

void draw() {
  println(mouseX + " : " + mouseY);
background(255,0,0);

fill(0);
rectMode(CENTER);

rect(300,300,400,160);
fill(255);
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
