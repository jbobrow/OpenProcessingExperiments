
class Doorbell {
  // Location and size
  float x;
  float y;
  float r;
  Sample dingdong;
  
  // Create the doorbell
  Doorbell(float x_, float y_, float r_, String filename) {
    x = x_;
    y = y_;
    r = r_;
    dingdong = new Sample(filename);
  }
  
  void ring() {
    if(!dingdong.isPlaying()) {
      dingdong.play();
    }
  }
  
  boolean contains(float mx, float my) {
    if(dist(mx, my, x, y) < r) {
      return true;
    } else {
      return false;
    }
  }
  
  void display(float mx, float my) {
    if (contains(mx, my)) {
      fill(200, 100, 150);
    } else {
      fill(175);
    }
    stroke(0);
    ellipse(x, y, r, r);
  }
  
  void jiggle() {
    if(dingdong.isPlaying()) {
      x += random(-2, 2);
      y += random(-2, 2);
      r = constrain(r + random(-2, 2), 10, 100);
    }
  }
}


