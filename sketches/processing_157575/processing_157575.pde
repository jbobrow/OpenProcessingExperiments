
class Line {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector location2;
  float topspeed;
  color h,s,b,alpha;

  Line(float x, float y, color _h,color _s, color _b, color _alpha) {
    h = _h;
    s = _s;
    b = _b;
    alpha = _alpha;
    location = new PVector (x, y);
    velocity = new PVector(0, 0);
    topspeed = 30;
  }

  void update() {
    // Compute a vector that points from location to mouse
    PVector center = new PVector(width/2, height/2);
    acceleration = PVector.sub(center, location);
    // Set magnitude of acceleration
    acceleration.setMag(0.8);

    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    strokeWeight(1);
    stroke(h,s,b,alpha);
    PVector leng = new PVector(0.1,0);
    location2 = PVector.add(location, leng);
    line(location.x, location.y, location2.x, location2.y);
  }
}




