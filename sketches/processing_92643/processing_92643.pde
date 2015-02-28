
float s ;
float m =12;

class things extends Particle {

  float x= random(-4, 4);


  things(PVector l) {

    super(l);
  }

  void display() {


    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);




    pushMatrix();

    translate(location.x, location.y);

    rotate(radians(frameCount*x));
    rotate(radians(10*x));


    rect(0, 0, m, m);


    popMatrix();
  }
}

class Circle extends Particle {

  Circle(PVector l) {

    super(l);
  }

  void display() {

    stroke(0, lifespan);
    strokeWeight(2);

    fill(127, lifespan);

    if (location.y>=height-6) {

      float a=random (0.1, 0.5);


      for (s=1;velocity.y>0;s--) {

        velocity.y= -velocity.y*a*s;
        //velocity.y=+ velocity.y*a*s;
      }
    }


    ellipse(location.x, location.y, m, m);
  }
}



class Square extends Particle {

  float x= random(-4, 4);


  Square(PVector l) {

    super(l);
  }

  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);




    pushMatrix();

    translate(location.x, location.y);

    rotate(radians(frameCount*x));
    rotate(radians(10*x));

    if (location.y>=height-6) {

      float a=random (0.1, 0.5);


      for (s=1;velocity.y>0;s--) {

        velocity.y= -velocity.y*a*s;
      }
    }
    
    if ( mousePressed==false){

    rect(0, 0, 12, 12);

    }

    popMatrix();
  }
}

class Rectangle extends Particle {

    float x= random(-4, 4);

  
 Rectangle(PVector l) {

    super(l);
  }

  void display() {

    stroke(0, lifespan);
    strokeWeight(2);

    fill(200, lifespan);

    pushMatrix();

    translate(location.x, location.y);

    rotate(radians(frameCount*x));
    rotate(radians(10*x));

    if (location.y>=height-10) {

      
          //rotate(radians(0));

      float a=random (0.1, 0.5);


      for (s=1;velocity.y>0;s--) {

        velocity.y= -velocity.y*a*s;
      }
    }
    if ( mousePressed==false){

    rect(0, 0, m+20, m-3);
    
    }
    
    popMatrix();


  }
}




class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //lifespan -= 2.0;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }



  void display() {
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

import java.util.*;


class ParticleSystem2 extends ParticleSystem {

  ParticleSystem2(float x, float y) {

    super (x, y);
  } 


  void addParticle() {

    particles.add(new things(origin));
    particles.add(new Circle(origin));
  }


  void applyForce(PVector f) {

    PVector f1 = new PVector(-f.x, -f.y);



    for (Particle p: particles) {

      p.applyForce(f1);
    }
  }
}


class ParticleSystem1 extends ParticleSystem {

  ParticleSystem1(float x, float y) {

    super (x, y);
  } 

  void addParticle() {
    //particles.add(new Particle(origin));
    particles.add(new Circle(origin));
    
    particles.add(new Rectangle(origin));

    particles.add(new Square(origin));
    
  }
}


class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x, y);
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
  }

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }

  void run() {

    for (int i = particles.size()-1; i > 0; i--) {

      Particle p = particles.get(i);
      p.run();

      if (p.isDead()) {
        particles.remove(p);
      }
    }
  }
}



ParticleSystem ps, ps2;

void setup() {
  size(800, 600);
  ps = new ParticleSystem1(width*1/3, height/3);
  ps2 = new ParticleSystem2(width*2/3, height/3);
}

void draw() {
  background(255);




  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);

  ps.applyForce(gravity);



  ps.addParticle();
  ps.run();


  ps2.applyForce(gravity);

  ps2.addParticle();
  ps2.run();
}



