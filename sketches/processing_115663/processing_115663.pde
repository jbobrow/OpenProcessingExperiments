
Mover m;
Attractor a;
PVector force;

Mover[] movers = new Mover[2500];

void setup() {
  size(800, 800);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(250, width-250), random(250, height-250), random(5, 10));
  }
  a = new Attractor();
}

void draw() {
  background(36, 83, 197);

  for (int i = 0; i < movers.length; i++) {
    m = movers[i];
    PVector force = a.attract(m);
    m.applyForce(force);
    m.update();
    m.display();
  }

 a.display();

}



void keyPressed() {
  if (keyCode == UP) {
    a.location.y -= 50;
  } else if (keyCode == DOWN) {
    a.location.y += 50;
  } else if (keyCode == RIGHT) {
    a.location.x += 50;
  } else if (keyCode == LEFT) {
    a.location.x -= 50;
  } else if (key == ' ') {
    setup();
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float _x, float _y, float _mass) {
    mass = _mass;
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0); 
  }

  void display() {
    noStroke();
    fill(250);
    ellipse(location.x, location.y, 1, 1);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // Reset acceleration, ready to recieve new forces.
    acceleration.mult(0);
  }

  // Adds a PVector to acceleration to apply a force
  // Important to add and not replace so we don't mess up other forces
  // eg. make sure forces are accumulate.
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    }

     if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }

  }
}

class Attractor {
    PVector location;
    float mass;
    

    Attractor() {
        location = new PVector(width/2, height/2);
        mass = 40;
    }

    void display() {
        // fill(36, 83, 197);
        fill(0, 0);
        stroke(250);
        strokeWeight(1);
        ellipse(location.x, location.y, 50, 50);
    }

    PVector attract(Mover m) {
        float c = 1;
        // Get the distance between the attractor and the object
        PVector force = PVector.sub(location, m.location);
        // Get the magnitude of the vector between them
        float distance = force.mag();
        distance = constrain(distance, 15, 25);
        // Normalize the vector
        force.normalize();
        // Calculate the magnitude of the new force
        float magnitude = (c * mass * m.mass) / (distance * distance);
        // Multiply the magnitude of the new force by the direction of the new force…
        // …to get the new force vector.
        force.mult(magnitude);
        return(force);

    }
}
