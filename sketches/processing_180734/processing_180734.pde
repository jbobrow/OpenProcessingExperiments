
ArrayList ps = new ArrayList();

void setup(){
  size(640, 640); 
  for(int i = 0; i < 5000; i++){
    ps.add(new Particle(new PVector(random(width), random(height))));
  }
}

void draw(){
  background(0);
  for(int i = 0; i < ps.size(); i++){
     Particle p = (Particle) ps.get(i);
     p.draw();
     p.boundary();
  }
}

class Particle {
  PVector loc, vel, acc;
  
  Particle(PVector loc){
    this.loc = loc;
    vel = new PVector();
    acc = new PVector();
  }
  
  void draw(){
    PVector m = new PVector(mouseX, mouseY);
    if(mousePressed){
      PVector d = PVector.sub(m, loc);
      d.normalize();
      d.mult(0.9);
      acc = d;
    }else{
      
    }
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.mult(0.97);
    stroke(255, 0, 0, map(vel.mag(), 0, 20, 50, 200));
    point(loc.x, loc.y);
  }
  
  void boundary(){
    if(loc.x < 0) vel.x *= -1;
    if(loc.x > width) vel.x *= -1;
    if(loc.y < 0) vel.y *= -1;
    if(loc.y > height) vel.y *= -1; 
  }
}


