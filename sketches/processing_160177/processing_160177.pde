
boolean debug = true;


FlowField flowfield;

//ArrayList<Vehicle> vehicles;

void setup() {
  size(400, 400);
  background(255);
  
  flowfield = new FlowField(20);
  //vehicles = new ArrayList<Vehicle>();
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
  for (int i = 0; i < 120; i++) {
    //vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(5, 5), random(0.1, 0.5)));
  }
}

void draw() {
  //background(255);
  // Display the flowfield in "debug" mode
  if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  /*for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }*/

  // Instructions
  fill(0);
  //text("Hit space bar to toggle debugging lines.\nClick the mouse to generate a new flow field.",10,height-20);
}


void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

// Make a new flowfield
void mousePressed() {
  flowfield.init();
}

class FlowField {

  // A flow field is a two dimensional array of PVectors
  PVector[][] field;
  int cols, rows; // Columns and Rows
  int resolution; // How large is each "cell" of the flow field

  FlowField(int r) {
    resolution = r;
    // Determine the number of columns and rows based on sketch's width and height
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
  }

  void init() {
    // Reseed noise so we get a new flow field every time
    noiseSeed((int)random(10));
    float xoff = 10;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        // Polar to cartesian coordinate transformation to get x and y components of the vector
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.9;
      }
      xoff += 0.1;
    }
  }

  // Draw every vector
  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }

  }

  // Renders a vector object 'v' as an arrow and a location 'x,y'
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 0;
    // Translate to location to render vector
    translate(x,y);
    stroke(0,120);
    // Call vector heading function to get direction (note that pointing to the right is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len*10,0);
    //line(len,0,len-arrowsize,+arrowsize/2);
    //line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].get();
  }


}
/*class Vehicle {

  // The usual stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    Vehicle(PVector l, float ms, float mf) {
    location = l.get();
    r = 10.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
  }

  public void run() {
    update();
    borders();
    display();
  }


  // Implementing Reynolds' flow field following algorithm
  // http://www.red3d.com/cwr/steer/FlowFollow.html
  void follow(FlowField flow) {
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(location);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(0,0,255,150);
    stroke(0,0,250,100);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r/2);
    vertex(r, 0);
    vertex(r/2, r);
   
    
    endShape();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}*/


