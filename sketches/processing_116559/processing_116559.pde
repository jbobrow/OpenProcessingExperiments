

Mover mover;

//boolean[] keys = new boolean[2];

//final int L = 0;
//final int J = 1;

void setup() {
  size(500, 400);

  mover = new Mover();
}

void draw() {
  background(0);

  // Always gravityll
  PVector gravity = new PVector(0, 0.1);
  mover.applyForce(gravity);

  mover.update();
  mover.bounce();
  mover.display();


}



/*void serialEvent() {
  
  
}*/

void keyPressed() {
  switch(key) {
  case 'k':
    PVector downForce = new PVector(0, 2);
    mover.applyForce(downForce);
    break;

  case 'l':
    PVector rightForce = new PVector(1, 0);
    mover.applyForce(rightForce); 
    break;

  case 'j':
    PVector leftForce = new PVector(-1, 0);
    mover.applyForce(leftForce);
    break;
  }
}


/*class PVector {
  float x;
  float y;

  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void add(PVector v) {
    y = y + v.y;
    x = x + v.x;
  }
}*/


class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  PVector downForce;
  PVector rightForce;
  PVector leftForce;

  PVector xymove;

  Mover() {
    location = new PVector(random(width), 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    downForce = new PVector(0, 1);
    rightForce = new PVector(0.05, 0);
    leftForce = new PVector(-0.05, 0);

    xymove = new PVector(0, 10);

    //    float mass;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    //    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(247, 231, 161);
    ellipse(location.x, location.y, 20, 20);
  }

  void bounce() {
    if (location.y > height) {  
      velocity.y*=-0.95;
      velocity.x = 0;
      location.y = height;
    } 
    else if (location.y < 0) {
      velocity.y *= -0.95;
      velocity.x = 0;
      location.y = 0;
    }
  }
}



