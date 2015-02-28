
int pm = 1000;
PIT[] pit; 

void setup() {
  size(400,400, P3D);
  smooth();
  strokeWeight(3);
  stroke(0,255,230);
  pit = new PIT[pm];
  for (int i = 0; i < pm; i++) {
    pit[i] = new PIT(random(0, width), random(0, height), random(-5, 5), random(-5, 5));
  }
}

void draw() {
  
  background(255);
  
  for (int i = 0; i < pm; i++) {
    pit[i].moved();
  }
}

class PIT {
  float pox;
  float poy;
  float speedx;
  float speedy;
  float gravity;

  PIT(float x, float y, float sx, float sy) {
    pox = x;
    poy = y;
    speedx = sx;
    speedy = sy;
  }
  void moved() {
    
    gravity = gravity + 0.05;
    
    if(gravity > 20){
      gravity = 0;
    }
    
    pox = pox + speedx;
    poy = poy + speedy + gravity;
    
   // println(gravity);
    
    if(pox > width){
      pox = -speedx;
    }
    if(poy > height){
      poy = -speedx;
    }
    
    point(pox,poy);
  }
}


