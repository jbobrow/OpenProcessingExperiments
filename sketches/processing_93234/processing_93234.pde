
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan=200;
  float mass = 1; 
  float particleSize;
  PVector v1, v2;
  color c1, c2;
  int m = millis();
  int s = second();
  int nextTriggerTime = 0;
  int nextTriggerTime2 = 5;

  Particle(PVector l) {
    location= l.get();
    acceleration = new PVector(0, -0.05);
    lifespan = 255.0;

    c1 =color(155, 13, 50, 0);
    c2 =color(155, 13, 50, lifespan);
    v1 = new PVector(0, -0.9);
    v2 = new PVector(random(-0.35, 0.35), random(-.3, -.7)); 
    particleSize = 3;
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {


    if (location.y>height/2 ) // bottom
    {   
      v1.add(acceleration);
      location.add(v1);
    }
    else if (location.y<=height/2) // top
    { 
      // if (lifespan == 0) {
      particleSize += 0.03;
      ;
      lifespan-=0.5;
      //  lifespan = 255;

      //   else if (lifespan > 1)
      //   lifespan--;

      v2.add(acceleration);
      location.add(v2);

      //particleSize += random(-0.13, 0.23);
    }
    else {   // middle
      //  println(velocity);
      //v1.add(acceleration);
      location.add(v1);
      lifespan = 0;
    }
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void invisible(float i) {
    lifespan=i;
  }
  void display() {
    stroke(0, lifespan);
    //strokeWeight(0.2);
    fill(255, 185, 15, lifespan);
    ellipse(location.x, location.y, particleSize*(lifespan/255.0), particleSize*(lifespan/255.0));
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } 
    else {
      return false;
    }
  }
}


