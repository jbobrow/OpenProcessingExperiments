
int n = 7000;      // number of agents 
float s = 10.0; // maximum agent velocity

int count = 0; 

Agent[] agents =  new Agent[n]; 

// Setup

void setup() { 
  size(800, 800); 
  noFill(); 
  stroke(255); 
  
  for (int i = 0; i < agents.length; i++) { 
    agents[i] = new Agent();  
  }
} 

// Draw

void draw() { 

  background(0); 

  // calling functions of all of the objects in the array 
  for (int i = 0; i < agents.length; i++) { 
    agents[i].update(); 
    agents[i].edges(); 
    agents[i].display();  
  } 
} 

// Class

class Agent { 

  PVector loc; // location
  PVector vel; // velocity
  PVector acc; // acceleration
  float speed; // speed

  Agent() { 
    loc = new PVector(random(0, width), random(0, height)); 
    vel = new PVector(0, 0); 
    speed = s; 
  } 
  
  void update() { 

    PVector mouse = new PVector(mouseX, mouseY); 
    PVector dir = PVector.sub(mouse, loc);   
    dir.normalize();   //process that changes the range of pixel intensity values                      
    dir.mult(0.5);                          
    acc = dir;                               

    vel.add(acc); 
    vel.limit(speed); 
    loc.add(vel); 
  } 

  void edges() { 

    if (loc.x > width) { 
      loc.x = 0; 
    } else if (loc.x < 0) { 
      loc.x = width; 
    } 

    if (loc.y > height) {
      loc.y = 0; 
    }  else if (loc.y < 0) { 
      loc.y = height; 
    } 
  } 

  void display() { 
    point(loc.x, loc.y); 
  } 
} 
