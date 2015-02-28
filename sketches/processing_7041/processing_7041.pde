
class Particle {
  float x,y;
  float targetx,targety;
  float currx, curry;
  float currFactor = 0.0;
  int r,g,b;
  
  Particle(float x1, float y1) {
    x = x1;
    y = y1;
    currx = x;
    curry = y;
    r = int(random(255));
    g = int(random(200));
    b = 80;
  }
  
  void setTarget(float tx, float ty) {
    if (randomize) {
      tx = random(gap)+tx-(gap/2);
      ty = random(gap)+ty-(gap/2);
    }
    targetx = tx;
    targety = ty;
  }
  
  void update() {
    float xpart = currFactor * x;
    float targetxpart = (1.0-currFactor)*targetx;
    
    currx =targetxpart + xpart;
    curry = (currFactor * y) + ((1.0 - currFactor) * targety);
    currFactor += segmentWeight;
    if (currFactor >= 1.0) {
      currFactor = 0;
    }
     
}

  
  void render() {
    stroke(r,g,b, particleOpacity);
    fill(r,g,b,particleOpacity);
    line(x,y,currx,curry);
  }
}


