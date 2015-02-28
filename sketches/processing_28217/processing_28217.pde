
class Particle {
  float x;
  float y;
  float vx;
  float vy;
  float randy = random(0,255);
  Particle() {
    stroke(randy,randy,randy);
    strokeWeight(2);
    x = 10;
    y = 10;
  } 
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  void update(int num) {
    vx *= 0.90;
    vy *= 0.90;
    for (int i = particleCount; i >= 0; i--) {
      if (i != num) {
        boolean drawthis = false;
        float redshade = 0;
        float blueshade = 0;
        Particle particle = (Particle) particles[i];
        float tx = particle.getx();
        float ty = particle.gety();
        float radius = dist(x,y,tx,ty);
        if (radius < 45) {
          drawthis = true;
          float angle = atan2(y-ty,x-tx);
          if (radius < 45) {
            if (lines) {
              redshade = 13 * (30 - radius);
            }
            vx += (30 - radius) * 0.07 * cos(angle);
            vy += (30 - radius) * 0.07 * sin(angle);
          }
          if (radius > 25) {
            if (lines) {
              blueshade = 90 * (500 - radius);
            }
            vx -= (25 - radius) * 0.005 * cos(angle);
            vy -= (25 - radius) * 0.005 * sin(angle);
          }
        }
        if (lines) {
          if (drawthis) {
            stroke (redshade, 0, blueshade);
            line(x,y,tx,ty);
          }
        }
      }
    }  
    int px = (int)x;
    int py = (int)y;
    x += vx;
    y += vy;
    if (x > width-11) {
      if (abs(vx) == vx) vx *= -1.0;
      x = width-11;
    }
    if (x < 11) {
      if (abs(vx) != vx) vx *= -1.0;
      x = 11;
    }
    if (y < 11) {
      if (abs(vy) != vy) vy *= -1.0;
      y = 11;
    }
    if (y > height-11) {
      if (abs(vy) == vy) vy *= -1.0;
      vx *= 0.6;
      y = height-11;
    }
    if (!lines) {
      stroke (randy,randy,randy,random(100,255));
      line(px,py,int(x),int(y));
    }
  }
} 


