
Particle[] particles;

void setup() {
  size(500, 500);
  
  particles = new Particle[(width / 10) * (height / 10)];
  
  int cur = 0;
  for(int x = 0; x < (width / 10); x ++) {
    for(int y = 0; y < (height / 10); y ++) {
      particles[cur] = new Particle(5 + x * 10, 5 + y * 10);
      cur ++;
    }
  }
  
  colorMode(HSB, 100, 100, 100, 100);
}

void draw() {
  background(0);
  
  for(int i = 0; i < particles.length; i ++) {
    particles[i].update();
    particles[i].display();
  }
}

class Particle {
  PVector loc;
  PVector vel;
  
  Particle(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
  }
  
  void update() {
    PVector acc = new PVector(0, 0);
    
    if(mousePressed) {
      PVector tow = new PVector(mouseX, mouseY);
      PVector dir = PVector.sub(tow, loc);
      
      dir.normalize();
      dir.mult(2);
      acc = dir;
    }
    
    vel.add(acc);
    vel.limit(20);
    vel.mult(0.99);
    
    loc.add(vel);
  }
  
  void display() {
    if(loc.x > 0 && loc.x < width && loc.y > 0 && loc.y < height) {
      stroke((millis() / 100) % 100, random(50, 80), random(40, 90));
      point(loc.x, loc.y);
    }
  }
}
