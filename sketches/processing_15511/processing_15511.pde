
class Ring {
  float x, y;
  float diameter;
  boolean on = false;
  float thickness;

  void start(float _x, float _y) {
    x = _x;
    y = _y;
    on = true;
    diameter = 1;
    thickness = 0.25;
  }

  void grow() {
    if (on == true) {
      thickness += 0.05;

      diameter += 30;
      if (diameter > 800) {
        on = false;
      }
    }
  }

  void display() {
    if (on == true) {
      noFill();
      strokeWeight(thickness);
      stroke(random(255),random(255), random(255));
      ellipse(x, y, diameter, diameter);
    }
  }
}


