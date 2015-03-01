
class Line {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector location2;
  float topspeed;
  color h, s, b;
  float sw;
  float theta;

  Line(float x, float y, color _h, color _s, color _b, float _sw) {
    h = _h;
    s = _s;
    b = _b;
    location = new PVector (x, y);
    velocity = new PVector(0, 0);
    topspeed = 25;
    sw =_sw;
    theta = 0;
  }

  void update() {
    //PVector center = new PVector(width/2, height/2);
    //acceleration = PVector.sub(center, location);
    PVector attractPoint = new PVector(width/2, height/2);
    //PVector atpVelocity = new PVector(random(-10, 10), random(-10, 10));
    PVector atpVelocity = new PVector(cos(theta)*300, sin(theta)*300);
    theta +=1;

    attractPoint.add(atpVelocity);
    acceleration = PVector.sub(attractPoint, location);

    // Set magnitude of acceleration
    acceleration.setMag(0.2);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    strokeWeight(sw);
    stroke(h, s, b, 40);
    PVector leng = new PVector(1, 0);
    location2 = PVector.add(location, leng);
    line(location.x, location.y, location2.x, location2.y);
  }
}


