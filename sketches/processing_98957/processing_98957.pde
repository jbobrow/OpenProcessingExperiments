
Line un = new Line(10, 10);

void setup() {
  size(1820, 900);
}

void draw() {
  background(75);
  un.display();
}

class Line {
  float x;
  float y;
  float incrementer;
  float e;
  float movey ;
  Line(float firstx, float firsty) {
    x=0;
    y=400;
  }

  void display() {
    fill(10);
    for (int i=20; i<1800; i+=60) {
      e+=.1;
        rect(x+i, y+sin(e)*200, 20, 100);
      
    }
  }
}



