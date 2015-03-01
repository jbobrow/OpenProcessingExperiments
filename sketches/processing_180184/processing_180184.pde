
ArrayList particles = new ArrayList();

float compress = 150;

void setup(){
  size(640, 640);
  for(int i = 0; i < 150; i++){
    particles.add(new Particle(new PVector(random(width/2-compress, width/2+compress), random(height/2-compress, height/2+compress)))); 
  }
}

void draw(){
  fill(0, 50);
  rect(0, 0, width, height);
  fill(255, 150);
  
  for(int i = 0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    p.draw();
    p.boundary();
    
    stroke(255, 0, 0, 25);
    for(int q = 0; q < particles.size(); q++){
      Particle p2 = (Particle) particles.get(q);
      if(p.loc.dist(p2.loc) < 50){
        line(p.loc.x, p.loc.y, p2.loc.x, p2.loc.y) x;
      } 
    }
    noStroke();
  }
}

class Particle {
  PVector loc, vel;
  
  int r = (int)random(3, 15);
  
  Particle(PVector loc){
    this.loc = loc;
    vel = new PVector();
  }
  
  void draw(){
    if(vel.mag() < 0.1){
      vel = PVector.random2D();
      vel.mult(3);
    }else{
      loc.add(vel);
    }
    vel.mult(0.97);
    
    ellipse(loc.x, loc.y, r, r);
  }
  
  void boundary(){
    if (loc.x <= r+compress || loc.x >= width-r-compress) vel.x *= -1;
    if (loc.y <= r+compress || loc.y >= height-r-compress) vel.y *= -1;
  }
}
