
void setup() {
  size (420,120);
  strokeWeight(3);
  smooth ();
}
void draw () {
stroke (255);
line (100,60,mouseX,mouseY);
stroke (0);
line(300,60,mouseX,mouseY);
stroke (100);
line(210,60,mouseX,mouseY);
}

