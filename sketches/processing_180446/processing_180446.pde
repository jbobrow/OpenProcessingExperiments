
// collision physics on ice 
// each block has a different mass
// blocks move on a friction free surface blown by the  wind
// blocks can also be tethered and moved by the mouse

// Nature of Code Ch. 2 applying forces.
// The 'air track' look of the sketch and the collision physics
// (much simplified) from James D Millers's (Gustavus Adolphus College)
// on-line physics engine tutorial

/*@pjs preload="blackLeaf.png";*/

BoxManager boxManager;
LeafLitter leafLitter;

void setup() {
  size(1000, 200);
  boxManager = new BoxManager();
  leafLitter = new LeafLitter();
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(1);
  line(0, 160, width, 160);
  leafLitter.scatter();
  boxManager.run();
}

class BoxManager {
  int numBoxes, x, y ;
  float mass, hold;
  Vehicle[] boxes ;
  PVector followMouse;
  boolean inContact;
  boolean tetherInUse;

  BoxManager() {
    tetherInUse = false;
    numBoxes = 3;
    x = 100;
    y = 115;
    mass = 10;
    boxes = new Vehicle[numBoxes];
    for (int i = 0; i < boxes.length; i = i+1) {
      boxes[i] = new Vehicle( x, y, mass);
      x += 100;
      mass *= 2;
    }
  }

  // move, collision check, and dislay all the boxes
  void run() {
    for (int outer = 0; outer < boxes.length; outer++) {
      boxes[outer].run();
      for (int inner = outer + 1; inner < boxes.length; inner++) {
        inContact =  checkThese2(boxes[outer], boxes[inner]);
        if (inContact) {
          separate(boxes[outer], boxes[inner]);
          adjVel(boxes[outer], boxes[inner]);
        }
      }
    }
    // a separate loop so tether always drawn on top
    for (Vehicle b : boxes) {
      selectBox(b);
      tetherBox(b);
    }
  }

  // check for overlap (horizontal part of the 'Separating Axis Theorem')
  boolean  checkThese2(Vehicle b1, Vehicle b2) { 
    if (b1.pos.x + b1.size/2 < b2.pos.x - b2.size/2) return false; 
    else if (b1.pos.x - b1.size/2 > b2.pos.x + b2.size/2) return false;
    else return true ;
  }

  // make sure we are still not overlapping by the  next frame
  //  this could, if you like, be calculated exactly, but 2 seems to work
  void separate(Vehicle b1, Vehicle b2) {
    if (b1.pos.x < b2.pos.x) {
      b1.pos.x -= 2; 
      b2.pos.x += 2;
    }
    if (b1.pos.x > b2.pos.x) {
      b1.pos.x += 2; 
      b2.pos.x -= 2;
    }
  }

  // the collision response (from the Miller site and at http://en.wikipedia.org/wiki/Inelastic_collision)
  //  the 1 sets the co-efficient of restitution and  gives an elastic collision
  void adjVel(Vehicle b1, Vehicle b2) {
    hold =  ((1 * b2.mass) * (b2.vel.x - b1.vel.x) + (b1.mass * b1.vel.x) + (b2.mass * b2.vel.x)) / (b1.mass + b2.mass);
    b2.vel.x =  ((1 * b1.mass) * (b1.vel.x - b2.vel.x) + (b1.mass * b1.vel.x) + (b2.mass * b2.vel.x)) / (b1.mass + b2.mass);
    b1.vel.x = hold;
  }

  // only allow selection of one box at a time
  void selectBox(Vehicle b) {
    if (!tetherInUse && mousePressed && mouseX > b.pos.x-b.size/2
      && mouseX < b.pos.x+b.size/2 && mouseY < 160 && mouseY > 70) {
      b.selected = true;
      tetherInUse = true;
    }
  }

  // don't allow the tether to attach to 
  // unselected boxes if the tether is already in use
  void tetherBox(Vehicle b) {
    if (b.selected) {
      // Hooke's law
      followMouse = new PVector((mouseX - b.pos.x) * 0.005, 0);
      b.applyForce(followMouse);
      strokeWeight(.5);
      line( b.pos.x, b.pos.y, mouseX, mouseY);
      if (!mousePressed) {
        b.selected = false; 
        tetherInUse = false;
      }
    }
  }
}

class LeafLitter {
  PImage l;
  int numLeaves;
  Leaf[] leaves;
  float x, y;

  LeafLitter() {
    numLeaves = 10;
    leaves = new Leaf[numLeaves];
    l  = loadImage("blackLeaf.png");
    for (int i = 0; i < numLeaves; i++ ) { 
      x =   random(0, 1000);
      y =  random(10, 150);
      leaves [i] = new Leaf (x, y, l);
    }
  }

  void scatter() {
    for (Leaf  l : leaves) {
      l.update();
    }
  }
}


class Leaf {
  float posX, posY, velX, velY, angle, incr;
  PImage leafImg;

  Leaf (float x, float y, PImage leafIn) {
    posX = x;
    posY = y;
    leafImg = leafIn;
    velY = random(.1, 1);
    velX =  random (1, 4);
    angle = radians(random(360));
    incr = random(-5, 5);
  }

  void display () {
    pushMatrix();
    translate(posX, posY);
    rotate(angle);
    image(leafImg, 0, 0, 10, 10);
    popMatrix();
  }

  void move () { 
    posX = posX + velX;
    posY = posY + velY;
    angle += radians(incr);
  }

  void boundaries() {
    if (posY > 150 || posY < -5) velY *= -1;
    if (posX > 1100 ) posX = -100;
  }

  void update() {
    move();
    display();
    boundaries();
  }
}

class Vehicle {
  PVector accel, vel, pos, wind;
  float mass, size;
  boolean selected;
  color c;

  Vehicle(int x, int y, float m) {
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x, y); 
    wind = new PVector(0.1, 0); // an easterly breeze
    mass = m;
    size = m * 3;
    c = color(random(100, 255), random(100, 255), random(100, 255));
    selected = false;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    accel.add(f);
  }

  void update() {
    applyForce(wind);
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(c);
    rectMode(CENTER);
    rect(pos.x, pos.y, size, 90);
  }

  void boundsCheck() {
    if (pos.x > width - size/2 ) {
      pos.x = width - size/2 - 1;
      vel.x = vel.x * -0.9; 
    } else if (pos.x < size/2) {
      pos.x = size/2 + 1;
      vel.x = vel.x * -0.9;
    }
  }

  void run() {
    update();
    boundsCheck();
    display();
  }
}



