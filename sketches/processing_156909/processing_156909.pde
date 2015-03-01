
ArrayList<Vehicle> vehicles;
FlowField flowfield;
color c1 = color(#EAE06D); 
color c2 = color(#000417);
int num = 500;

void setup() {
  size(600, 600);
  background(c2);
  smooth();
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < num; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
  flowfield = new FlowField(50);
  //32
}

void draw() {
 
  
  for (Vehicle v: vehicles) {

    v.follow(flowfield);
    v.update();
    v.display(c1);
    v.borders();
  }
}


void mousePressed() {
  background(c2);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < num; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
  flowfield.init2();
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
    init2();
  }

  
  void init2() {

    for (int i = 0; i < rows; i += 3) {
      for (int j = 0; j < cols; j += 3) {
    
        field[i][j] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i+1][j] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i+2][j] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i][j+1] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i+1][j+1] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i+2][j+1] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i][j+2] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i+1][j+2] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        field[i+2][j+2] = new PVector(int(random(-2, 2)), int(random(-2, 2)));
        
      }
    }    
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}

class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float velScale;
  float forceScale;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(5, 0);
    location = new PVector(x, y);
    r = 2;
    velScale = 0.3;
    forceScale = 1;
  }

  void update() {
    velocity.x += acceleration.x;
    velocity.y += acceleration.y;
    velocity.x *= velScale;
    velocity.y *= velScale;
     
if (sqrt(velocity.x*velocity.x + velocity.y*velocity.y) < 0.2 ) {
      location.x = random(width);
      location.y = random(height);
    }  
    
    location.x += velocity.x;
    location.y += velocity.y;
    acceleration.x *= 0;
    acceleration.y *= 0;
  }
  
  void applyForce(float fx, float fy) {
    acceleration.x += fx;
    acceleration.y += fy;
  }
  
  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    float dx = desired.x;
    float dy = desired.y;
    float mx = (mouseX-width/2)/100;
    float my = (mouseY-height/2)/100;
    float a = 0.5;
    float steerx = dx - velocity.x + a*mx;
    float steery = dy - velocity.y + a*my;
    steerx *= forceScale;
    steery *= forceScale;
    applyForce(steerx, steery);
  }
  
  
  void borders() {
    if (location.x < -50 || location.x > width +50 || location.y < 0 -50 || location.y > height +50) {
      location.x = random(width);
      location.y = random(height);
    }
  }
  
  void display(color c) {
    fill(c, 10);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }
}
