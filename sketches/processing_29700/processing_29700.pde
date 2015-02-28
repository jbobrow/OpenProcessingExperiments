
ArrayList discos;

void setup() {
  size(640, 360);
  colorMode(RGB, 255, 255, 255, 100);
  discos = new ArrayList();
  smooth();
}

void draw() {
  background(#00070D);

  for (int i = discos.size()-1; i >= 0; i--) {
    CosaDisco psys = (CosaDisco) discos.get(i);
    psys.run();
    if (psys.dead()) {
      discos.remove(i);
    }
  }

}

void mousePressed() {
  discos.add(new CosaDisco(int(random(5,25)),new PVector(mouseX,mouseY)));
}
class Cosa {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  Cosa(PVector a, PVector v, PVector l, float r_) {
    acc = a.get();
    vel = v.get();
    loc = l.get();
    r = r_;
    timer = 50.0;
  }
  
  Cosa(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = 10.0;
    timer = 100.0;
  }


  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }

   void render() { 
    fill(100,timer);
    ellipse(loc.x,loc.y,r,r);
    strokeWeight(random(10)); 
    float d1 = 100; 
    if(d1 < 110) {   
    stroke(75,210,8);  
    rotate(5);
  } 
  }
  
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
class CosaDisco {

  ArrayList cosas;    
  PVector origin;        

  CosaDisco(int num, PVector v) {
    cosas = new ArrayList();              
    origin = v.get();                        
    for (int i = 0; i < num; i++) {
      if (random(1) < 0.5) {
        cosas.add(new CrazyCosa(origin)); 
      } else {
        cosas.add(new Cosa(origin)); 
      }
    }
  }

  void run() {
    for (int i = cosas.size()-1; i >= 0; i--) {
      Cosa p = (Cosa) cosas.get(i);
      p.run();
      if (p.dead()) {
        cosas.remove(i);
      }
    }
  }

  void addCosa() {
    cosas.add(new Cosa(origin));
  }

  void addCosa(Cosa p) {
    cosas.add(p);
  }

  boolean dead() {
    if (cosas.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }

}
class CrazyCosa extends Cosa {

  float theta;

   CrazyCosa(PVector l) {
    super(l);
    theta = 0.0;

  }

    void update() {
    super.update();
    float theta_vel = (vel.x * vel.mag()) / 1.0f;
    theta += theta_vel;
  }

  
  
 
  void render() {
    super.render();
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    stroke(#0264B2,timer);
    float x1 = 10; 
    float x2 = 10; 
    line(x1,x1,second()/50,millis()/50); 
    stroke(0,40); 
    popMatrix();
    
    
    
  }
}               
