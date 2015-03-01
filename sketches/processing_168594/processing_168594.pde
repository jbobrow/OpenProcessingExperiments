
void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  //Surrounding ellipses
  fill(255, 255, 0);
  noStroke();
  ellipse(120, 120, 8, 8);
  ellipse(280, 120, 8, 8);
  ellipse(200, 280, 8, 8);
  //Grid
  Grid grid = new Grid();
  translate(200, 200);
  rotate(millis()/1000.0);
  grid.draw();
  //Center Ellipse
  if ((frameCount/20) % 2 == 0) {
    noStroke();
    fill(100, 255, 100);
    ellipse(-7, -7, 8, 8);
  }
}

class Grid {
  Grid() {
  }

  void draw() {
    stroke(0, 0, 255);
    for (int x=-140; x<140; x=x+40) {
      for (int y=-140; y<140; y=y+40) {
        line(x, y+13, x+26, y+13);
        line(x+13, y, x+13, y+26);
      }
    }
  }
}

