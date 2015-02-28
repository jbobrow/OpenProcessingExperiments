
Spot sp;
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  sp = new Spot();
  sp.x = 133;
  sp.y = 150;
  sp.diameter = 130;
}

void draw() {
  background(0);
  sp.display();
}

class Spot {
  float x, y, diameter;
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}

