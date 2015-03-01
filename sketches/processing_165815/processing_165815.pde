
ArrayList blades = new ArrayList();

void setup() {
  size(640, 640);
  stroke(0, 100);
  for (int i = 0; i < 400; i++) {
    blades.add(new Blade(random(random(40, 70), random(80, 100))));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < blades.size (); i++) {
      Blade b = (Blade) blades.get(i);
      pushMatrix();
      translate(width/2+b.angle/4, height-100);
      rotate(radians(b.angle));
      b.branch(b.segments);
      popMatrix();
    }
}
class Blade {
  float segments, angle;
  float num;

  Blade(float segments) {
    this.segments = segments;
    angle = random(-70, 70);
  }

  void branch(float len) {
    len *= 0.79;
    float t = map(len, 1, segments, 1, 5);
    strokeWeight(t);
    line(0, 0, 0, -len);
    translate(0, -len);
    if (len > 5) {
      pushMatrix();
      rotate(radians(sin(len+num) * 15));
      branch(len);
      popMatrix();
    }
    /* Movement */
    //num+=0.001;
  }
}



