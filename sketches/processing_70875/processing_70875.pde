
import processing.pdf.*;

color c1;
color c2;

void setup() {
  size(500, 500);
  //size(500, 500);
  background(0);
  smooth();
  noStroke();
  c1 = color(255);
  c2 = color(255, 0, 0);
}

void draw() {
  int x = 0;
  for (int h = 80; h > 0; h -= 10) {
    for (int i = 100; i < 500; i+=100) {
      for (int j = 100; j < 500; j+=100) {
        float hFloat = h+0.0;
        if ((hFloat/10)%2 == 0) {
          fill(c2);
          x = 1;
        }
        else {
          fill(c1);
          x = 0;
        }

        //        fill(255, 0, 0);
        ellipse(i, j, h, h);
      }
    }
  }

}


