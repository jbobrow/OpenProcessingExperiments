
int x = 20;
int y = 20;

void setup () {
  size (600, 600);
  smooth();
}

void draw () {
  background(0, 0, 20);

  for (int i=1; i<x; i++) {
    for ( int j=1; j<y; j++) {
      if (mousePressed == true) {
        fill(random(250), mouseX, mouseY);
      }
      ellipse ( i*(width/x), j*(height/y), 30, 30);
    }
  }
}
