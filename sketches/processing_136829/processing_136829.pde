
/* Reference organic (something with rules) to translate to 
   code
*/

  int h = 150;
  int s = 0;
  int b = 65;
  int numCircles = 40;
  Walker[] walkers = new Walker[numCircles];
  
void setup() {
  size(500,500);
  smooth();
  background(0);
  
  for (int i = 0; i <= numCircles; i++) {
    walkers[i] = new Walker(random(0,20), random(height/2,height*2), random(25,75), i, walkers);
}

}

void draw() {
  for (int i = 0; i <= numCircles; i++) {
   // walkers[i].collide();
    walkers[i].step();
    walkers[i].display();
    s+= 10;
  }

}

class Walker {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int rx = random(15,75);
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
    if (rx <= 45) {
      stroke(200, 90);
      fill(80, 100);
      strokeWeight(2);
      rect(x,y,diameter,diameter);
    }
    else {
      colorMode(HSB);
      stroke(h, s, b, 60);
      fill(s, 20);
      strokeWeight(2);
      rect(x,y,diameter,diameter);
  }
  }
  
}


