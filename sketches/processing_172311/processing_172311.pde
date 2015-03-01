
Spot sp1, sp2, sp3;
void setup() {
size(300, 300);
background (211, 178, 232);
smooth();
noLoop();
// Run the constructor without parameters
sp1 = new Spot();
// Run the constructor with three parameters
sp2 = new Spot(66, 50, 20);
sp3 = new Spot (150, 160, 50, #CEE8B2);
}
void draw() {
sp1.display();
sp2.display();
sp3.display ();
}
class Spot {
float x, y, radius;
int clr;
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

Spot (float xpos, float ypos, float r, int c) {
  x= xpos;
  y = ypos;
  radius = r;
  clr = c;
}
void display() {
  fill (clr);
  noStroke ();
ellipse(x, y, radius*2, radius*2);

}

}




