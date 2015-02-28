
// Written by Claus Rytter Bruun de Neergaard, march 2011

int n = 100;                        // number of agents
int count = 0;                      // counter
float s = 7.5;                     // maximum agent velocity
boolean b = false;                  // controls if sketch runs or not

Agent[] agents = new Agent[n];

void setup() {
  size(400, 380);
  noCursor();
  stroke(255);
  strokeWeight(.1);

  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent();
  }
}

void draw() {

  background(0);

  // if (b == true) run sketch
  // if (b == false) pause sketch
  fill(255, 150);
  if (b == true) {
    for (int i = 0; i < agents.length; i++) {            // calling functions of all of the objects in the array
      agents[i].update();
      agents[i].edges();
      agents[i].display();      
    }
    connect();                                           // call connect()
  } else {
    for (int i = 0; i < agents.length; i++) {
      agents[i].display();
    }
    connect();
    fill(255);
    textSize(10);
    text("press space to activate/pause sketch", 10, 17.5);
  }
}

void connect() {
    for (int i = 0; i < n-1; i++) {
    for (int j = 0; j < n; j++) {
      if (dist(agents[j].loc.x, agents[j].loc.y, agents[i].loc.x, agents[i].loc.y) < 60) {
        line(agents[j].loc.x, agents[j].loc.y, agents[i].loc.x, agents[i].loc.y);
      }
    }
  }
}

void keyPressed() {                   // control sketch play/pause
  if (key == ' ') {
    if (b == true) {
      b = false;
    } 
    else {
      b = true;
    }
  }
}

class Agent {

  PVector loc;
  PVector vel;
  PVector acc;
  float speed;

  Agent() {
    loc = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 0);
    speed = s;
  }

  void update() {

    PVector att = new PVector(width/2, height/2);
    PVector dir = PVector.sub(att, loc);  
    dir.normalize();                        
    dir.mult(0.15);                         
    acc = dir;                              

    vel.add(acc);
    vel.limit(speed);
    loc.add(vel);
  }

  void edges() {

    if (loc.x > width) {
      loc.x = 0;
    } 
    else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    }  
    else if (loc.y < 0) {
      loc.y = height;
    }
  }

  void display() {
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, 3.5, 3.5);
  }
}


