
// snow
// grass
ArrayList<Flake> snow = new ArrayList<Flake>();
ArrayList<Wave> waves = new ArrayList<Wave>();
float noisex, noisey;

boolean flag = false;


void setup() {
  size(440,440);
  smooth();
}



void draw() {
  background(40);
  for(int i = snow.size()-1; i >= 0; i--) {
    Flake f = snow.get(i);
    f.update();
    f.draw();
    if(f.pos.y > height) snow.remove(i);
  }
  for(Wave w : waves) {
    w.update();
    w.draw();
  }
  if(random(1.0) < 0.9) {
  Flake f = new Flake();
  f.pos = new PVector(random(width), 0);
  if(random(1) < 0.3) {f.flag = false; f.siz = 2.0;}
  snow.add(f);
  }
}


void mousePressed() {
  Wave w = new Wave();
  w.pos = new PVector(mouseX, mouseY);
  waves.add(w);
}



class Flake {
  PVector pos, vel, frc;
  float ff = random(3000);
  float siz = random(3.0,6.0);
  boolean flag = true;
  
  Flake() {
    pos = new PVector();
    vel = new PVector();
    frc = new PVector();
  }
  
  void update() {
    frc.y += 0.05;
    frc.x += 0.2*(2*noise(pos.y/2.0+ff)-1);
    vel.add(frc);
    vel.div(1.05);
    pos.add(vel);
    frc = new PVector();
    for(Wave w : waves) {
      if(abs(pos.dist(w.pos) - w.radius) < 5.0) {
        PVector d = pos.get();
        d.sub(w.pos);
        d.normalize();
        d.mult(min(2.0,800/pow(w.radius,2)));
//        d.mult(pow(siz/6.0,2));
        if(flag) frc.add(d);
      }
    }
  }
  
  void draw() {
    stroke(255,100);
    strokeWeight(siz);
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
