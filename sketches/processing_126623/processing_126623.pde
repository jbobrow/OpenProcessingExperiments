
Predator p;
Mover m;

void setup() {
  size(700, 300);
  p = new Predator();
  m = new Mover();
}

void draw() {
  background(200);
  p.update();
  p.display();
  p.jiggle();
  if (p.intersect(m)) {
    p.food();
    p.grow();
    m.regenerate();
  }

  m.update();
  PVector [] attraction = new PVector [3];
  for (int i = 0; i < attraction.length; i++) {
    attraction[i] = m.attract(width, i*height/2);
    m.applyForce(attraction[i]);
  }
  PVector repulsion = m.repulse(p);
  m.applyForce(repulsion);
  m.display();
  m.bounce();
}



class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float diameter;
  float mass;

  Mover() {
    location = new PVector(100, height/2);
    velocity = new PVector(random(3), 0);
    acceleration = new PVector(0, 0);
    mass = 1;
  }

  void update () {
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
    diameter = mass*5;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  PVector attract(float x, float y) {
    PVector target = new PVector(x, y);
    PVector force = PVector.sub(target, location);
    float factor = map(abs(mouseY+mouseX-location.x-location.y), 0, width, 0.3, 0.1);
    force.normalize();
    force.mult(factor);
    return force;
  }

  PVector repulse(Predator p) {
    PVector force = PVector.sub(p.location, location);           
    float distance = force.mag();                                 
    distance = constrain(distance, 5.0, 25.0);                       
    float G = 25;
    float strength = (G* mass * p.mass) / pow(distance, 2); 
    force.normalize();    
    force.mult(strength); 
    force.mult(-1);
    return force;
  }

  void display() {
    stroke(0);
    fill(0, 100);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void regenerate() {
    location = new PVector(0, random(height));
    velocity.mult(0);
  }



  void bounce() {
    if (location.x < 0) {
      velocity.x*=-1;
      acceleration.x*=-1;
    }
    if (location.y < 0 || location.y > height) {
      velocity.y*=-1;
      acceleration.y*=-1;
    }
    if (location.x > width) {
      location = new PVector(0, height/2);
      velocity = new PVector(random(3), 0);
    }
  }
}

class Predator {
  PVector location;
  float xtime = 0.0;
  float mass = 10;
  float size;
  float r = 7;
  float g = 41;
  float b = 247;
  float alpha = 10;
  boolean havefood = false;
  int count = 0;
  float x = 0; // relevant for jiggle function;
  float y = 0;
  int caught = 0;


  Predator() {
  }

  void update() {
    location = new PVector(600 + x, noise(xtime)*height + y);
    xtime+=0.01;
    size = mass*10;
  }

  boolean intersect(Mover m) {
    PVector d = PVector.sub(location, m.location);
    float distance = d.mag();
    if (distance < m.diameter/2 + size/2) {
      return true;
    } 
    else {
      return false;
    }
  } 

  void food () {
    havefood = true;
    count = 0;
  }

  void jiggle () {
    if (havefood) {
      count++;
      x = random(-2, 2);
      y = random(-1, 1);
    }
    if (count > 10) {
      havefood = false;
      x = 0;
      y = 0;
    }
  }



  void grow () {
    mass+=1;
    r-=3;
    g-=3;
    b-=15;
    alpha+=20;
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);
    alpha = constrain(alpha, 0, 255);
    if (mass > 18) {
      mass = 10;
      r = 7;
      g = 41;
      b = 247;
      alpha = 10;
    }
  }



  void display() {
    stroke(0);
    fill(r, g, b, alpha);
    ellipse(location.x, location.y, size, size);
  }
}


