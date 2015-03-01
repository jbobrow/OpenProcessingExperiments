
ArrayList particles = new ArrayList();

void setup(){
  size(640, 640);
  noStroke();
}

void draw(){
  background(0);
  if((frameCount % 2) == 0){
    particles.add(new Particle(new PVector(width/2, height/2), random(10, 45), random(30, 45)));
    particles.add(new Particle(new PVector(width/2, height/2), random(195, 220), random(195, 220)));
  }
  for(int i = 0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    p.draw();
    p.move();
    if(p.boundary() || p.alpha <= -10){
      particles.remove(p);
    }
  }
}

class Particle {
  PVector loc, vel, acc;
  
  float vx, vy, num, alpha = 255;
  
  Particle(PVector loc, float vx, float vy){
    this.loc = loc;
    this.vx = vx;
    this.vy = vy;
    vel = new PVector();
    acc = new PVector();
  }
  
  void draw(){
    acc = new PVector(sin(radians(vx+num/2))/2, cos(radians(vy-num/2))/2);
    
    fill(255, alpha);
    float r = map(alpha, 255, 0, 1, 10);
    ellipse(loc.x, loc.y, r, r);
    
    num+=map(alpha, 255, 0, 1, 0);
    alpha-=0.1;
  }
  
  void move(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.limit(0.1);
  }
  
  boolean boundary(){
    if(loc.x < 0) return true;
    if(loc.x > width) return true;
    if(loc.y < 0) return true;
    if(loc.y > height) return true;
    return false;
  }
}


