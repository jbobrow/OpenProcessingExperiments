
class Ball {

  float x, y;
  float s;
  color c;

  Ball(float mx, float my) {
    x=random(width);
    y=random(height);
    c=color(random(255), random(255), random(255));
  }

  void update() { 
    s++;
  }

  void display() {
    noStroke();
    fill(c, 100-s);
    ellipse(x, y, s, s);
  }
}


