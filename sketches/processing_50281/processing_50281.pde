
class Ball {

  float x, y;
  float mx, my;
  color c;

  //Constructor
  Ball() {
    x = random(width);
    y = random(height);
    mx = random(-10, 10);
    my = random(-10, 10);
    c = color(random(255), random(255), random (255));
  }

  void move() {
    x += mx;
    y += my;
    //check to see if it is past the screen...
    //|| means "or"
    if (x > width || x < 0) {
      mx *= -1;
    }
    if (y > height || y < 0) {
      my *= -1;
    }
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, 30, 30);
  }
}

