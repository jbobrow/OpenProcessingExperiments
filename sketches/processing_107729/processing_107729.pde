
int howMany = 100;
ExLine [] Elem = new ExLine[howMany];

void setup() {
  size(400, 200);
  background(255);
  stroke(0);
  strokeWeight(1);
  float x = 0;
  float theta = 0;
  for (int i = 0; i < Elem.length; i++) {
    x += width/howMany;
    Elem[i]= new ExLine(x, theta);
    theta += PI/howMany;
  }
}

void draw() {
  background(255);
  for (int i = 0; i < Elem.length; i++) {
    Elem[i].display();
  }
}
class ExLine {
  float x, y, y2, y3;
  float rad, theta;

  ExLine(float _x, float _theta) {
    x = _x;
    y = height;
    y2 = y - 50;
    rad = 100;
    theta = _theta;
  }

  void display() {
    line(x, y, x, y2);
    line(x, y2, x, y3);

    y3 = y2 - map(sin(theta), -1, 1, 0, 1) * rad;

    theta += .06;
  }
}
