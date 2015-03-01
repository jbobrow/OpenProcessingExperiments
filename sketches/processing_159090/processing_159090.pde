
class Line {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector location2;
  float topspeed;
  color h, s, b;
  float sw;

  Line(float x, float y, color _h, color _s, color _b, float _sw) {
    h = _h;
    s = _s;
    b = _b;
    location = new PVector (x, y);
    velocity = new PVector(0, 5);
    topspeed = 20;
    sw =_sw;
  }

  void update() {
    PVector attractPoint = new PVector(random(0,width), random(0,height));
    acceleration = PVector.sub(attractPoint, location);

    // Set magnitude of acceleration
    acceleration.setMag(0.1);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    strokeWeight(sw);
    stroke(h, s, b, 20);
    PVector leng = new PVector(1, 0);
    location2 = PVector.add(location, leng);
    line(location.x, location.y, location2.x, location2.y);
  }
}


