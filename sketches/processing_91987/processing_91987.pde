
//Adrianne Born
//03 March 2013
//Loops & Repetition

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  fill (random(245), random(67), random(236));

  for (int x=70; x<width; x+=200) {
    for (int y=50; y<height; y+=100) {
      noStroke();
      ellipse(y, x, mouseX, mouseY);
    }
  }
}


