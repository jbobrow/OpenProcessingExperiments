
class Bouncer {
  private PVector loc;
  private PVector vel;
  private float size = 3;
  private float speed;
  
  Bouncer(PVector loc, float theta, float speed) {
    this.loc = loc;
    this.speed = speed;
    setTheta(theta);
  }

  void draw() {
    pushStyle();
    noStroke();
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, size, size);
    popStyle();
  }

  void update() {
    loc.add(vel);
    
    if (loc.x < 0 && vel.x < 0 || loc.x > width && vel.x > 0) {
      vel.x *= -1;
    }
    if (loc.y < 0 && vel.y < 0 || loc.y > height && vel.y > 0) {
      vel.y *= -1;
    }
  }
  
  float theta() {
    float rise = vel.y;
    float run = vel.x;
    float theta = atan(rise / run);
    
    if (run < 0) {
      theta += PI;
    }
    
    return theta;
  }
  
  void setTheta(float theta) {
    this.vel = new PVector(cos(theta) * this.speed, sin(theta) * this.speed);   
  }
}

