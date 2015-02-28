

PImage img;
boolean debug = false ;
int arrayLength = 800;
int arrayLength2 = 800;

FlowField flowfield;

// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;
ArrayList<Vehicle> vehicles2;


void setup() {
  size(1000, 700, P3D);
  background(0);
 img = loadImage("top_black.png");
  vehicles = new ArrayList<Vehicle>();//Vehicle [arrayLength];
  vehicles2 = new ArrayList<Vehicle>();// new Vehicle [arrayLength2];

  flowfield = new FlowField(10);
  for (int i=0; i<arrayLength; i++) {
  vehicles.add(new Vehicle(new PVector((width/2), (height/2)),10, random(-1., 6.), color(#3399FF)));
  }
  for (int i=0; i<arrayLength2; i++) {
   vehicles2.add(new Vehicle (new PVector((width/2), (height/2)),14 , random(-1, 5.), color(#FF9900)));
  }
}
void draw() {
  flowfield.init();
if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run(); 
    v.checkEdges();
  }
  for (Vehicle v : vehicles2) {
    v.follow(flowfield);
    v.run();
    v.checkEdges();
  }

image (img, 0,0);  
  pushMatrix();
  
  fill(255);
  textSize(12);
  popMatrix();
  
  text(int(frameRate), 20, 180);
  }



//CIRCULAR FLOWFIELD FIGURED OUT BY AANKIT THE MAN

class FlowField {
  float t, x, y, f, a;
  float xoff, yoff;
  PVector center;
  int resolution;
  PVector[][] field;
  int cols, rows, flowBand;
  //PVector fingerpos;
 


  // ellipse(fingerPos.x, fingerPos.y, 20, 20);




  FlowField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];

 
    t = 0; //theta, angle around the circle
    xoff = width/2; //x pos of center of field
    yoff = height/2; //y pos of center of field
    center = new PVector(xoff, yoff);
    a = 300; //radius of the circular flowfield
    flowBand = 5; //this will make the size of the circular flow field bigger or smaller (cannot be zero)
    for (int i = 0; i <cols; i++) {
      for (int j=0; j < rows; j++) {
        field[i][j] = new PVector(0, 0);
      }
    } 
    initC();
  }

  void init() {
    while (t<TWO_PI) {
      t += .01;
      float x = cos(t)*a + xoff;
      float y = sin(t)*a + yoff;
      for (int i = 0; i <cols; i++) {
        for (int j=0; j < rows; j++) {
          int cx = i*resolution;
          int cy = j*resolution;
         
         
          //find the points in the flowfield that are in our band
          float d = dist(cx, cy, x, y);
          if (d<width/(cols/flowBand)) {
            field[i][j] = new PVector(cos(t+PI/2), sin(t+PI/2));
          }
        }
      }
    }
  }

  void initC() {
    for (int i = 0; i <cols; i++) {
      for (int j=0; j < rows; j++) {
        int cx = i*resolution;
        int cy = j*resolution;
        PVector cv = new PVector(cx, cy);
        cv.sub(center);
        if (cv.mag()<a) {
          float angle = atan2(cy-center.y, cx-center.x);
          field[i][j] = new PVector(cos(angle+PI/2), sin(angle+PI/2));
        }
      }
    }
  }

  void display() { // Draw every vector
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j], i*resolution, j*resolution, resolution-2);
      }
    }
  }

  // Renders a vector object 'v' as an arrow and a location 'x,y'
  void drawVector(  PVector v, float x, float y, float scayl) {
 pushMatrix();
   float arrowsize = 4;
    translate(x, y); // Translate to ation to render vector
    stroke(0, 100);
    rotate(v.heading()); // Call vector heading function to get direction (note that pointing to the right is a heading of 0) and rotate
    float len = v.mag()*scayl;  // Calculate length of vector & scale it to be bigger or smaller if necessary
    line(0, 0, len, 0);
    popMatrix();
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}


class Vehicle {

  public PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  color c1;
  ////
  float swt = 25.0;     //sep.mult(25.0f);
  float awt = 4.0;      //ali.mult(4.0f);
  float cwt = 50.0;      //coh.mult(5.0f);
  ////
float a = random (1,6);
float b = random (1,6);
  //constructor  
  
  Vehicle(PVector l, float ms, float mf, color _c) {
  location = l.get();  
    r = 16.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
//    x = random(10);
      velocity = new PVector(0, 0);
    c1 = _c;
 
  }

  public void run() {
    update();
    display();
    flock(vehicles);
   //follow(flowfield);
}  

  ///////////////////////

  // copied from flocationk sliders

  void flock(ArrayList<Vehicle> vehicles) {
   PVector sep = separate(vehicles);   // Separation
   PVector ali = align(vehicles);      // Alignment
   PVector coh = cohesion(vehicles);   // Cohesion
    // Arbitrarily weight these forces
      sep.mult(swt);
    ali.mult(awt);
   // coh.mult(cwt);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
  applyForce(coh);
  }
  void follow(FlowField flow) {
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed); // Scale it up by maxspeed
       // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }


  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  
void update() {
    velocity.add(acceleration);// Update velocity  
    velocity.limit(maxspeed); // Limit speed
    location.add(velocity);
    acceleration.mult(0);// Reset accelertion to 0 each cycle
  }

  void display() {
    
    float theta = velocity.heading2D() + radians(90);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    //beginShape(ELLIPSE);
    rect(0,0,a,b,random(-2,2));
   // image(img2,r,-r);
    fill(c1);
    //endShape();
    popMatrix();
  }

  void checkEdges() {
    if (location.x < r) {
      location.x = r;
      velocity.x *= -1;
    }
    if (location.x > width - r) {
      location.x = width - r;
      velocity.x *= -1;
    }
    if (location.y < r) {
      location.y = r;
      velocity.y *= -1;
    }
    if (location.y > height - r) {
      location.y = height - r;
      velocity.y *= -1;
    }
        
  }


  PVector separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = 0.0;
    PVector steer = new PVector(0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }


  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Vehicle> vehicles) {
    float neighbordist = 20.0;
    PVector steer = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        steer.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }


  PVector seek(PVector target) {
    // Normalize desired and scale to maximum speed
    PVector desired = new PVector();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

      return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location

  PVector cohesion (ArrayList<Vehicle> vehicles) {
    float neighbordist = 0.0;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Vehicle other :vehicles) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return seek(sum);  // Steer towards the loclocation
    }
    return sum;
  }
}



