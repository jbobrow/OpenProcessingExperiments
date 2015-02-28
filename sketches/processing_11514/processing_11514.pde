
//The Particle class. Stores location, velocity, forces, and performs all vital functions.
class Particle{
  //vars
  PVector loc, vel, acc, fric, grav, wind, v;//initialises all necessary vectors
  float velMax, drag;
  int w = 2; //width
  int h = 8; //height
  Boolean timed; //determines whether particle has lifespan
  int timer = 5; //cycles that timed particles live; magic no. = 5;
  int numCh = 2; //number of spawns upon hitting ground
  //Boolean mouseMode = false; //experimented with adding mouse control


  Particle(PVector loc_, Boolean timed_) {   
    loc = loc_.get(); //location vector
    acc = new PVector(0,0); //acceleration vector
    
    grav = new PVector(0,1); //gravity constant
    wind = new PVector(0,0); //wind vector
    v = new PVector(-0.2,0); //placeholder, wind acc;
    
    timed = timed_; //timed temporary particles do not follow the rules of physics in this incarnation
    if(timed){
      vel = new PVector(random(-3,3),random(-5,-3));
    } else{
      vel = new PVector(0,0);
    }
    
    velMax = 5; //maximum velocity
  }
  
  void run(){
    if(timed){
      timer--;
    }
    
    update();
    wrap();
    display();
  }

  void update() {
    /*if(mouseMode){
      v = new PVector((mouseX-450)/(width/velMax), 0);
    }*/
    
    wind.add(v);
    
    if(!timed){
      acc.add(grav);
      acc.add(wind);
    }
    
    vel.add(acc);
    vel.limit(velMax);
    loc.add(vel);
    acc.mult(0); //reset acceleration
    wind.mult(0); //reset wind
  }

  void wrap() {
    
    if(loc.x > width + w) {
      loc.x = 0 - w;
    } else if (loc.x < 0 - w) {
      loc.x = width + w;
    }
    
  }
  
  boolean hitGround(){
    if(loc.y >= height && !timed) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    noStroke();
    fill(104);
    rect(loc.x,loc.y,w,h);
  }
  
  boolean dead(){
    if(timer < 0){
      return true;
    } else {
      return false;
    }
  }
  
}


