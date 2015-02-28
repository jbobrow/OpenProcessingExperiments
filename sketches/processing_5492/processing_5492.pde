
class Ball {
  int numBalls; 
  float borderL, borderR;
  float x, y; 
  float diameter; 
  float vx = 0; 
  float vy = 0; 
  int id; 
  Ball[] others;
  boolean fall;
  boolean gen;
  
  Ball(int numin, int numBallsin, float din, int idin, Ball[] oin) { 
    borderL = (numin-1)*width/3;
    borderR = numin*width/3;
    numBalls = numBallsin; 
    diameter = din; 
    id = idin; 
    others = oin;
    fall = false; 
    gen = false;
  }
  
  void genesis() { 
    x = random(borderL, borderR); 
    y = height/3;
    gen = true;
  }
  
  void fall() {
    fall = true;
  }
    
  void collide() {
    if(gen) {
      for (int i = id + 1; i < numBalls; i++) { 
        float dx = others[i].x - x; 
        float dy = others[i].y - y; 
        float distance = sqrt(dx*dx + dy*dy); 
        float minDist = others[i].diameter/2 + diameter/2; 
        if (distance < minDist) {  
          float angle = atan2(dy, dx); 
          float targetX = x + cos(angle) * minDist; 
          float targetY = y + sin(angle) * minDist; 
          float ax = (targetX - others[i].x) * spring; 
          float ay = (targetY - others[i].y) * spring; 
          vx -= ax; 
          vy -= ay;
          others[i].vx += ax; 
          others[i].vy += ay; 
        } 
      } 
    }
  } 
   
  void move() {
    if(gen) {
      vy += gravity;
      x += vx; 
      y += vy; 
      if (x + diameter/2 > borderR) { 
        x = borderR - diameter/2; 
        vx *= friction;  
      } 
      if (x - diameter/2 < borderL) { 
        x = borderL + diameter/2; 
        vx *= friction; 
      } 
      if (y + diameter/2 > height) { 
        y = height - diameter/2; 
        vy *= friction;  
      }
      if(fall== false) {
        if (y - diameter/2 < 0) { 
          y = diameter/2; 
          vy *= friction; 
        }
      } 
    }
  } 
   
  void display() { 
    if(gen) {
      if(borderL==0)
      {
        fill(0,0,0);
      }
      else
      {
        if(id==9 || id==19 || id==29 || id==39 || id==49) { 
          fill(0,0,255);
        }
        else fill(0,0,0);
      }
      ellipse(x, y, diameter, diameter);
    }
  }
}

