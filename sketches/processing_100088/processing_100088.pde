
class Walker {
  float x, y;
  float t;
  float r;
  float hue;
  float alp;

  Walker(float x, float y) {
    this.x = x;
    this.y = y;
    this.t = random(TWO_PI);
    this.hue = random(30, 157);
    this.alp = random(50);
    this.r = random(1, 3);
  }

  void walk() {
    this.x += random(-1, 1);
    this.y += random(-1, 1);

    t += 0.1;

    if (this.x < 0) {
      this.x = width;
    }
    if (this.y < 0) {
      this.y = height;
    }
    if (this.x > width) {
      this.x = 0;
    }
    if (this.y > height) {
      this.y = 0;
    }
  }

  void draw() {
    pushMatrix();
    translate(x, y);

    strokeWeight(3);
    stroke(119, 100, 100, 1);
    line(0, 0, width/2-x, height/2-y);

    strokeWeight(2);
    stroke(hue, 100*abs(sin(t)), 100, alp-10);
    fill(hue, 100*abs(sin(t)), 100, alp);
    ellipse(0, 0, r, r);
    popMatrix();
  }
}


