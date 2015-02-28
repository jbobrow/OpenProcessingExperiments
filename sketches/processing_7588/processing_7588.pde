
class Ball {
  float x, y; 
  float diameter;
  float vx = 0;
  float vy = 0;
  
  Ball(float borderL, float borderR, float maxDiameter) {
    diameter = random(minDiameter, maxDiameter);
    x = random(borderL, borderR);
    y = -diameter/2;
  }
  
  void update(float gravity) {
      vy += gravity;
      x += vx;
      y += vy;
  }
  
  void border(float borderL, float borderR, float friction) {
    if (x + diameter/2 > borderR) {
      x = borderR - diameter/2;
      vx *= -friction;
    }
    if (x - diameter/2 < borderL) {
      x = borderL + diameter/2;
      vx *= -friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= -friction;
    }
  }

  void collide(float spring, Ball others) { 
    float dx = others.x - x;
    float dy = others.y - y;
    float distance = sqrt(dx * dx + dy * dy);
    float minDistance = others.diameter/2 + diameter/2;
    if (distance <= minDistance) {
      float angle = atan2(dy, dx);
      float targetX = x + cos(angle)*minDistance;
      float targetY = y + sin(angle)*minDistance;
      float ax = (targetX - others.x)*spring;
      float ay = (targetY - others.y)*spring;
      vx -= ax;
      vy -= ay;
      others.vx += ax;
      others.vy += ay;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
  
}

