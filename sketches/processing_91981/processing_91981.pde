
//Adrianne Born
//03 March 2013
//Loops & Repetition

void setup() {
  size(500, 500);
  background(240, 22, 22);
}

void draw() {
  fill (184, 255, 67, 67);

  for (int x=70; x<width; x+=200) {
    for (int y=50; y<height; y+=100) {
      ellipse(y, x, mouseX, mouseY);
    }
  }
}



