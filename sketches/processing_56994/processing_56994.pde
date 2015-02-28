
class Particle{

  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  
  int cycle;
  
  Particle(PVector _loc){
    loc = _loc.get();
    vel = new PVector(random(-1, 1), random(-1, 1), 0);
    acc = new PVector(random(-0.05,0.05), random(-0.05,0.05), 0);
    this.r = 5.0;
    timer = 800.0;
    cycle = floor(random(0,360));
  }

  void run(){
    display();
    update();
    checkColor();
  }
  
  void display(){
    colorMode(HSB);
    rectMode(CENTER);
    fill(cycle, 255, 255, timer);
    float a = 0.03*timer;
    rect(loc.x, loc.y, a, a);
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    timer -=2.0;
    cycle++;
  }
  
  void checkColor(){
    if(cycle >= 255){
      cycle = 0;
    }
  }
  
  boolean die(){
    if(timer <= 0.0){
      return true;
    } else{
      return false;
    }
  }
}

