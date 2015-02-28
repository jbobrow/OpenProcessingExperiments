
Mover m1;
Mover m2;
Mover m3;
Mover m4;
Mover m5;
Mover m6;
Mover m7;
Mover m8;
Mover m9;
Mover m10;
Attraction a;

void setup() {
  size(800, 800);
  m1 = new Mover();
  m2 = new Mover();
  m3 = new Mover();
  m4 = new Mover();
  m5 = new Mover();
  m6 = new Mover();
  m7 = new Mover();
  m8 = new Mover();
  m9 = new Mover();
  m10 = new Mover();
  
  a = new Attraction();
}

void draw() {
  background(255);
  
  PVector force = a.attract(m1);
  m1.applyForce(force);
  m1.update();
  
  PVector force2 = a.attract(m2);
  m2.applyForce(force2);
  m2.update();
  
  PVector force3 = a.attract(m3);
  m3.applyForce(force3);
  m3.update();
  
  PVector force4 = a.attract(m4);
  m4.applyForce(force4);
  m4.update();
  
  PVector force5 = a.attract(m5);
  m5.applyForce(force5);
  m5.update();
  
  PVector force6 = a.attract(m6);
  m6.applyForce(force6);
  m6.update();
  
  PVector force7 = a.attract(m7);
  m7.applyForce(force7);
  m7.update();
  
  PVector force8 = a.attract(m8);
  m8.applyForce(force8);
  m8.update();
  
  PVector force9 = a.attract(m9);
  m9.applyForce(force9);
  m9.update();
  
  PVector force10 = a.attract(m10);
  m10.applyForce(force10);
  m10.update();
  
  a.drag();
  a.hover(mouseX, mouseY);
  
  a.display();
  m1.display(150.0);
  m2.display(85.5);
  m3.display(79.2);
  m4.display(69.0);
  m5.display(64.69);
  m6.display(58.1);
  m7.display(44.6);
  m8.display(41.2);
  m9.display(30.6);
  m10.display(23.5);

}

void mousePressed() {
 a.clicked(mouseX, mouseY); 
}

void mouseReleased() {
 a.stopDragging(); 
}
class Attraction {
  float mass; // connected to size
  float G; //gravity
  PVector location;
  boolean dragging = false; // are you dragging?
  boolean rollover = false; // is the mouse over the ellipse
  PVector dragOffset; // hold the offset when object is clicked...

  Attraction () {
    //defaults
    location = new PVector(width/2, height/2);
    mass = 50;
    G = 0.1;
    dragOffset = new PVector(0.0, 0.0);
  }

  PVector attract(Mover m) {
    //a vector that point from one object to another
    PVector force = PVector.sub(location, m.location); 
    //magnitude of that vector is the distance between the two objects...
    float distance = force.mag();
    //limit the distance so it's not insane
    distance = constrain(distance, 1.0, 25.0);
    // use gravity to work out the strength of the force
    float strength = (G * mass * m.mass) / (distance * distance);
    //normalize that shit and scale it to the right maggggy
    force.normalize();
    force.mult(strength);
    return force;
  }

  //lets display that shit
  void display() {
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    if (dragging) {
      fill (50);
      } 
    else if (rollover) {
      fill(100);
    } 
    else {
      fill(175, 200);
    }
    ellipse(location.x, location.y, mass*2, mass*2);
  }
  
  //Mouse interaction yo
  void clicked(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }
  
  void hover(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < mass) {
      rollover = true;
    }else {
      rollover = false;
    }
  }
  
  void stopDragging() {
   dragging = false; 
  }
  
  void drag() {
    if (dragging) {
     location.x = mouseX + dragOffset.x;
     location.y = mouseY + dragOffset.y; 
    }
  }
}

//Based off of The Nature of Code 2.6 example on forces

class Mover {
    PVector location;
    PVector velocity;
    PVector acceleration;
    float mass;

  Mover() {
    float x = random(width);
    float y = random(height);
    location = new PVector(x, y);
    velocity = new PVector (0.2, 0); 
    acceleration = new PVector (0, 0);
    mass = 1000;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display(float _size) {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, _size, _size);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    }
    else if (location.x<0) {
      location.x = width;
    }
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}



