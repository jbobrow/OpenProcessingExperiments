
// This is a little sketch showing that you can make realistic curtain movements 
// out of a simple pendulum simulation working with object oriented programming.
// It is based on video lesson 3.4 of »The Nature of Code« from Daniel Shiffman: 
// http://vimeo.com/channels/natureofcode/59707298
// I suggest you check out all of his lessons up to this one if you want to understand the concepts.
//
// Click the mouse to apply wind.
//
// - Peter Hofmann

Pendulum[] p;

void setup() {
  size(600, 420);
  smooth();
  p = new Pendulum[150];

  for (int i=0; i < p.length; i++) {
    p[i] = new Pendulum(new PVector(map(i,0,p.length,10,width-10), 0), (i+50)*2, 1); 
    // if Mass should take effect, change the last digit to anything other than 1 
    // also uncomment the Mass operation in the gravity function of the pendulum class
  }
}

void draw() {
  background(255);

  for (Pendulum p_ : p) {

    p_.display();
    p_.update();
    p_.gravity();
      
    if(mousePressed) {
      float wind = .002;
      p_.applyForce(wind);
    }  
   
  }
}

class Pendulum {
  PVector origin;
  PVector bob;
  float bobMass;
  float a, r;
  float aVel;
  float aAcc;
  float damping = 0.99;
  float G = 0.6;


  Pendulum(PVector origin_, float r_, float bobMass_) {
    bobMass = bobMass_;
    r = r_;
    a = PI/4;
    aVel = 0.0;
    aAcc = 0.0;
    origin = origin_;
    bob = new PVector(origin.x , r);
  }

  void display() {
    bob.x = origin.x + r * sin(a);
    bob.y = origin.y + r * cos(a);

    line(origin.x, origin.y, bob.x, bob.y);
    ellipse(bob.x, bob.y, bobMass, bobMass);
  }

  void update() {

    aVel += aAcc;
    aVel *= damping;
    a += aVel;
    
    aAcc *= 0;
        
  }
  
  void gravity() {
    float gravity = ( -1 * G / bob.y) * sin(a);
//    gravity *= ( bobMass / 100 ); 
    applyForce(gravity);
  }
  
  void applyForce(float f) {
    aAcc += f;
  }
  
}



