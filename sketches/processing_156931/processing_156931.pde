
ArrayList<Vehicle> vehicles;
FlowField flowfield;
PVector mouse;
int num = 1000;

void setup() {
  size(640, 640);
  background(0);
  smooth();
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < num; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height))));
  }
  flowfield = new FlowField(20); 
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  
  mouse = new PVector(mouseX, mouseY);

  for (Vehicle v : vehicles) {

    v.follow(flowfield);
    v.update();
    v.display(255);
    v.borders();
  }
}

class FlowField {

  PVector[][] field;
  int cols, rows;
  int resolution;

  FlowField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;

    field = new PVector[cols][rows];
    init();
  }

  void init() {
    
     noiseSeed(random(10000));
     float xoff = 0.5;
     for (int i = 0; i < cols; i++) {
     float yoff = 0;
     for (int j = 0; j < rows; j++) {
     float theta = map(noise(xoff, yoff), 0, 1, 0, 4*TWO_PI);
     field[i][j] = new PVector(cos(theta), sin(theta));
     yoff += 0.05;
     }
     xoff += 0.05;
     }
    
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}

class Vehicle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxspeed;
  float maxforce;
 

  Vehicle(PVector pos) {
    position = pos.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    r = 2;
    maxspeed = 1;
    maxforce = 1;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
  
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(position);
    PVector desiredMouse = flow.lookup(mouse);
    PVector steer = PVector.sub(desired, velocity);
    PVector steerMouse = PVector.sub(desiredMouse, velocity);
    steer.limit(maxforce);
    steerMouse.limit(maxforce);
    applyForce(steer);
    applyForce(steerMouse);
  }


  void borders() {
       if (position.x < -50 || position.x > width +50 || position.y < 0 -50 || position.y > height +50) {
      position.x = random(width);
      position.y = random(height);
    }
    
    
}
   

    void display(color c) {
      float d = velocity.x;
      float e = velocity.y;
      d = map(d, 1, -1, 0, 255);
      e = map(e, -1, 1, 0, 255);
      fill(255-d, e, d, 220);
      noStroke();
      pushMatrix();
      translate(position.x, position.y);
      ellipse(0, 0, r, r);
      popMatrix();
    }
}


void mousePressed() {
 flowfield = new FlowField(20);   
flowfield.init();
  
  //background(c2);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < num; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height))));
  }
  
}
