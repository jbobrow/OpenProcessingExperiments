

// self assembly time mechanism

Mechanism mechanism;

void setup() {
  size(512, 512, P2D);
  colorMode(HSB, 255);
  noStroke();
  background(0);
  mechanism = new Mechanism();
  mechanism.initialize();
  smooth();
}


void draw() {
  background(color(196,255,32));
  mechanism.draw();
}

void mousePressed() {
  mechanism.addRandomGear();
}

void keyPressed() {
  if (key == ' ') {
    mechanism.generate();
  }
  if (key == 'c') {
    mechanism.initialize();
  }
}

class Mechanism {
  ArrayList gears = new ArrayList();
  float friction = 0.9f;
  float initialRadius = 80;
  float rotation = 0;

  void initialize() {
    gears.clear();
    // the central gear
    Gear g = new Gear(width/2,height/2,initialRadius,1);
    g.setFixed(true);
    gears.add(g);
  }

  void generate() {
    initialize();
    for(int i=0; i<20; i++) addRandomGear();
  }

  // adding a gear connected to an existing one, rotating in the opposite direction
  // connecting both gears to each other, to avoid feedbacks
  void addRandomGear() {
    int i = (int)random(gears.size());
    Gear g1 = (Gear)gears.get(i);
    float r = (g1.radius/2)+(random(g1.radius/4));
    if ((r > 5) && (g1.connections.size() < 4)) {
      Gear g2 = new Gear(g1.position.x+random(-1,1),g1.position.y+random(-1,1),r,g1.direction*-1);
      gears.add(g2);
      g1.addConnection(g2);
      g2.addConnection(g1);
    }
  }

  // this is the main method of the mechanism
  void update() {
    // we look at all the gears...
    for (int i=0; i<gears.size(); i++) {
      Gear source = (Gear)gears.get(i);
      // .. and calculate a force for each connection
      for (int c=0; c<source.connections.size(); c++) {
        Gear target = (Gear)source.connections.get(c);
        float dist = PVector.dist(target.position,source.position);
        PVector force = PVector.sub(target.position, source.position);
        force.normalize();
        float factor = (dist - (source.radius+target.radius))*.1f;
        force.mult(factor);
        // then we look at all the other gears so they dont step into each others...
        for (int g=0; g<gears.size(); g++) {
          Gear gear = (Gear)gears.get(g);
          if (source != gear) {
            dist = PVector.dist(gear.position,source.position);
            // if the gear we are testing is one rotating in the same direction 
            // then we add a small distance, to the calculating force
            // so they dont touch.
            dist -= gear.direction == source.direction ? (source.radius+gear.radius)*0.2f : 0;
            if (dist < source.radius + gear.radius) {
              PVector repulsion = PVector.sub(gear.position, source.position);
              repulsion.normalize();
              float f = (dist - (source.radius+gear.radius))*.1f;
              repulsion.mult(f);
              force.add(repulsion);
            } 
          }
        }
        source.update(force);
        source.velocity.mult(friction);
      }
    }
  }

  // drawing the clock
  void draw() {
    update();
    for (int i=0; i<gears.size(); i++) {
      Gear gear = (Gear)gears.get(i);
      gear.draw();
    }
    stroke(154,128,255,128);
    strokeWeight(2);
    fill(196,255,255,64);
    ellipse(width/2,height/2,200,200);
    pushMatrix();
    translate(width/2,height/2);
    rotate(rotation+=PI/(initialRadius*2));
    stroke(154,128,0);
    strokeWeight(10);
    ellipse(0,-10,120,120);
    strokeWeight(2);
    line(0,0,0,initialRadius-20);
    fill(32,255,255,128);
    ellipse(0,initialRadius,40,40);
    popMatrix();
    noStroke();
    for (float a=0; a<2*TWO_PI; a+=PI/128) {
      fill((255*a)/(2*TWO_PI),255,255,64);
      float radius = 200-((200*a)/(2*TWO_PI));
      arc(width/2, height/2, radius, radius, a, a+PI/128);				
    }
  }
}

class Gear {
  PVector position, velocity, aceleration;
  float rotation, direction, mass, radius, innerRadius;
  public ArrayList connections = new ArrayList();
  boolean fixed = false;
  int gcolor = color(32,255,255);  

  public Gear(float gx, float gy, float r, float dir) {
    velocity = new PVector(0,0,0);
    position = new PVector(gx,gy,0);
    direction = dir;
    mass = r*0.1f;
    radius = r;
    innerRadius = 5+random((radius-10));
  }

  void setFixed(boolean f) {
    fixed = f;
  }

  void addConnection(Gear g) {
    connections.add(g);
  }

  void update(PVector force) {
    if (!fixed) {
      aceleration = PVector.div(force, mass);
      velocity.add(aceleration);
      position.add(velocity);
    }
  }

  void draw() {
    stroke(gcolor);
    strokeWeight(2f);
    noFill();
    if (!fixed) ellipse(position.x,position.y,innerRadius*2,innerRadius*2);
    pushMatrix();
    translate(position.x,position.y);
    rotate(rotation+=(direction*PI/(radius*2)));
    strokeWeight(1f);
    for (float a=0; a<TWO_PI; a+=(2*PI/radius)) {
      arc(cos(a)*radius,sin(a)*radius,5,5,a+(PI/2),a+(3*PI/2));
    }
    popMatrix();
    //drawConnections(); // try this if you want to see the connections
  }

  void drawConnections() {
    stroke(0,255,255);
    for (int i=0; i<connections.size(); i++) {
      Gear target = (Gear)connections.get(i);
      line(position.x,position.y,target.position.x,target.position.y);
    }
    noStroke();
  }
}

