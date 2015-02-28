
class Ball {
  PVector pos; PVector speed;
  float r;
  
  Ball(PVector pos_, PVector speed_, float r_) {
    pos = pos_;
    speed = speed_;
    r = r_;
  }
  
  void display() {
    ellipse(pos.x, pos.y, r, r);
  }
  
  void displace() {
    pos = PVector.add(pos, speed);
  }
}

