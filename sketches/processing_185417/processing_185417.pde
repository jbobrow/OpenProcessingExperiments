
void setup () {
  size(600, 600);
  }
  void draw(){
    if (mousePressed) {
      fill(0);
ellipse (mouseX, mouseY, 10, 10);
fill (0);
stroke (0);
}

  if (!mousePressed) {
      fill(0);
ellipse (mouseX, mouseY, 20, 20);
fill (0);
stroke (0);
}

}
