
Spot sp1, sp2, sp3;

void setup() {
  size(320, 320);
  noLoop();
  noStroke();
  background(70);
  // Run the constructor without parameters
  sp1 = new Spot();
  // Run the constructor with three parameters
  sp2 = new Spot(66, 50, 20);
  sp3 = new Spot(166, 150, 80);
}

void draw() {
    fill(120,170,190);
    sp1.display();
    sp2.display();
    sp3.display();
}
class Spot {
float x, y, radius;
// First version of the Spot constructor;
// the fields are assigned default values
Spot() {
x = 33;
y = 50;
radius = 8;
}
// Second version of the Spot constructor;
// the fields are assigned with parameters
Spot(float xpos, float ypos, float r) {
x = xpos;
y = ypos;
radius = r;
}
void display() {
ellipse(x, y, radius*2, radius*2);
}
}


