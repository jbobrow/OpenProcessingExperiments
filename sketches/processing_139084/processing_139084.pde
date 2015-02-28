
  int h = 220;
  int s = 0;
  int b = 25;
  int h1 = 240;
  int s1 = 0;
  int b1 = 150;
  int h2 = 120;
  int s2 = 0;
  int b2 = 180;
  int numCircles = 50;
  float ranDraw = random(1);
  Walker[] walkers = new Walker[numCircles];
  
void setup() {
  size(700,400);
  smooth();
  background(10);
  
  for (int i = 0; i <= numCircles; i++) {
      walkers[i] = new Walker(random(0,20), random(height/2,height*2), random(45,95), i, walkers);
  }
}

void draw() {
  for (int i = 0; i <= numCircles; i++) {
   // walkers[i].collide();
    walkers[i].step();
    walkers[i].display();
    s+= .009;
    s1+= .009;
    s2+= .009;
  }
}


class Walker {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int rx = random(8,95);
  int id;
  Walker[] others;

  
  Walker(float xin, float yin, float din, int idin, Walker[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }
  
void collide() {
    for (int i = id + 1; i < numCircles; i++) {
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
  
  void step() {
    x += vx;
    y += vy;    
    float r = random(1);
    
  if (r < 0.3) {
      vx+=random(.2);
    } else if (r < 0.6) {
      vx-=random(.2);
    } else if (r < 0.8) {
      vy+=random(.2);
    } else {
      vy-=random(.2);
    }
}

  void display() { 
  if (diameter < 25) {
      colorMode(HSB);
      stroke(h, s, b, 90);
      fill(80);
      strokeWeight(2);
      ellipse(x,y,diameter,diameter);
    }
    else if (diameter < 65) {
      colorMode(HSB);
      stroke(h2, s2, b2, 90);
      //fill(120, 48, 200);
      fill(220);
      strokeWeight(2);
      ellipse(x,y,diameter,diameter);
    }
    else {
      colorMode(HSB);
      stroke(h1, s1, b1, 90);
      fill(20);
      strokeWeight(2);
      ellipse(x,y,diameter,diameter);
  }
  }
  
}


