
void setup(){
  size (800,800);
  background (255);
  smooth ();
}

void draw() {
  stroke (34);
  line (pmouseX,pmouseY,mouseX, mouseY);
}
