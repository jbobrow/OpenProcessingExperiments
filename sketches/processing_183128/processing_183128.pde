
ArrayList particles = new ArrayList();

void setup(){
  size(640, 640);
  stroke(255, 0, 0, 2);
  background(0);
  for(int i = 0; i < 50; i++){
    particles.add(new Particle(new PVector(random(width), random(height)))); 
  }
}

void draw(){
  for(int i = 0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    p.move(); 
    p.boundary();
    for(int q = 0; q < particles.size(); q++){
      Particle p2 = (Particle) particles.get(q);
      if(PVector.dist(p.loc, p2.loc) < 150){
        noFill();
        float dx = map(dist(p.loc.x, p2.loc.x, width/2, height/2), 0, width, -50, 50);
        float dy = map(dist(p.loc.y, p2.loc.y, width/2, height/2), 0, width, -50, 50);
        float d2x = map(dist(-p.loc.x, p2.loc.x, width/2, height/2), 0, width, -50, 50);
        float d2y = map(dist(-p.loc.y, p2.loc.y, width/2, height/2), 0, width, -50, 50);
        bezier(p.loc.x, p.loc.y, p.loc.x+dx, p.loc.y+dy, p2.loc.x+d2x, p2.loc.y+d2y, p2.loc.x, p2.loc.y);
      }
    }
  }
}

class Particle {
  PVector loc, vel;
  
  Particle(PVector loc){
    this.loc = loc;
    vel = new PVector(random(-2, 2), random(-2, 2));
  }
  
  void move(){
    loc.add(vel); 
  }
  
  void boundary(){
    if(loc.x < 0) vel.x *= -1;
    if(loc.x > width) vel.x *= -1;
    if(loc.y < 0) vel.y *= -1;
    if(loc.y > height) vel.y *= -1;
  }
}





