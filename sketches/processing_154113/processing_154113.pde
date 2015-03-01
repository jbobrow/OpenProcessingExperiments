

import processing.serial.*;
import SimpleOpenNI.*;
SimpleOpenNI kinect;
Serial myPort;

FlowField flowfield;
mouseLocation mouselo;

int numboids = 300;

PVector com = new PVector();                                   
PVector com2d = new PVector(); 


String[] flexValuesStr;
float[] flexValuesInt = new float[11];

ArrayList boids, boids2, boids3, boids4;
float concen;
float medita;


// switch
boolean debug = false; //debug mode
boolean trail = false; //trails
boolean colorFlow=true; // segmentation of moving objects?
boolean human = false;
boolean ui = false;

int lastMillis, lastMillis2, lastMillisGamma, lastMillisSs=0;

/*boolean sketchFullScreen() {
 return true;
 }*/
void setup() {
  // screen and video
  size(displayWidth, displayHeight);
  //kinect
  kinect =  new SimpleOpenNI(this); 
  kinect.enableUser();
  kinect.enableRGB();
  //Flowfield
  flowfield = new FlowField(10);
  //Mouse Location
  mouselo = new mouseLocation();//flowfield data where ever mouse is, theta/arraynumber

  //Serial List
  myPort = new Serial(this, Serial.list()[0],9600);
  myPort.bufferUntil('\n');
  println( Serial.list());

  //Boid ArrayList
  boids = new ArrayList();
  boids2 = new ArrayList();
  boids3 = new ArrayList();
  boids4 = new ArrayList();

  // Make a whole bunch of boids with random maxspeed and maxforce values
  for (int i = 0; i < numboids; i++) {
    boids.add(new Boid(new PVector(random(width), random(height)), random(0.1, 0.5)));
    boids3.add(new Boid3(new PVector(random(width), random(height)), random(0.1, 0.5)));
  }
  for (int j = 0; j < numboids*2; j++) {
    boids2.add(new Boid2(new PVector(random(width), random(height)), random(0.1, 0.5)));
    boids4.add(new Boid4(new PVector(random(width), random(height)), random(0.1, 0.5)));
  }
  //graphic setup
  background(0);
  ellipseMode(CENTER);
  smooth();
}

void draw() {
  // Background changing function, changes background (lgamma,0,0,20) 
  //where lgamma = 0 - 100 Low gamma waves (Gamma =  multi-sensory processing
  bg();
  //buttons n =SepandSee, m = flow, l/k = Ui, z/x = debug
  keys();
  //Mouse location vector for debuging 
  PVector ms = new PVector(mouseX, mouseY);

  if (debug) flowfield.display();
  //
  for (int i = 0; i < boids.size(); i++) {
    Boid b = (Boid) boids.get(i);
    Boid2 b2 = (Boid2) boids2.get(i);
    Boid3 b3 = (Boid3) boids3.get(i);
    Boid4 b4 = (Boid4) boids4.get(i);
    //clear every 3min
    if (millis()>lastMillis2+180000) {//every 180sec 0.001mili = 1sec
      lastMillis2 = millis();
      background(0);
    }

    //change flowfield every 20sec
    if (millis()>lastMillis+20000) {//every 20sec 0.001mili = 1sec
      lastMillis = millis();
      flowfield.init();
    }
    //flow state
    if (key=='m') { 
      b.follow(flowfield);
      b2.follow(flowfield);
      b3.follow(flowfield);
      b4.follow(flowfield);
    }
    //sep and seek state
    if (key=='n') { 
      b.separate(boids);
      b2.separate(boids2);
      b3.separate(boids3);
      b4.separate(boids4);
      
        b3.applyBehaviors(boids3, ms);
     
    }
    //run all 
    b.run();
    b2.run();
    b3.run();
    b4.run();
  }

  if (kinect.isInit()) {
    kinect.update();
  }

  //User
  int[] userList = kinect.getUsers();
  for (int i=0; i<userList.length;i++) {
    if (kinect.isTrackingSkeleton(userList[i])) {

      human=true;
      if (kinect.getCoM(userList[i], com))
      {
        //converts coordinates to real coordinate, like the size of the screen.
        kinect.convertRealWorldToProjective(com, com2d);
        //mouselo.display(com);
        mouselo.mouseblock(flowfield, ms);
      }
    }
  }

  if (ui)userInterface(com);
}

//pulls brainwaves into array for use
void serialEvent(Serial myPort) {
  String flexSerial = myPort.readString();
  flexValuesInt = float(split(flexSerial, ','));
  if (flexValuesInt[0] == 200) {
    //print("Received string over serial: ");
    //println("Flex Serials "+flexSerial);
  }
} 
//new User
void onNewUser(SimpleOpenNI curKinect, int userId) {

  println("New User "+ userId) ;
  curKinect.startTrackingSkeleton(userId);
}
//Lost User
void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
  flowfield.init(); 
  human=false;
}

//change background function
void bg() {
  if (millis()>lastMillisGamma+10000) {//every 10sec 0.001mili = 1sec
    lastMillisGamma=millis();
    rectMode(CORNER);
    float lgamma = map( flexValuesInt[9], 0, 15000, 0, 100);
    noStroke();
    fill(lgamma, 0, 0, 20);
    rect(0, 0, width, height);
    println(lgamma);
  }
}
//buttons n =SepandSee, m = flow, l/k = Ui, z/x = debug
void keys() {

  if (key=='x') debug=true;
  if (key=='z') debug=false;
  if (key==' ') background(0);
  if (key=='l') ui=true;
  if (key=='k') ui=false;
}


//User Interface for checking brain waves and if a human is presenta and where 
void userInterface(PVector dot) {

  float z = map(dot.z, 0, 1500, -300, height-500);
  float x = map(dot.x, -500, 500, 0, width+100);

  pushMatrix();

  fill(255, 80);
  stroke(200);
  //translate(0,250);
  //rotate(PI+PI/2);
  ellipse(0, 0, 600, 600);
  noStroke();
  fill(0);
  textSize(20);
  text("Human", 10, 30); 
  if (human) {
    fill(0, 255, 0);
    ellipse(100, 22, 15, 15); 
    fill(0);
    text("Attention:"+flexValuesInt[1], 10, 65);
    text("Meditation:"+flexValuesInt[2], 10, 90);
    text("Position "+int(x)+" "+int(z), 10, 115);
  }
  else {
    fill(255, 0, 0);
    ellipse(100, 25, 15, 15);
    fill(200);
    text("Attention:", 10, 65);
    text("Meditation:", 10, 90);
    text("Position ", 10, 115);
  }

  if (key=='m') {

    text("Flow Field", 10, 140);
  }
  if (key=='n') {

    text("Separate and Seek", 10, 140);
  }


  fill(0);
  text("Signal: "+flexValuesInt[0], 130, 30); 

  if ( flexValuesInt[0]==0) {
    fill(0, 255, 0);
    ellipse(260, 22, 15, 15);
  }
  if ( flexValuesInt[0]>=1 && flexValuesInt[0]<=100) {
    fill(255, 183, 0);
    ellipse(260, 22, 15, 15);
  }
  if ( flexValuesInt[0]>=100 && flexValuesInt[0]<=200) {
    fill(255, 0, 0);
    ellipse(260, 22, 15, 15);
  }
  textSize(18);
  fill(150);
  text("Vamwe", 10, 165);
  textSize(16);
  text("Tawanda Kanyangarara", 10, 185);


  popMatrix();
}





class Boid {

  // The usual stuff
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float mass;


  float colr;    //random color of balls
  float ralpha; //random alpha of balls

  Boid(PVector l, float mf) {
    r= 3;
    loc = l.get(); 
    maxforce = mf;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    mass = random(0.5, 0.8);
    maxspeed = mass;
    colr = random(90, 120);
    ralpha = random(30, 80);
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
    PVector lookup = PVector.add(loc, ahead);




    // What is the vector at that spot in the flow field?
    PVector desired = f.lookup(lookup);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    acc.add(steer);
  }
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    force.div(mass);
    acc.add(force);
  }


  void separate (ArrayList<Boid> boids) {
    float desiredseparation = r;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(loc, other.loc);

      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);


    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void render() {

    fill(220, colr, 19, ralpha);
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(0);


    noStroke();
    ellipse(0, 0, mass*5, mass*5);
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

  int clockNow, clockPrev, clockDiff; // for timing check

  FlowField(int r) {
    resolution = r;
    // Determine the number of columns and rows based on sketch's width and height
    cols = displayWidth/resolution;
    rows = displayHeight/resolution;
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
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        // Polar to cartesian coordinate transformation to get x and y components of the vector
        field[i][j] = new PVector(cos(theta), sin(theta));
        /*float x = i*resolution;
         float y = j*resolution;
         
         PVector v = new PVector(width/2-x,y-height/2);
         v.normalize();
         // Polar to cartesian coordinate transformation to get x and y components of the vector
         field[i][j] = v;// new PVector(cos(theta),sin(theta));*/
        yoff += 0.1;
      }
      xoff += 0.1;
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
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x, y);
    stroke(100);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0, 0, len, 0);
    line(len, 0, len-arrowsize, +arrowsize/2);
    line(len, 0, len-arrowsize, -arrowsize/2);
    popMatrix();
  }

  PVector lookup(PVector lookup) {
    int i = (int) constrain(lookup.x/resolution, 0, cols-1);
    int j = (int) constrain(lookup.y/resolution, 0, rows-1);
    return field[i][j].get();
  }



  int[] lookupIndex(PVector lookup) {
    float x = map(lookup.x, -500, 500, 0, width);
    float z = map(lookup.z, 0, 1500, -500, height);
    int column = int(constrain(x/resolution, 0, cols-1));
    int row = int(constrain(z/resolution, 0, cols-1));
    int[] r = { 
      column, row
    };
    return r;
  }



  PVector[][] lookuparea(PVector lookup, int s) {
    int centerCol = lookupIndex( lookup )[0];
    int centerRow = lookupIndex( lookup )[1];

    int startcol = centerCol-((s-1)/2);
    int startrow = centerRow-((s-1)/2);

    PVector[][] sblocks = new PVector[s][s]; 

    for (int i=startcol;i<startcol+s;i++) {
      for (int j=startrow;j<startrow+s;j++) {

        int col = i;
        int row = j;


        if (col>cols-1) {

          col =0;
        }
        if (row>rows-1) {

          row = 0;
        }
        if (col<0) {

          col = cols-1;
        }
        if (row<0) {

          row=rows-1;
        }

        sblocks[i-startcol][j-startrow] = field[col][row];
        //sblocks[i-startcol][j-startrow] = new PVector( col * resolution,  row * resolution );
      }
    }

    return sblocks;
  }
}





class Boid2 {

  // The usual stuff
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float mass;
  float colr;    //random color of balls
  float ralpha; //random alpha of balls

  Boid2(PVector l, float mf) {
    loc = l.get();
    r=3;

    maxforce = mf;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    mass = random(0.3, 0.6);
    maxspeed = mass;
    colr = random(50, 70);
    ralpha = random(30, 50);
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
    PVector lookup = PVector.add(loc, ahead);




    // What is the vector at that spot in the flow field?
    PVector desired = f.lookup(lookup);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    acc.add(steer);
  }
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M

    acc.add(force);
  }

  void separate (ArrayList<Boid2> boids2) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid2 other : boids2) {
      float d = PVector.dist(loc, other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }


  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);


    loc.sub(vel); //subtract to reverse direction
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void render() {

    fill(255, colr, 0, ralpha);
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(0);

    noStroke();
    ellipse(0, 0, mass*5, mass*5);
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



class Boid3 {

  // The usual stuff
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float mass;
  float colr;    //random color of balls
  float ralpha; //random alpha of balls

  Boid3(PVector l, float mf) {
    loc = l.get();
    r=3;

    maxforce = mf;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    mass = random(0.8, 1.1);
    maxspeed = mass;
    colr = random(150, 255);
    ralpha = random(10, 80);
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
    PVector lookup = PVector.add(loc, ahead);


    // What is the vector at that spot in the flow field?
    PVector desired = f.lookup(lookup);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    // Limit to maximum steering force
    steer.limit(maxforce);
    steer.add(steer);
    acc.add(steer);
  }
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    force.div(mass);
    acc.add(force);
  }

  void applyBehaviors(ArrayList<Boid3> boids3, PVector dot) {


    float z = map(dot.z, 0, 1500, -300, height-500);
    float x = map(dot.x, -500, 500, 0, width+100);

    PVector separateForce = separate(boids3);
    // PVector seekForce = seek(new PVector(dot.x,dot.y));
    PVector seekForce = seek(new PVector(dot.x, dot.y ));
    if (millis()>lastMillisSs+6000) {
      lastMillisSs=millis();
      concen = map(flexValuesInt[1], 0, 100, 0, 10);//attention  
      medita = map(flexValuesInt[2], 0, 100, 0, 1);//meditation
    }
    println("flex data attention "+flexValuesInt[1]+" = "+concen);
    println("flex data meditaion "+flexValuesInt[2]+" = "+medita);
    println("------------------------------------------------------- ");


    separateForce.mult(10-concen);//decrement 
    seekForce.mult(medita);

    applyForce(separateForce);
    applyForce(seekForce);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, loc);  // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  // Limit to maximum steering force

      return steer;
  }

  PVector separate (ArrayList<Boid3> boids3) {
    float desiredseparation = r;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid3 other : boids3) {
      float d = PVector.dist(loc, other.loc);

      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
    return sum;
  }


  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);


    loc.add(vel); //subtract to reverse direction


    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void render() {

    fill(255, colr, 0, ralpha);
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(0);

    noStroke();
    ellipse(0, 0, mass*5, mass*5);
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



class Boid4 {

  // The usual stuff
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float mass;
  float colr;    //random color of balls
  float ralpha; //random alpha of balls

  Boid4(PVector l, float mf) {
    loc = l.get();
    r=3;

    maxforce = mf;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    mass = random(0.1, 0.3);
    maxspeed = mass;
    colr = random(50, 70);
    ralpha = random(30, 50);
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
    PVector lookup = PVector.add(loc, ahead);




    // What is the vector at that spot in the flow field?
    PVector desired = f.lookup(lookup);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    acc.add(steer);
  }
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M

    acc.add(force);
  }

  void separate (ArrayList<Boid4> boids4) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid4 other : boids4) {
      float d = PVector.dist(loc, other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }


  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);


    loc.sub(vel); //subtract to reverse direction
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void render() {

    fill(170, colr, 20, ralpha);
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(0);

    noStroke();
    ellipse(0, 0, mass*5, mass*5);
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


class mouseLocation {


  mouseLocation() {
  }

  void display(PVector dot) {
    float z = map(dot.z, 0, 1500, -300, height-500);
    float x = map(dot.x, -500, 500, 0, width+100);
    println(dot.x);
    fill(0);
    ellipse(x, z, 20, 20);
    //println(dot.x+","+dot.y+","+dot.z+","+z);
  }

  void mouseblock( FlowField flow, PVector dot ) {
    PVector[][] newGrid = flow.lookuparea(dot, 10);

    for (int i=0; i<newGrid.length/2;i++) {
      for (int j=0; j<newGrid[i].length/2;j++) {
        for (int k=newGrid.length/2; k<newGrid.length;k++) {
          for (int l=newGrid[i].length/2; l<newGrid[i].length;l++) {


            //ellipse( newGrid[i][j].x, newGrid[i][j].y,10,10);

            //top left
            newGrid[i][j].x = 1;
            newGrid[i][j].y = -1;

            //top right
            newGrid[k][j].x = 1;
            newGrid[k][j].y = 1;

            //bottom left
            newGrid[i][l].x = -1;
            newGrid[i][l].y = -1;

            //bottom right
            newGrid[k][l].x = -1;
            newGrid[k][l].y = 1;
          }
        }
      }
    }
  }

  //finding mouse location based on array, vector
  void mousel(FlowField flow, PVector lol) {

    PVector mlp = flow.lookup(lol);
    pushMatrix();
    //println(mlp.x+" "+mlp.y);


    popMatrix();
  }
}



