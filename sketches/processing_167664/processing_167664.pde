
void setup() {
  size(700, 500);
  smooth();
  strokeWeight(1);

}
void draw() {
    background(255);
  float a = 0.0;
  float b= map(mouseY,0,500,0,250);
  float inc = TWO_PI/25.0;
  for (int i = 0; i < 700; i=i+4) {
    stroke(171,74,85);
    line(i+mouseX/2,250, i, 250+sin(a)*b/1.5);
    stroke(203,102,39);
    line(i,250, i+mouseX/2, 250+sin(a)*b/1.5);
    a = a + inc;
  }
}



