
import traer.physics.*;


//Taylor Milner
// Project influenced by Daniel Shiffman


// Flowfield object
FlowField flowfield;
// An ArrayList of boids
ArrayList people;

void setup() {
  size(640,320);
  smooth();

  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(16);
  people = new ArrayList();
  // Make a whole bunch of people with random maxspeed and maxforce values
  for (int i = 0; i < 120; i++) {
    people.add(new person(new PVector((width),random(height)),random(2,5),random(0.1f,0.5f)));
  }
}

void draw() {
   background(60,50,50,10);
  fill(0);
  rect(350,100,100,100);
  noStroke();
 
  rect(200,100,250,100);
 
  frameRate(10);
  // Tell all the people to follow the flow field
  for (int i = 0; i <people.size(); i++) {
   person b = (person) people.get(i);
    b.follow(flowfield);
    b.run();
  }

}

// Make a new flowfield
 void mousePressed() {
  flowfield.init();
}


class person {

  // The usual stuff
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  person(PVector l, float ms, float mf) {
    loc = l.get();
    r = 3.0f;
    maxspeed = ms;
    maxforce = mf;
    acc = new PVector(0,0);
    vel = new PVector(0,0);
  }

  public void run() {
    update();
    borders();
    render();
  }


  // Implementing Reynolds' flow field following algorithm
  // http://www.red3d.com/cwr/steer/FlowFollow.html
  void follow(FlowField f) {

    // Look ahead
    PVector ahead = vel.get();
    ahead.normalize();
    ahead.mult(32); // Arbitrarily look 32 pixels ahead
    PVector lookup = PVector.add(loc,ahead);


    // What is the vector at that spot in the flow field?
    PVector desired = f.lookup(lookup);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    acc.add(steer);
  }

  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + PApplet.radians(90);
    fill(175);
   
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
  rect(r,-r,r*4,-r);
    ellipse(r+6,-r,r*2,-r*2);
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }

}



class FlowField {

  // A flow field is a two dimensional array of PVectors
  PVector[][] field;
  int cols, rows; // Columns and Rows
  int resolution; // How large is each "cell" of the flow field

  FlowField(int r) {
    resolution = r;
    // Determine the number of columns and rows based on sketch's width and height
    cols = width;
    rows = height;
    field = new PVector[cols][rows];
    init();
  }

  void init() {
    // Reseed noise so we get a new flow field every time
    noiseSeed((int)random(10000));
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        // Use perlin noise to get an angle between 0 and 2 PI
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        // Polar to cartesian coordinate transformation to get x and y components of the vector
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  // Draw every vector
  void display() {
 

  }

  // Renders a vector object 'v' as an arrow and a location 'x,y'
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
  
    // Translate to location to render vector
    translate(x,y);
    stroke(100);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;

    popMatrix();
  }

  PVector lookup(PVector lookup) {
    int i = (int) constrain(lookup.x/resolution,0,cols-1);
    int j = (int) constrain(lookup.y/resolution,0,rows-1);
    return field[i][j].get();
  }


}







