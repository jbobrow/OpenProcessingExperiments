
void setup() {
  size(500, 500);
  background(0) ;
}

void draw() {
  ellipse(250, 250, 300, 300);
  for (int i=0;i<=12;i++) {
    translate(100,0);
    rotate(radians(30));
    quad(0, 0, -10, 40, 30, 40, 20, 0);
  }
}








