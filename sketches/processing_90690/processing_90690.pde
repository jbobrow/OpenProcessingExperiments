
Spot sp1, sp2, sp3;

void setup() {
  size(100, 100);
  smooth();
  noLoop();
  sp1 = new Spot();
  sp2 = new Spot(66, 50, 20);
  sp3 = new Spot(10);
}

void draw() {
sp1.display();
sp2.display();
sp3.display();
}

class Spot {
  float x, y, radius;
  
  Spot() {
  x = 33;
  y = 50;
  radius = 8;
  }

  Spot(float xpos, float ypos, float r) {
  x = xpos;
  y = ypos;
  radius = r;
  }
  
 Spot (float xyr) {
 x = y = radius = xyr;  
 }
   
void display() {
ellipse(x, y, radius*2, radius*2);
}
}


