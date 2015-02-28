
Mover m;
Liquid l;
PVector gravity;
float gForce = 0.2;
// To re-enable uncomment 'applyForce(friction)' in draw()
PVector friction;
float coefficient = .1;
PVector wind = new PVector(2, 0);
Mover[] movers = new Mover[10];

void setup() {
  // background(36, 83, 197);
  noStroke();
  size(800, 800);
  l = new Liquid(0, height/2, width, height/2, 0.4);
  // Fill the movers array
  for (int i = 0; i < movers.length; i++) {
    // Random x position, 0, random mass.
    movers[i] = new Mover(random(0, width), 0, random(5, 25));
  }
}

void draw() {
  background(0);

  l.display();

    // Draw the array of movers
  for (int i = 0; i < movers.length; i++) {
    // Used for keeping things simple, eg. m.function vs. movers[i].function
    m = movers[i];
    gravity = new PVector(0, gForce*m.mass);
    m.update();
    m.checkEdges();
    m.applyForce(gravity);

    m.display();

    if (mousePressed) {
      m.applyForce(wind);
    }

    if (l.contains(m)) {
      println("Mover " + i + " is in a viscous substance.");
         PVector drag = l.drag(m);
         m.applyForce(drag);
    } else {
        friction = m.velocity.get();
        friction.mult(-1);
        friction.normalize();
        // m.applyForce(friction);
    }
  }



}

class Liquid {
  float x, y, w, h;
  // Coefficient of drag
  float c;

  Liquid(float _x, float _y, float _w, float _h, float _c) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
      }

  void display() {
    noStroke();
    fill(50);
    rect(x,y,w,h);
  }

  // Is the Mover inside the liquid?
  // Does not have to be m…just temporary and for use inside the function.
  // 'l' is just a copy of the location of the the mover being passed into the function
  boolean contains(Mover m) {
      PVector l = m.location;
      if (l.x > x && l.x < x + width && l.y > y && l.y < y + height) {
        return true;
      } else {
        return false;
      }
    }

  PVector drag(Mover m) {
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);

    return(dragForce);
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
    ellipse(location.x, location.y, mass, mass);

  }

  void update() {
    float topspeed = 50;
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
