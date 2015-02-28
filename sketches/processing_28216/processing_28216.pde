
class Particle {
  float x;
  float y;
  float vx;
  float vy;
  float randy = random(0,255);
  
  Particle() {
    x = 20;
    y = 20;
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
        Particle particle = (Particle) particles[i];
        float tx = particle.getx();
        float ty = particle.gety();
        float radius = dist(x,y,tx,ty);
        if (radius < 45) {
          drawthis = true;
          float angle = atan2(y-ty,x-tx);
          if (radius < 45) {
            vx += (25 - radius) * 0.07 * cos(angle);
            vy += (25 - radius) * 0.07 * sin(angle);
          }
          if (radius > 25) {
            vx -= (25 - radius) * 0.02 * cos(angle);
            vy -= (25 - radius) * 0.02* sin(angle);
          }
        }
      }
    }
    if (mousePressed) {
      float tx = mouseX;
      float ty = mouseY;
      float radius = dist(x,y,tx,ty);
      if (radius < 50) {
        float angle = atan2(ty-y,tx-x);
        if (mouseButton == LEFT) {
          vx -= radius * 0.14 * cos(angle);
          vy -= radius * 0.14 * sin(angle);
          stroke(radius * 4,0,0);
        }
        if (mouseButton == RIGHT) {
          vx += radius * 0.14 * cos(angle);
          vy += radius * 0.14 * sin(angle);
          stroke(radius * 4,0,0);
        }
        else {
          vx += radius * 1 * cos(angle);
          vy += radius * 1 * sin(angle);
          stroke(255);
        }
        if (lines) line (x,y,tx,ty);
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
      strokeWeight(2);
      stroke (randy,randy,randy,random(100,255));
      line(px,py,int(x),int(y));
    }
  }



