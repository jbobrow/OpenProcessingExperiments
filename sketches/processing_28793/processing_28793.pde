
class ParticleSystem{
  Particle[] particles;
  VectorMap vectorMap;
  
  ParticleSystem(int numParticles,float x,float y){
    particles = new Particle[numParticles];
    genParticles(x,y);
  }
  
  void setVectorMap(VectorMap vectorMap){
    this.vectorMap = vectorMap;
  }
  
  void genParticles(float x,float y){
    for(int i = 0;i < particles.length;i++){
      particles[i] = new Particle(x,y,random(-20,20),random(-20,20));
    }
  }
  
  void execute(){
    int len = particles.length;
    if(this.vectorMap!=null){
      for(int i = 0;i < len;i++){
        particles[i].addAcc(this.vectorMap);
      }
      
    }
    for(int i = 0;i < len;i++){
      particles[i].reload();
    }
    for(int i = 0;i < len;i++){
      particles[i].draw();
    }
  }
}

class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector pastPos;
  
  float w;
  
  float r;
  color c;
  
  Particle(float x,float y,float vx,float vy){
    this.pos = new PVector(x,y);
    this.vel = new PVector(vx,vy);
    this.acc = new PVector(0.0,0.0);
    
    this.pastPos = PVector.mult(this.pos,1);
    
    this.w = random(2,10);
    this.c = color(random(200,255),random(0,70),0,200);
  }

  Particle(float x,float y,float vx,float vy,float ax,float ay){
    this.pos = new PVector(x,y);
    this.vel = new PVector(vx,vy);
    this.acc = new PVector(ax,ay);
    
    this.pastPos = PVector.mult(this.pos,1);
    
    this.w = random(2,10);
    this.c = color(random(200,255),random(0,70),0,200);
  }
  
  void addAcc(VectorMap vectorMap){
    PVector acc = vectorMap.getVec(this.pos.x,this.pos.y);
    this.acc.add(acc);
    this.acc.mult(0.96);
  }
  
  void reload(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    
    this.acc.mult(0.96);
    this.vel.mult(0.92);
  }
  
  void draw(){
    noStroke();
    fill(this.c);
    beginShape();
    vertex(this.pastPos.x,this.pastPos.y);
    vertex(this.pos.x,this.pos.y);
    vertex(this.pos.x+this.w,this.pos.y);
    vertex(this.pastPos.x+this.w,this.pastPos.y);
    endShape(CLOSE);
    this.pastPos = PVector.mult(this.pos,1);
  }
}

