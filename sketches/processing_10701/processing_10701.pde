
class Particle {
  float x,y,xs,ys;
  boolean gravity;
  
  public Particle(int x, int y) {
    this.x = x;
    this.y = y;
    ys = random(-3, 1);
    xs = random(-3, 3);
    gravity=true;
  }
  
  void run() {
    x += xs;
    y += ys;
    if(y > height-5 && ys > 0) ys=ys*-0.8;
    if(x > width-5 && xs > 0) xs = xs*-0.8;
    else if(x < 5 && xs < 0) xs = xs*-0.8;
    if(ys > 485) {
      gravity=false;
      ys=0;
      y = 475;
    }
  }
  
  void gravity() {
    if(gravity)ys += 0.1;
    xs*=0.99999;
  }
  
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getXS() {
    return xs;
  }
  float getYS() {
    return ys;
  }
  
  void draw() {
    stroke(random(0,255),random(0,255),random(0,255));
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(x,y,15,15);
  }
}

