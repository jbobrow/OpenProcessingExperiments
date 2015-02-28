
//initialize global stuff herev
int maxrandvel = 5; // maximum random velocity
int fadetime = 100; //lower = slower must be between 0-255
PVector gravity; // initializes gravity vector


particle[] particles = new particle [200]; // declares array
//initialize global stuff here^

void setup(){
  smooth();
  gravity = new PVector (0,0.1); // gravity given a value
  size(500,300);
  background(0);
  for(int i = 0;i < particles.length; i++){  // fills array
    particles[i] = new particle();
  }
}

void draw(){
 fill(0,fadetime);  // fancy fade rendering (transparent background)
 noStroke();
 rect(-20,-20,width+20,height+20); // draw transparent background
 for (int i = 0; i < particles.length; i++){  // fufill the life of a particle
  particles[i].simulate();
  particles[i].display();
 }
}

class particle{ // class of a particle object
  PVector loc; // location initializing
  PVector vel; // velocity initializing
  PVector oloc;
  float maxvel = 7;
  float speed;
  
  particle (){  // gives loc and vel original values  (add arguments for simulation interaction here)
  loc = new PVector (random(width),random(height)); // random within box
  vel = new PVector (random(maxrandvel),random(maxrandvel)); //random between 0-maxrandvel
  }
  
  void simulate(){  // duhh... simulate
  vel.add(gravity);  // add gravity
  
  if (mousePressed){  // check if mouse if being pressed
    vel.x -= (loc.x-mouseX)/width; // add x distance to mouse divided by the size of the frame to the x component of velocity
    vel.y -= (loc.y-mouseY)/height;  // add y distance to mouse divided by the size of the frame to the y component of velocity
  }
  
  vel.limit(maxvel);
  loc.add(vel); //add velocity to location
  speed = vel.mag(); // speed is the magnitude of the vector
}

  void display(){ // hurr dur durrr... display a particle
  strokeWeight(speed/2);
  stroke(255,speed*35,speed*35); // line color based on speed times 35 (35 is an abitray number that I found produces optimal colorization results)
  line(loc.x,loc.y,loc.x-vel.x,loc.y-vel.y); // line consiting of (xlocation, ylocation to xlocation-xvelocity, ylocation-yvelocity)
  }
  
}







