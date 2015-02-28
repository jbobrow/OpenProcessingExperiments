
//Processing Final Project 2 DreamCatcher
//All rights reserved @ Tchunoo Rhee Kahng, Pittsburgh, PA, 152132, CMU
//Press mouse to draw

Attractor a;
Attractee[] aa = new Attractee[50];

void setup() {
  background(255); 
  size(1000,1000);
  for (int i = 0; i < aa.length; i++) {
    aa[i] = new Attractee(random(0.1,2),random(width),random(height)); 
  }
  a = new Attractor();
  frameRate(1000);
  
  for(int i=1;i<15;i++){   
     stroke(0,0,0,225/i); 
    noFill();
    ellipse(width/2,height/2,i*100,i*100);
  }
  
  noLoop();
}

void draw() {
  

  

  for (int i = 0; i < aa.length; i++) {
    PVector force = a.attract(aa[i]);
    aa[i].applyForce(force);

    aa[i].update();
    aa[i].display();
    //aa[i].keyPressed();
  
  }
  
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}

class Attractee {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0;
  int op;

  Attractee(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector(0,0);
    op=5;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {

    velocity.add(acceleration);
    location.add(velocity);

    aAcceleration = acceleration.x / 10.0;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity,-0.1,0.1);
    angle += aVelocity;

    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(random(255),random(255),random(255),op);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0,0,mass*16,mass*2);
    popMatrix();
  }
  
  

  
 

}

class Attractor {
  float mass;        
  PVector location;   
  float g;

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    g = 0.4;
  }


  PVector attract(Attractee aa) {
    PVector force = PVector.sub(location, aa.location);         
    float distance = force.mag();                               
    distance = constrain(distance, 5.0, 25.0);         
    force.normalize();                                       
    float strength = (g * mass * aa.mass) / (distance * distance); 
    force.mult(strength);                                 
    return force;
  }

  

}



