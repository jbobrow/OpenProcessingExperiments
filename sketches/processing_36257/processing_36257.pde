
class Particle {
  float x;
  float y;
  float vx;
  float vy;
  float randy = random(255);
  float nispe = random(10);
  float mx = mouseX;
  float my = mouseY;
   
  Particle() {
    x = 5;
    y = 5;
    nispe =0;
  }
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  
  //partset
  
  void update(int num) {
    vx *= 0.90;
    vy *= 0.90;
    for (int i = particleCount; i >= 0; i--) {
      if (i != num) {
        boolean drawthis = false;
        Particle particle = (Particle) particles[i];
        float tx = particle.getx();
        float ty = particle.gety();
        //float tx = mouseX;
        //float ty = mouseY;
        float radius = dist(x,y,tx,ty);
        if (radius < 65) {
          drawthis = true;
          float angle = atan2(y-ty,x-tx);
          if (radius < 25) {
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
    
    //Mouse
    
    if (mousePressed) {
      float tx = mouseX;
      float ty = mouseY;
      float radius = dist(x,y,tx,ty);
      if (radius < 50) {
        float angle = atan2(ty-y,tx-x);
        if (mouseButton == LEFT) {
          vx += radius * 0.99* cos(angle);
          vy += radius * 0.99 * sin(angle);
          stroke(radius * 4,0,0);
        }
        if (mouseButton == RIGHT) {
          vx -= radius * 0.99* cos(angle);
          vy = radius * 0.99 * sin(angle);
          stroke(radius * 4,0,0);
        }
      }
    } 
    
    //Border Patrol
    
    int px = (int)x;
    int py = (int)y;
    x += vx;
    y += vy;
    if (x > width +100) {
      if (abs(vx) == vx) vx *= -1.0;
      x = width +100;
    }
    if (x < 0) {
      if (abs(vx) != vx) vx *= -1.0;
      x = 0;
    }
    if (y < 0) {
      if (abs(vy) != vy) vy *= -1.0;
      y = 0;
    }
    if (y > height) {
      if (abs(vy) == vy) vy *= -1.0;
      vx *= 0.6;
      y = height;
    }
      strokeWeight(2);
      stroke (255);
      fill(255);
      //rect(px,py,1,1);
      ellipse(px,py,1,1);
    }
  }

