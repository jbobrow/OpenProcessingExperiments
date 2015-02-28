
/** FlowFieldEditor 2013/06/19 by Peter Bosshard Schneider with lots of inspiration from<br />
*   Daniel Shiffman and Greg Reynolds<br />
*   When running the program the first things you see is a black hole and a vehicle coming out of it. 
*   The Vehicle is following a flowfield which can be toggled by pressing the space bar. If visible the
*   movement of the vehicle slows down. Create up to 1000 vehicles by pressing the x-key.<br />
*   If vehicles move out of the window they reenter again from the black hole, which can be moved and locked by mouseclick.
*   The default perlin noise flowfield kan be reinitialized by pressing the 0-key. key 1 and 2 generate two other types of flowfield.<br />
*   By pressing 'e' you toggle edit-mode and a 5x5 grid becomes visible. This grid can be moved by first activating it by mouseclick.
*   A second mouseclick locks it again. In edit-mode you can read the underlying part of the flowfield into an 
*   edit-buffer by pressing 'r'. There are different possibilities to manipulate the flowfield:<br />
*   1. you can move the edit-area to another place on the flowfield and press 'w' to write the edit-buffer back into the flowfield.<br />
*   2. you can load patterns into the edit-buffer by pressing 'c' to clear the buffer, <br />
*   by pressing 'o' to create a pattern which points away from the center of the edit-field,<br />
*   by pressing 'i' to create a circular island-pattern,<br />
*   by pressing 'v' to create a deadly vortex-pattern.<br />
*   After creation of a pattern you can write it back at any place except the border<br />
*   of the flow field by pressing 'w'. Exit edit-mode by pressing 'e'.<br />
*   Press 't' to toggle trace of vehicles.*/

boolean debug = false;        // if true draw the flowfield
boolean show_trace = false;   // if true draw a trace behind vehicles

int max_particles = 1000;     // maximum number of vehicles
int src_radius = 12;          // radius of the source hole
int count = 0;                // number of active vehicles
int res = 15;  // resolution of the flowfield and the fieldmanipulator
Source well;


// Flowfield object
FlowField flowfield;
FieldManipulator maniac;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(600, 600);
  // Make a new flow field
  flowfield = new FlowField(res);
  maniac = new FieldManipulator(new PVector(width/2, height/2), flowfield);
  vehicles = new ArrayList<Vehicle>();
  well = new Source(new PVector(width/5, height/5), 2*src_radius);
  vehicles.add(new Vehicle(well.getLocation(), random(1.0, 2.0), random(0.1, 1.0)));
}

void draw() {
  if (show_trace) {
    noStroke();
    fill(255, 10);
    rect(0, 0, width, height);
  }
  else {
    background(255);
  }

  well.update(mouseX, mouseY);
  well.display();
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.setSource(well.getLocation());
    v.follow(flowfield);
    v.run();
  }
  // Display the flowfield in "debug" mode
  if (debug) {
    flowfield.display();
  }
  maniac.update(mouseX, mouseY);
  maniac.display();
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
  if (key == 't') {
    show_trace = !show_trace;
  }
  if (key == '0') {
    flowfield.init();
  }
  if (key == '1') {
    flowfield.initone();
  }
  if (key == '2') {
    flowfield.inittwo();
  }
  if (key == 'e') {
    maniac.receiveCommand(key);
  }
  if (key == 'r') {
    maniac.receiveCommand(key);
  }
  if (key == 'c') {
    maniac.receiveCommand(key);
  }
  if (key == 'w') {
    maniac.receiveCommand(key);
  }
  if (key == 'o') {
    maniac.receiveCommand(key);
  }
  if (key == 'v') {
    maniac.receiveCommand(key);
  }
  if (key == 'i') {
    maniac.receiveCommand(key);
  }
  if (key == 'x') {
    if (count < max_particles) {
      vehicles.add(new Vehicle(well.getLocation(), random(1.0, 2.0), random(0.1, 1.0)));
      count++;
    }
  }
//  if (key == 's') {
//    saveFrame("FlowFieldEditor_##.png");
//  }
}

void mouseReleased() {
  well.click(mouseX, mouseY);
  maniac.click(mouseX, mouseY);
}

class FieldManipulator {
  PVector location;          // center of edit grid
  int resolution;            // cell width
  boolean locked = true;     // cant be moved by default
  boolean edit_mode = false; // cant been seen and edited by default
  boolean read_data = false; // is data from flofield read into databuffer
  boolean clear_data = false;// should data in edit buffer be cleared
  boolean write_data = false;// should data been written from edit buffer to flowfield
  boolean obstacle_pattern = false; // fill edit data with obstacle pattern
  boolean vortex_pattern = false; // fill edit data with vortex pattern
  boolean island_pattern = false; // fill edit data with island pattern
  FlowField flow;            // reference to the flowfield to edit
  PVector[][] tempdata;

  FieldManipulator(PVector loc, FlowField ff) {
    this.flow = ff;
    this.location = loc;
    this.resolution = flow.getResolution();
    this.tempdata = new PVector[5][5];
    for (int i=0;i<5;i++) {
      for (int j=0;j<5;j++) {
        tempdata[i][j] = new PVector(0, 0);
      }
    }
  }

  void display() {
    // display only if in edit mode
    if (edit_mode) {
      pushMatrix();
      // translate to top left corner of the edit grid
      translate(location.x-2.5*resolution, location.y-2.5*resolution);
      if (locked) {                  // ready to edit
        noFill();
        stroke(200);                 // draw light gray
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            if ((i==2)&&(j==2)) {
              fill(255, 200, 200, 180); // mark center grid cell
            }
            else {
              fill(255, 180);
            }
            rect(i*resolution, j*resolution, resolution, resolution);
            // display tempdata
            pushStyle();
            drawVector(tempdata[i][j], i*resolution, j*resolution, resolution-2);
            popStyle();
          }
        }
      }
      else {                        // ready to move
        noFill();
        stroke(255, 0, 0);          // draw red
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            rect(i*resolution, j*resolution, resolution, resolution);
          }
        }
      }
      popMatrix();
    }
  }

  // Renders a vector object 'v' as an arrow and a location 'x,y'
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 2;
    // Translate to location to render vector
    translate(x+resolution/2, y+resolution/2);
    stroke(0, 50, 255);
    noFill();
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    //ellipse(0,0,3,3);
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(-len/2, 0, len/2, 0);
    // Draw an arrow only if len greater than zero
    if (len>0) {
      line(len/2, 0, len/2-arrowsize, +arrowsize/2);
      line(len/2, 0, len/2-arrowsize, -arrowsize/2);
    }
    popMatrix();
  }

  void update(float x, float y) {
    // only update location if not locked
    if (!locked) {
      // is the manipulator inside the borders of the flowfield
      if ((x > 3.5*resolution)&&(x < width - 3.5*resolution)&&(y > 3.5*resolution)&&(y < height-3.5*resolution)) {
        // align it to the grid of the flowfield
        float grid_x = int(x/resolution)*resolution+0.5*resolution;
        float grid_y = int(y/resolution)*resolution+0.5*resolution;
        location.x = grid_x;
        location.y = grid_y;
      }
    }
    else if (edit_mode) { // only update data if in edit mode

        if (read_data) {
        int colidx = int(location.x/resolution)-2; // top left cell
        int rowidx = int(location.y/resolution)-2;
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            // copy the data from flowfield to edit field
            tempdata[i][j] = flow.field[colidx+i][rowidx+j].get();
          }
        }
        read_data = false;
      }

      if (clear_data) { // clear data in edit buffer
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            // clear data in edit buffer
            tempdata[i][j] = new PVector(0, 0);
          }
        }
        clear_data = false;
      }

      if (write_data) {
        int colidx = int(location.x/resolution)-2; // top left cell
        int rowidx = int(location.y/resolution)-2;
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            // copy the data from edit field to flowfield
            flow.field[colidx+i][rowidx+j] = tempdata[i][j].get();
          }
        }
        write_data = false;
      }

      // pattern that points away from center of edit field
      if (obstacle_pattern) {
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            if ((i==2)&&(j==2)) {
              tempdata[i][j] = new PVector(0, 0); // center
            }
            else {
              PVector current_position = new PVector(location.x - 2*resolution + i*resolution, location.y - 2*resolution + j*resolution);
              PVector desired = PVector.sub(current_position, location);
              float beta = desired.heading2D();
              PVector current = new PVector(cos(beta), sin(beta));
              current.normalize();
              tempdata[i][j] = current;
            }
          }
        }
        obstacle_pattern = false;
      }

      // pattern that points inside like a vortex
      if (vortex_pattern) {
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            if ((i==2)&&(j==2)) {
              tempdata[i][j] = new PVector(0, 0); // center
            }
            else {
              PVector current_position = new PVector(location.x - 2*resolution + i*resolution, location.y - 2*resolution + j*resolution);
              PVector desired = PVector.sub(location, current_position);
              float beta = desired.heading2D() - PI/6;
              PVector current = new PVector(cos(beta), sin(beta));
              current.normalize();
              tempdata[i][j] = current;
            }
          }
        }

        vortex_pattern = false;
      }
      
      // pattern that leads around an island
      if (island_pattern) {
        for (int i=0;i<5;i++) {
          for (int j=0;j<5;j++) {
            if ((i==2)&&(j==2)) {
              tempdata[i][j] = new PVector(0, 0); // center
            }
            else {
              PVector current_position = new PVector(location.x - 2*resolution + i*resolution, location.y - 2*resolution + j*resolution);
              PVector desired = PVector.sub(location, current_position);
              float beta = desired.heading2D() - PI/2;
              PVector current = new PVector(cos(beta), sin(beta));
              current.normalize();
              tempdata[i][j] = current;
            }
          }
        }

        island_pattern = false;
      }
    }
  }

  // to receive key commands
  void receiveCommand(char cmd) {
    switch(cmd) {
    case 'e': // toggle edit mode and lock mouse movement
      edit_mode = !edit_mode;
      if (!edit_mode)locked = true;
      break;
    case 'r':
      if (edit_mode) {
        read_data = true;
      }
      break;
    case 'c':
      if (edit_mode) {
        clear_data = true;
      }
      break;
    case 'w':
      if (edit_mode) {
        write_data = true;
      }
      break;
    case 'o':
      if (edit_mode) {
        obstacle_pattern = true;
      }
      break;
    case 'v':
      if (edit_mode) {
        vortex_pattern = true;
      }
      break;
      case 'i':
      if (edit_mode) {
        island_pattern = true;
      }
      break;
    }
  }

  // to activate and move with mouse
  void click(float x, float y) {
    if ((x > location.x-2.5*resolution)&&(x < location.x+2.5*resolution)&&(y > location.y-2.5*resolution)&&(y < location.y+2.5*resolution)) {
      locked = !locked;
    }
  }
}

// Flow Field generated from a heightmap

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
    noiseSeed(int(random(10000)));
    PVector center = new PVector(width/2, height/2);
    float offx = random(0,1.0);
    float offy = random(0,1.0);
    //float max_gray;
    for (int i = 0; i < cols; i++) {
      offx += 0.001;
      for (int j = 0; j < rows; j++) {
        offy += 0.008;

        //if at the border of the field set the vector away from the center of the map and its magnitude to 1

        if (((i == 0)||(j == 0) || (i == cols-1) || (j == rows-1))) {
          PVector current_position = new PVector((resolution*0.5) + (i*resolution), (resolution*0.5) + (j*resolution));
          PVector desired = PVector.sub(current_position, center);
          float beta = desired.heading2D();
          PVector current = new PVector(cos(beta), sin(beta));
          current.normalize();
          field[i][j] = current;
        } 
        else { 
          // generate noisy directions
          float dir = 0.0;
          float theta = 0.0;
          theta = map(noise(offx, offy), 0, 1, 0, TWO_PI);
          PVector current_position = new PVector((resolution*0.5) + (i*resolution), (resolution*0.5) + (j*resolution));
          PVector current = new PVector(cos(theta), sin(theta));
          current.normalize();     
          field[i][j] = current;
        }
      }
    }
  }

  void initone() {
    float theta = 0.0;
    PVector center = new PVector(width/2, height/2);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        //if at the border of the field set the vector away from the center of the map and its magnitude to 1

        if (((i == 0)||(j == 0) || (i == cols-1) || (j == rows-1))) {
          PVector current_position = new PVector((resolution*0.5) + (i*resolution), (resolution*0.5) + (j*resolution));
          PVector desired = PVector.sub(current_position, center);
          float beta = desired.heading2D();
          PVector current = new PVector(cos(beta), sin(beta));
          current.normalize();
          field[i][j] = current;
        } 
        else { 
          float dir = 0.0;
          theta = PI/cols*i + PI/rows*j;
          PVector current_position = new PVector((resolution*0.5) + (i*resolution), (resolution*0.5) + (j*resolution));
          PVector current = new PVector(cos(theta), sin(theta));
          current.normalize();     
          field[i][j] = current;
        }
      }
    }
  }

  void inittwo() {
    float theta = 0.0;
    PVector center = new PVector(width/2, height/2);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        //if at the border of the field set the vector away from the center of the map and its magnitude to 1

        if (((i == 0)||(j == 0) || (i == cols-1) || (j == rows-1))) {
          PVector current_position = new PVector((resolution*0.5) + (i*resolution), (resolution*0.5) + (j*resolution));
          PVector desired = PVector.sub(current_position, center);
          float beta = desired.heading2D();
          PVector current = new PVector(cos(beta), sin(beta));
          current.normalize();
          field[i][j] = current;
        } 
        else {
          PVector current_position = new PVector((resolution*0.5) + (i*resolution), (resolution*0.5) + (j*resolution));
          PVector desired = PVector.sub(center, current_position);
          theta = desired.heading2D() - PI*0.55;
          PVector current = new PVector(cos(theta), sin(theta));
          current.normalize();    
          field[i][j] = current;
        }
      }
    }
  }

  // Draw every vector
  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j], i*resolution, j*resolution, resolution-2);
      }
    }
  }

  // Renders a vector object 'v' as an arrow and a location 'x,y'
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 2;
    // Translate to location to render vector
    translate(x+resolution/2, y+resolution/2);
    stroke(255, 50, 0);
    noFill();
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    //ellipse(0,0,3,3);
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(-len/2, 0, len/2, 0);
    // Draw an arrow only if len greater than zero
    if (len>0) {
      line(len/2, 0, len/2-arrowsize, +arrowsize/2);
      line(len/2, 0, len/2-arrowsize, -arrowsize/2);
    }
    popMatrix();
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }

  int getResolution() {
    return resolution;
  }
}

class Source {
  PVector location;
  float diameter;
  boolean locked = true;

  Source(PVector loc, float diam) {
    this.location = loc;
    this.diameter = diam;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    if (!locked) {
      stroke(255, 0, 0);
    }
    else {
      noStroke();
    }
    fill(0);
    ellipse(0, 0, diameter, diameter);
    popMatrix();
  }

  void click(float x, float y) {
    if ((x < location.x+diameter*0.5)&&(x > location.x-diameter*0.5)&&(y < location.y+diameter*0.5)&&(y > location.y-diameter*0.5)) {
      locked = !locked;
    }
  }
  
  void update(float x,float y){
    if(!locked){
      location.x = x;
      location.y = y;
    }
  }
  
  PVector getLocation() {
    return this.location;
  }
}

// Flow Field Following

class Vehicle {

  // The usual stuff
  PVector source;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    Vehicle(PVector l, float ms, float mf) {
    source = l.get();
    location = l.get();
    r = 8.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
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
    float theta = velocity.heading2D() + radians(90);

    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(-HALF_PI);
    fill(20, 80, 120, 160);
    ellipse(0, 0, r*2, r*2);
    stroke(255, 180, 0);
    strokeWeight(2);
    line(0, 0, cos(theta)*r, sin(theta)*r);
    strokeWeight(1);
    popMatrix();
  }

  void setSource(PVector src) {
    this.source=src;
  }

  // reset location to source
  void borders() {
    if ((location.x < -2*r)||(location.y < -2*r)) location = source.get();
    if ((location.x > width+2*r)||(location.y > height+2*r)) location = source.get();
  }
}



