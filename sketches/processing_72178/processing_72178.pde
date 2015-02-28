
class Ball {
  color c;
  float x;
  float y;
  float xvelocity;
  float yvelocity;
  float radiusBall;

  float dx = random (-1, 1);
  float dy = random (-1, 1);


  Ball () {
    c = (255);
    x = 100;
    y = 50;

    xvelocity = random (-6, 6);
    yvelocity = random (-6, 6);
  }

  void display () {
    ellipseMode (CENTER);
    noStroke();
    fill (c);
    ellipse (x, y, 5, 5);
  }

  void drive () {

    x += xvelocity;
    y += yvelocity;


    float r = radiusBall/2;

    if (x <= r || x >= width - r) {
      xvelocity = -xvelocity;
    }

    if (y <= r || y >= height - r) {
      yvelocity = -yvelocity;
    }
  }
}


