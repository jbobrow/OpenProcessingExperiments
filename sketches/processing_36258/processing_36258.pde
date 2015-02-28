
class Particle {
 
  float x;
  float y;
  float particleX;
  float particleY;
  float randy = random(255);
  float mx = mouseX;
  float my = mouseY;
   
  Particle() {
    x = 5;
    y = 5;
   
  }
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  
  //partset
  
  void update(int num) {
    particleX *= 0.90;
    particleY *= 0.90;
    for (int partC = particleCount; partC >= 0; partC--) {
      if (partC != num) {
        boolean drawthis = false;
        Particle particle = (Particle) particles[partC];
        float mousePosX = particle.getx();
        float mousePosY = particle.gety();
        //float tx = mouseX;
        //float ty = mouseY;
        float radius = dist(x,y,mousePosX,mousePosY);
        if (radius < 32) {
          drawthis = true;
          float angle = atan2(y-mousePosY,x-mousePosX);
          if (radius < 45) {
            particleX += (25 - radius) * 0.07 * cos(angle);
            particleY += (25 - radius) * 0.07 * sin(angle);
          }
          if (radius > 40) {
            particleX -= (25 - radius) * 0.02 * cos(angle);
            particleY -= (25 - radius) * 0.02 * sin(angle);
          }
        }
      }
    }
    
//Mouse functions//
    boolean mousePressed = true;
    if (mousePressed) {
      float mousePosX = mouseX;
      float mousePosY = mouseY;
      float radius = dist(x,y,mousePosX,mousePosY);
      if (radius < 2000) {
        float angle = atan2(mousePosY-y,mousePosX-x);
        if (mouseButton == LEFT) {
          particleX += radius * 0.0008* cos(angle);
          particleY += radius * 0.0008* sin(angle);
          stroke(radius * 4,0,0);
        }
       if (mouseButton == RIGHT || mousePressed == false) {
        if (radius < 32) {
          if (radius < 100) {
            particleX += (25 - radius) * 0.07 * cos(angle);
            particleY += (25 - radius) * 0.07 * sin(angle);
          }
          if (radius > 40) {
            particleX -= (25 - radius) * 0.02 * cos(angle);
            particleY -= (25 - radius) * 0.02* sin(angle);
        }
      }
    } 
    
//if statements for borders//
    
    int posX = (int)x;
    int posY = (int)y;
    x += particleX;
    y += particleY;
    if (x > width) {
      if (abs(particleX) == particleX) particleX *= -1.0;
      x = width;
      //stroke(255,0,0);
    }
    if (x < 0) {
      if (abs(particleX) != particleX) particleX *= -1.0;
      x = 0;
      //stroke(0,255,0);
    }
    if (y < 0) {
      if (abs(particleY) != particleY) particleY *= -1.0;
      y = 0;
      //stroke(0,0,255);
    }
    if (y > height) {
      if (abs(particleY) == particleY) particleY *= -1.0;
      particleX *= 0.6;
      y = height;
    }
      strokeWeight(2);
      stroke (255);
      fill(255);
      ellipse(posX,posY,1,1);
      }
    }
  }
}

