
void setup() {
  size(763, 960);
  background(#6572b2);
  smooth();
}

void draw_grid() {
  noFill();
  background(#6572b2);
  float incr = 50;
  for (float x=5+ incr/2; x < width; x +=incr) {
    for (float y =5+ incr/2; y < height; y += incr) {
      if (random(20)>18) {
        strokeWeight(8);
        stroke(255);
      } 
      else {
        strokeWeight(2);
        stroke(#8591CC);
      }
      ellipse(x, y, incr-10, incr-10);
    }
  }

  if (keyPressed == 's') {
    save(random(1000000) + ".png");
  }
}

void draw() {
}

void mousePressed() {
  draw_grid();
}
