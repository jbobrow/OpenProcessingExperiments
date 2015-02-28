
// snow
// grass
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Wave> waves = new ArrayList<Wave>();
float noisex, noisey;

boolean flag = false;


void setup() {
  size(440,440);
  smooth();
  for(int i = 0; i < 800; i++) {
    Star s = new Star();
    stars.add(s);
  }
}



void draw() {
  background(20);
  for(int i = stars.size()-1; i >= 0; i--) {
    Star s = stars.get(i);
    s.update();
    s.draw();
  }
  for(Wave w : waves) {
    w.update();
    w.draw();
  }
}


void mousePressed() {
  Wave w = new Wave();
  w.pos = new PVector(mouseX, mouseY);
  waves.add(w);
}



class Star {
  PVector pos;
  float ff = random(3000);
  float siz = random(1.0,2.0);
  boolean flag = true;
  float brightness = 50.0;
  float shine = 0.0;
  
  Star() {
    pos = new PVector(random(width), random(height));
  }
  
  void update() {
    ff+=0.1;
    shine*=0.9;
    brightness = 50.0 + shine + 100*noise(ff);
    for(Wave w : waves) {
      if(abs(pos.dist(w.pos) - w.radius) < 2.0) {
        shine = min(100.0, 6000.0/w.radius);
//        shine = 100.0;
      }
    }
  }
  
  void draw() {
    stroke(255,brightness);
    strokeWeight(siz+2*shine/100.0);
    point(pos.x, pos.y);
  }
  
};





class Wave {
  PVector pos = new PVector();
  float radius = 0.0;
  
  Wave() {};
  
  void update() {
    radius += 2.0;
  }
  
  void draw() {
    noFill();
    float a = 255;
    a = 10/radius;
    a = max(0,a);
    a = min(a,1.0);
    a *= 200.0;
    stroke(255,a);
    stroke(100,220,255,a);
    strokeWeight(8.0);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
};
