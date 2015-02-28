
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
    PVector f = PVector.div(force,mass);
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
    ellipse(location.x,location.y,75,50);
    //
    ellipse(location.x-35,location.y+3,50,30);
    //ellipse(location.x-60,location.y+3,30,20);
  }

  void checkEdges() {
    /*if (location.x > width) {
     location.x = 0;
     } else if (location.x < 0) {
     location.x = width;
     }*/


    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
      
    }

    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
      
    }
  }

 void drag(Liquid l) {
      // Drag Magnitude
      float speed = velocity.mag();
      float dragMagnitude = -1 * l.c * speed * speed;
      // Drag direction
      PVector drag = velocity.get();
      drag.normalize();
      // Finalize force: magnitude and direction       
    
      drag.mult(dragMagnitude);
 
      // Apply the force!
      applyForce(drag);
    }
    
}

