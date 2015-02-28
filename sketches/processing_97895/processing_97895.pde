
Mover[] movers = new Mover[100];
Liquid water;

void setup() {
  size(640, 360);
  for (int i=0; i<movers.length; i++) {
    movers[i] = new Mover(random(0.5,5),random(50,width-50),30);
  }
  water = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);
  
  water.display();

  for (int i=0; i<movers.length; i++) {
    float mu = 0.01;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(mu);   
  
    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    
    //movers[i].applyForce(friction);
    if (movers[i].isInside(water)) {
      movers[i].drag(water);
    }
    //movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
  
}

void mousePressed() {
  for (int i=0; i<movers.length; i++) {
    movers[i] = new Mover(random(0.5,5),random(50,width-50),30);
  }
  water = new Liquid(0, height/2, width, height/2, 0.1);
  redraw();
}

class Liquid {
  float x,y,w,h;
  float c;
  
  Liquid (float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  void display() {
    noStroke();
    fill(155,190,225);
    rect(x,y,w,h);
  }
  
}
    
class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Mover(float m, float x, float y) {   
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
 
  void applyForce(PVector force) {
    PVector f = force.get(); // make a copy of the force
    f.div(mass);             // so that we don't permanently change it
    acceleration.add(f);
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,int(5*mass),int(5*mass));
  }
 
  void checkEdges() {
    if (location.x > width) {
      location.x = width-1;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;      
    }
    
    if (location.y > height-1) {
      location.y = height-1;
      velocity.y *= -1;
    }

  }
  
  boolean isInside(Liquid L) {
    if (location.x>L.x && location.x<L.x+L.w && location.y>L.y && location.y<L.y+L.h) {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid L) {
    float speed = velocity.mag();
    float dragMagnitude = L.c*speed*speed;
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    
    applyForce(drag);
  }
  
}




