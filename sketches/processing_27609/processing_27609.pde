

//initialize global stuff herev
int maxrandvel = 5; // maximum random velocity
int fadetime = 20; //lower = slower must be between 0-255
PVector gravity; // initializes gravity vector
 
particle[] particles = new particle [200]; // declares array
//initialize global stuff here^
 
void setup(){
  smooth();
  gravity = new PVector (0,0.1); // gravity given a value
  size(500,300);
  background(0);
  stroke(255);
  for(int i = 0;i < particles.length; i++){  // fills array
    particles[i] = new particle();
  }
}
 
void draw(){
 fill(0,fadetime);  // fancy fade rendering (transparent background)
 rect(-2,-2,width+2,height+2); // draw transparent background
 for (int i = 0; i < particles.length; i++){  // fufill the life of a particle
  particles[i].simulate();
  particles[i].display();
 }
}
 
class particle{ // class of a particle object
  PVector loc; // location initializing
  PVector vel; // velocity initializing
  PVector oloc;
   
  particle (){  // gives loc and vel original values  (add arguments for simulation interaction here)
  loc = new PVector (random(width),random(height)); // random within box
  vel = new PVector (random(maxrandvel),random(maxrandvel)); //random between 0-maxrandvel
  }
   
  void simulate(){  // duhh... simulate
  vel.add(gravity);  // add gravity
  loc.add(vel); //add velocity to location
}
 
  void display(){ // hurr dur durrr... display a particle
  fill(255);  // point color
  line(loc.x,loc.y,loc.x-vel.x,loc.y-vel.y); // line consiting of (xlocation, ylocation to xlocation-xvelocity, ylocation-yvelocity)
  }
   
}

