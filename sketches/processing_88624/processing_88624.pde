
//Raven Kwok (aka Guo Ruiwen)
//ravenkwok.com
/*
Inspired by Ale's(http://openprocessing.org/user/12899) drawingMachine_10(http://openprocessing.org/sketch/34320).
*/

ParticleController pc;

void setup(){
  size(400,400);
  smooth();
  background(255);
  pc = new ParticleController();
  pc.pAddCircle(1000,100);
  pc.iAddCircle(100,100);
}

void draw(){
  pc.update(10);
  pc.display();
}

void keyPressed(){
  if(key == 'r'){
    background(255);
    pc = new ParticleController();
    pc.pAddCircle(1000,100);
    pc.iAddCircle(100,100);
  }
}
class Interference{
  
  String mode; 
  PVector mLoc;
  float range;
  
  Interference(float x, float y){
    
    mLoc = new PVector(x,y);
    
    float randFloat = random(1);
    if(randFloat<0.5) mode = "ATTRACT";
    else mode = "REJECT";
    
    range = random(0,300);
  }
}
class Particle {

  PVector mLoc;
  PVector dir;

  Particle(float x, float y) {
    mLoc = new PVector(x, y);
  }

  void update(Interference itf, float force) {
    float distance = dist(itf.mLoc.x, itf.mLoc.y, mLoc.x, mLoc.y);
    if (distance<itf.range) {
      if (itf.mode.equals("ATTRACT")) {
        dir = PVector.sub(itf.mLoc, mLoc);
      }
      else {
        dir = PVector.sub(mLoc, itf.mLoc);
      }
      dir.normalize();
      dir.mult(force/distance);
      mLoc.add(dir);
    }
  }

  void display() {
    stroke(20, 20);
    point(mLoc.x, mLoc.y);
  }
}
class ParticleController{
  
  Interference [] interferences;
  Particle [] particles;
  
  ParticleController(){
  }
  
  void pAddCircle(int amt, float rRange){
    particles = new Particle[amt];
    for(int i=0;i<amt;i++){
      float r = rRange;
      float randDegree = random(360);
      float x = cos(radians(randDegree))*r+width/2;
      float y = sin(radians(randDegree))*r+height/2;
      particles[i] = new Particle(x,y);
    }
  }
  
  void iAddCircle(int amt, float rRange){
    interferences = new Interference[amt];
    for(int i=0;i<amt;i++){
      float r = rRange;
      float randDegree = random(360);
      float x = cos(radians(randDegree))*r+width/2;
      float y = sin(radians(randDegree))*r+height/2;
      interferences[i] = new Interference(x,y);
    }
  }
  
  void update(float force){
    for(int i=0;i<interferences.length;i++){
      for(int j=0;j<particles.length;j++){
        particles[j].update(interferences[i],force);
      }
    }
  }
  
  void display(){
    for(int i=0;i<particles.length;i++){
      particles[i].display();
    }
  }
}


