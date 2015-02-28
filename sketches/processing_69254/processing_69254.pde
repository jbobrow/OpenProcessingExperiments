
class ParticleLine {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float topSpeed;

  ParticleLine(int xpos, int ypos, float velx, float vely, float m) {
    position = new PVector( xpos, ypos );
    velocity = new PVector( velx, vely );
    acceleration = new PVector(0.0, 0.0);
    mass = m;
  }

  void update() {
    velocity.add( acceleration );
    velocity.limit(3);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display(PVector force) {
    force.div(mass);  
    acceleration.add(force);
    update();
    checkEdges();
    int verso_x=(int)random(-5,5);
    int verso_y=(int)random(-5,5);
    line(position.x, position.y, position.x+verso_x, position.y+verso_y);
  }

  void checkEdges() {
    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 100;
    } 
    else if (position.y < 100) {
      position.y = height;
    }
  }
}


