
class Particle {
  float x,y;
  float vx = 0, vy = 0;
  float s = 5;
  float speedSq = 0;
    
  Particle(float xx, float yy) {
    x = xx;
    y = yy;
  }
  
  Particle(float xx, float yy, float vxx, float vyy) {
    x = xx;
    y = yy;
    vx = vxx;
    vy = vyy;
  }
  
  void update() {
    x += vx;
    y += vy;
    vx *= damping;
    vy *= damping; 
    speedSq = vx*vx + vy*vy;
    
    if (x < 0) {
      x = 0;
      vx = -vx;
    } else if (x > width) {
      x=width;
      vx = -vx;
    }
    
    if (y < 0) {
      y = 0;
      vy = -vy;
    } else if (y > height) {
      y=height;
      vy = -vy;
    }
   
  }
  
  void draw() {
    fill(0,0,1);
    ellipse(x,y,s,s);
  }
}

