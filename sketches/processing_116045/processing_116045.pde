
//magnetic field moved by mouse

Linear l = new Linear();

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255);
  stroke(200);
  l.all();
}

class Linear {

  Linear() {
    //nothing
  }

  void all() {
    for (int x =0; x < width; x += 20) {
      for (int y = 0; y < height; y += 20) {
        if (dist(mouseX, mouseY, x, y+10) >= 45) {
          stroke(0);
          line(x, y, x+map(dist(mouseX, mouseY, x, y), 0, sqrt(sq(width)+sq(height)), 0, 40), y+10);
        }
      }
    }
  }
}


