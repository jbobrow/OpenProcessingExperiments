
//A flocking simulation based on Daniel Shiffman's chapter 
//about steering forces in 'The nature of code'.
//Starts out with boidNum boids and predNum predators. 
//Clicking adds boids.
//if Obstacles is true, the boids flee from the mouse.
//There's some control over how the boids are displayed with 'a' and 'c'.
//Behaviour is controlled with 'f', 'p' and 'o'.
//abel_jansma(at)hotmail(dot)com


ArrayList<Boid> boids = new ArrayList<Boid>(); //To store all boids in.
ArrayList<Predator> preds = new ArrayList<Predator>(); //To store all predators in.
int boidNum = 10; //Initial number of boids created.
int predNum = 2; //Initial number of predators created.
PVector mouse; //Mouse-vector to use as obstacle.
float obstRad = 60; //Radius of mouse-obstacle.
int boolT = 0; //Keeps track of time to improve user-input.

boolean flocking = true; //Toggle flocking.
boolean arrow = true; //Toggle arrows.
boolean circle = false; //Toggle circles.
boolean predBool = true; //Toggle predators.
boolean obsBool = false; //Toggle obstacles.


void setup() {
  size(800, 400);
  smooth();

  for (int i=0; i<boidNum; i++) { //Make boidNum boids.
    boids.add(new Boid(new PVector(random(0, width), random(0, height))));
  }
  for (int j=0; j<predNum; j++) { //Make predNum predators.
    preds.add(new Predator(new PVector(random(0, width), random(0, height)), 50));
  }
}

void draw() {
  //background(255, 249, 240);
  fill(255, 249, 240, 90);
  noStroke();
  rect(0, 0, width, height);
  String legend = "Flocking: f \nPredator: p \nObstacle: o \nArrows: a \nCircles: c\nAdd Boid: click";
  fill(80, 20, 50);
  text(legend, 10, 10, 150, 120);  
  text("Boids:", 10, 120);
  text(boids.size(), 50, 120);
  if (mousePressed) { //Add boid by clicking.
    boids.add(new Boid(new PVector(mouseX, mouseY)));
  }

  for (Boid boid: boids) { //Cycle through all the boids and to the following for each:
    
    if (predBool) { //Flee from each predator.
      for (Predator pred: preds) { 
        PVector predBoid = pred.getLoc();
        boid.repelForce(predBoid, obstRad);
      }
    }
    if (obsBool) { //Flee from mouse.
      mouse = new PVector(mouseX, mouseY);
      boid.repelForce(mouse, obstRad);
    }
    if (flocking) { //Execute flocking rules.
      boid.flockForce(boids);
    }
    
    boid.display(circle, arrow); //Draw to screen.
    
  }
  for (Predator pred: preds) {
    //Predators use the same flocking behaviour as boids, but they use it to chase rather than flock.
    if (flocking) { 
      pred.flockForce(boids);
      for (Predator otherpred: preds){ //Predators should not run into other predators.
        if (otherpred.getLoc() != pred.getLoc()){
          pred.repelForce(otherpred.getLoc(), 30.0);
        }
      }
    }
    pred.display();
  }

  //Toggle booleans:
  //The boolT condition is there to make sure that one press isn't interpreted as multiple presses.
  if (keyPressed && key=='p' && boolT<40) {
    predBool = !predBool;
    println("pradator:", predBool);
    boolT = 0;
  }
  if (keyPressed && key=='o' && boolT<40) {
    obsBool = !obsBool;
    println("obstacle:", obsBool);
    boolT = 0;
  }
  if (keyPressed && key=='f' && boolT<40) {
    flocking = !flocking;
    println("Flocking:", flocking);
    boolT = 0;
  }
  if (keyPressed && key=='a' && boolT<40) {
    arrow = !arrow;
    println("Arrows:", arrow);
    boolT = 0;
  }
  if (keyPressed && key=='c' && boolT<40) {
    circle = !circle;
    println("circles:", circle);
    boolT = 0;
  }
}


class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  int mass; //to calculate accelerarion and radius of sphere.
  int maxForce = 6; //determines how much effect the different forces have on the acceleration.

  Boid(PVector location) {

    loc = location; //Boids start with given location and no vel or acc.
    vel = new PVector();
    acc = new PVector();
    mass = int(random(5, 10));
  }



  void flockForce(ArrayList<Boid> boids) {
    //The three behaviours that result in flocking; Defined below.
    avoidForce(boids);
    approachForce(boids);
    alignForce(boids);
  }

  void update() {
    //Calculate the next position of the boid.
    vel.add(acc);
    loc.add(vel);
    acc.mult(0); //Reset acc every time update() is called.
    vel.limit(5); //Arbitrary limit on speed.
    //Make canvas doughnut-shaped.
    if (loc.x<=0) {
      loc.x = width;
    }
    if (loc.x>width) {
      loc.x = 0;
    }
    if (loc.y<=0) {
      loc.y = height;
    }
    if (loc.y>height) {
      loc.y = 0;
    }
  }

  void applyF(PVector force) {
    //F=ma
    force.div(mass);
    acc.add(force);
  }

  void display(boolean circle, boolean arrow) {
    update();
    fill(0, 0);
    stroke(0);
    if (circle) {
      ellipse(loc.x, loc.y, mass, mass); //Show boid as circle of radius 'mass'.
    }
    if (arrow) {
      //Draw vel-vector, scaled by arvitrary factor 3.
      line(loc.x, loc.y, loc.x + 3*vel.x, loc.y + 3*vel.y);
      //Uncomment to display arrows instead of lines.
      //    pushMatrix();
      //    translate(loc.x+3*vel.x, loc.y+3*vel.y);
      //    rotate(vel.heading());
      //    line(0, 0, -5, -5);
      //    line(0, 0, -5, 5);
      //    popMatrix();
    }
  }

  void displayCircle() {
    ellipse(loc.x, loc.y, mass, mass); //Show boid as circle of radius 'mass'.
  }
  void displayArrow() {
    //Draw vel-vector, scaled by arvitrary factor 3.
    line(loc.x, loc.y, loc.x + 3*vel.x, loc.y + 3*vel.y);
    //Uncomment to display arrows instead of lines.
    //    pushMatrix();
    //    translate(loc.x+3*vel.x, loc.y+3*vel.y);
    //    rotate(vel.heading());
    //    line(0, 0, -5, -5);
    //    line(0, 0, -5, 5);
    //    popMatrix();
  }

  void avoidForce(ArrayList<Boid> boids) { 
    //Applies a force to the boid that makes 
    //him avoid the average position of other boids.
    float count = 0; //Keep track of how many boids are too close.
    PVector locSum = new PVector(); //To store positions of the ones that are too close.

    for (Boid other: boids) {
      int separation = mass + 20; //Desired separation from other boids. Arbitrarily linked to mass.

      PVector dist = PVector.sub(other.getLoc(), loc); //distance to other boid.
      float d = dist.mag();

      if (d != 0 && d<separation) { //If closer than desired, and not self.
        PVector otherLoc = other.getLoc();
        locSum.add(otherLoc); //All locs from closeby boids are added.
        count ++;
      }
    }
    if (count>0) { //Don't divide by zero.
      locSum.div(count); //Divide by number of positions that were added (to create average).
      PVector avoidVec = PVector.sub(loc, locSum); //AvoidVec connects loc and average loc.
      avoidVec.limit(maxForce*2.5); //Weigh by factor arbitrary factor 2.5.
      applyF(avoidVec);
    }
  }

  void approachForce(ArrayList<Boid> boids) {
    float count = 0; //Keep track of how many boids are within sight.
    PVector locSum = new PVector(); //To store locations of boids in sight.
    //Algorhithm analogous to avoidForve().
    for (Boid other: boids) {

      int approachRadius = mass + 60; //Radius in which to look for other boids.
      PVector dist = PVector.sub(other.getLoc(), loc);
      float d = dist.mag();

      if (d != 0 && d<approachRadius) {
        PVector otherLoc = other.getLoc();
        locSum.add(otherLoc);
        count ++;
      }
    }
    if (count>0) {
      locSum.div(count);
      PVector approachVec = PVector.sub(locSum, loc);
      approachVec.limit(maxForce);
      applyF(approachVec);
    }
  }

  void alignForce(ArrayList<Boid> boids) {

    float count = 0; //Keep track of how many boids are in sight.
    PVector velSum = new PVector(); //To store vels of boids in sight.
    //Algorhithm analogous to approach- and avoidForce.
    for (Boid other: boids) {
      int alignRadius = mass + 100;
      PVector dist = PVector.sub(other.getLoc(), loc);
      float d = dist.mag();

      if (d != 0 && d<alignRadius) {
        PVector otherVel = other.getVel();
        velSum.add(otherVel);
        count ++;
      }
    }
    if (count>0) {
      velSum.div(count);
      PVector alignVec = velSum;
      alignVec.limit(maxForce);
      applyF(alignVec);
    }
  }


  void repelForce(PVector obstacle, float radius) {
    //Force that drives boid away from obstacle.

    PVector futPos = PVector.add(loc, vel); //Calculate future position for more effective behavior.
    PVector dist = PVector.sub(obstacle, futPos);
    float d = dist.mag();


    if (d<=radius) {
      PVector repelVec = PVector.sub(loc, obstacle);
      repelVec.normalize();
      if (d != 0) { //Don't divide by zero.
        float scale = 1.0/d; //The closer to the obstacle, the stronger the force.
        repelVec.normalize();
        repelVec.mult(maxForce*7);
        if (repelVec.mag()<0) { //Don't let the boids turn around to avoid the obstacle.
          repelVec.y = 0;
        }
      }
      applyF(repelVec);
    }
  }



  //Easy way to acces loc and vel for any boid.
  PVector getLoc() {
    return loc;
  }

  PVector getVel() {
    return vel;
  }
}


class Predator extends Boid { //Predators are just boids with some extra characteristics.
  float maxForce = 10; //Predators are better at steering.
  Predator(PVector location, int scope) {
    super(location);
    mass = int(random(8, 15)); //Predators are bigger and have more mass.
  }

  void display() {
    update();
    fill(255, 140, 130);
    noStroke();
    ellipse(loc.x, loc.y, mass, mass);
  }

  void update() { //Same as for boid, but with different vel.limit().
    //Calculate the next position of the boid.
    vel.add(acc);
    loc.add(vel);
    acc.mult(0); //Reset acc every time update() is called.
    vel.limit(6); //Arbitrary limit on speed, hihger for a predator.
    //Make canvas doughnut-shaped.
    if (loc.x<=0) {
      loc.x = width;
    }
    if (loc.x>width) {
      loc.x = 0;
    }
    if (loc.y<=0) {
      loc.y = height;
    }
    if (loc.y>height) {
      loc.y = 0;
    }
  }

  void approachForce(ArrayList<Boid> boids) { //Same as for boid, but with bigger approachRadius.
    float count = 0;
    PVector locSum = new PVector();

    for (Boid other: boids) {

      int approachRadius = mass + 260;
      PVector dist = PVector.sub(other.getLoc(), loc);
      float d = dist.mag();

      if (d != 0 && d<approachRadius) {
        PVector otherLoc = other.getLoc();
        locSum.add(otherLoc);
        count ++;
      }
    }
    if (count>0) {
      locSum.div(count);
      PVector approachVec = PVector.sub(locSum, loc);
      approachVec.limit(maxForce);
      applyF(approachVec);
    }
  }
}



