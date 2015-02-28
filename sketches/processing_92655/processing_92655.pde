
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float rotate;
  float lifespan;
  float mass = 0.2;
  float ro;
  PImage img = loadImage("star.png");



  Particle(PVector l) {
    rotate = random(0, 360);
    location = l.get();
    lifespan = 300.0;
    ro = random(.1, .1);
    acceleration = new PVector(0, 0.01);
    velocity = new PVector(random(-2, 0.5), random(-3, 0));
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);  
    acceleration.add(f);
  }



  void display() {

    stroke(0, lifespan);
    image(img, location.x, location.y, 20, 18);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class square extends Particle {
  square(PVector l) {
    super(l);
  }
  void display() {
    float mass = 5; 

    fill(random(255), lifespan);
    rotate+=ro; 
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(rotate));
    fill(random(255));
    rect(location.x, location.y, 10, 10);
    popMatrix();
  }
}



class star extends Particle {
  star(PVector l) {
    super(l);
  }
  void display()
  {  

    pushMatrix();
    translate(300, 280);
    fill(random(255), random(100), 0, lifespan);
    ellipse(location.x, location.y, 10, 10);

    if (location.y>100)
    { 
      velocity.y=- velocity.y/1.1;
      ellipse(location.x, location.y, 10, 10);
    }
    if (location.y>250 || abs(velocity.x)<0.5 )
    { 
      velocity.x=0;
      location.y=120;
      lifespan=0;
    }
    popMatrix();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= .6;
  }
}


