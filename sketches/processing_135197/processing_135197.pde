
int aumenta = 0;
void setup() {
  noCursor();
  size(600, 600);
  strokeWeight(4);
}
void draw() {
  background(aumenta);
  stroke(255,0,0);
  line(0,0,mouseX,mouseY);
  stroke(193,142,12);
  line(width,0,mouseX,mouseY);
  stroke(23,106,101);
  line(width/2,height,mouseX,mouseY);
}
