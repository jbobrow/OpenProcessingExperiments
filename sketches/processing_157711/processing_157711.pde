
/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 2: Forces
 */

// A Mover and an Attractor
Mover[] movers = new Mover[1000];
Attractor a;

void setup() {
  size(500, 500);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height), random(.1, 2));
  }
  a = new Attractor();
  background(0);
}

void draw() {
//   saveFrame("output/frames#################.tif");


  // Apply the attraction force from the Attractor on the Mover.
   for (int i = 0; i < movers.length; i++) {
     PVector force = a.attract(movers[i]);
     movers[i].applyForce(force);
     movers[i].update();
     a.display();
     movers[i].display();
  }

}

class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
    G = 0.9;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    // Remember, we need to constrain the distance
    // so that our circle doesn’t spin out of control.
    distance = constrain(distance,5.0,25.0);


    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display() {
    noStroke();
    fill(255, 0);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
}


class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  // The object now has mass!
  float mass;

  Mover(float x, float y, float m) {
    // And for now, we’ll just set the mass equal to 1 for simplicity.
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    //[full] Receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
    //[end]
  }

  void update() {
    //[full] Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);
    //[end]
    // Now add clearing the acceleration each time!
    acceleration.mult(0);
  }

  void display() {
//    stroke(0);
    if (mousePressed == true) {
      fill(0);
    } else {
      fill(255);
    }
  
    //[offset-down] Scaling the size according to mass.
    ellipse(location.x,location.y,mass,mass);
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      // Even though we said we shouldn't touch location and velocity directly, there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction of our object when it reaches the edge.
      velocity.y *= -1;
      location.y = height;
    }
  }
}





