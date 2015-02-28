
/* @pjs pauseOnBlur=true; 
 */

ArrayList<Body> bodies = new ArrayList<Body>();
Map m;
float sc = 1.5;
boolean follow = false, flocking = false;
int follower = 0;
Body toFollow;
String names[];

void setup() {
  size(640, 480);
  

  names = loadStrings("names.txt");
  for (int i = 0; i < 30; i ++) {
    Body b = new Body(random(width), random(height), names[int(random(0, names.length-1))]);
    b.r = random(10, 20);
    b.age = int(random(0, 1000));
    bodies.add(b);
  }
  m = new Map(width, height);
}


void draw() {
  if (follower > bodies.size() - 1) { 
    follower = 0;
  }
  toFollow = bodies.get(follower);
  if (follow) {
    scale(sc);
    translate((toFollow.location.x - width/(2*sc))*-1, (toFollow.location.y - height/(2*sc))*-1);
  }

  background(200);
  
  m.display();
  for (int i = bodies.size() - 1; i >= 0; i--) {
    Body b = bodies.get(i);
    b.run();

    if (b.pregnant) {
      Body baby = new Body(b.location.x, b.location.y, names[int(random(0, names.length-1))]);
      println(baby.name + " is born");

      bodies.add(baby);
      b.pregnant = false;
    }
    
    if (toFollow != b && !b.alive && bodies.size() > i) {
      println(b.name + " has died of " + (b.age > 4800 ? "old age" : "hunger. RIP."));
      m.regrow(b.location.x, b.location.y);      
      bodies.remove(i);
    }
    
  }
  
  if (bodies.size() > 100) {
    Body b = bodies.get(100);
    println(b.name + " has died. RIP");
    bodies.remove(100);
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  sc += e / 20;
  if (sc > 10) { 
    sc = 10;
  }
  if (sc < 1) { 
    sc = 1;
  }
}

void keyReleased() {
  if (keyCode == 32) { 
    follow = !follow;
  }
  if (keyCode == 76) {
    follower ++;
  }
  if (keyCode == 75) {
    follower --;
  }
  if (follower >= bodies.size()) { 
    follower = 0;
  }
  if (follower < 0) { 
    follower = bodies.size() -1;
  }

  if (keyCode == 78) {
    m = new Map(width, height);
  }
}

void keyPressed() {



  if (keyCode == 38) {
    toFollow.go("up");
  }

  if (keyCode == 40) {
    toFollow.go("down");
  }

  if (keyCode == 37) {
    toFollow.go("left");
  }

  if (keyCode == 39) {
    toFollow.go("right");
  }
}


void mousePressed() {
  m.plant(mouseX, mouseY);
}

class Body {
  PVector location, velocity, acceleration;
  PVector wanderVector, seekVector, obstacleVector;
  float r, maxforce, maxspeed;
  float obstacleWeight = 1.3, seekWeight = .1, wanderWeight = .1, mateWeight = 0;
  float wandertheta = 0;
  String name;
  boolean hungry = true;
  float hunger = random(0, 2);
  float mateTheta = 0;
  int age = 0;
  int bornAt = millis();
  boolean alive = true;
  boolean pregnant = false;
  int lastPregnant = 0;

  Body(float x, float y, String _name) {
    r = 10;
    location = new PVector(x, y);
    maxspeed = random(1, 2);
    maxforce = .1;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    name = _name;
  }

  void update() {
    age ++;
    if ((age > 4800 || hunger > 10) && random(1) > .5 && toFollow != this) { 
      alive = false;
    }


    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    borders();
    acceleration.mult(0);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading2D());
    noStroke();
    fill(100);
    //    ellipse(location.x, location.y, r, r);
    ellipse(0, 0, r, r);

    fill(255, 0, 0);
    //PVector targ = PVector.add(location, PVector.mult(velocity, 15));
    float vel = velocity.mag() * 10;
    ellipse(-vel, 0, 2, 2);
    stroke(100);
    line(-r/2, 0, -vel, 0);

    fill(255);

    ellipse(2, -3, 4, 4);//, location.x + 3, location.y);
    ellipse(2, 3, 4, 4);
    //translate(-location.x, -location.y);

    if (hunger > 5) { 
      fill(200, 0, 0, 100); 
      noStroke();
      ellipse(0, 0, r+3, r+3);
    }

    if (this == toFollow) {
      noStroke();
      fill(0, 150, 255, 100);
      if (hunger > 5) { 
        fill(255, 0, 0, 100);
      }
      ellipse(0, 0, r+6, r+6);
    }

    popMatrix();

    if (this == toFollow) {
      fill(50);
      textSize(10);
      text(name + " (" + hungerToS() + ")", location.x + r, location.y + 2);
    }
  }

  void run() {
    applyBehaviors();
    update();
    display();
  }

  void eat(int x, int y) {
    r += .005;
    m.clearPixel(x, y);
    hunger -= .01;
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  void applyBehaviors() {

    mateWeight = 2.5 - hunger;
    if (mateWeight < 0) { 
      mateWeight = 0;
    }
    PVector mateDance = matingDance();
    mateDance.mult(mateWeight);
    applyForce(mateDance);

    mate();

    hunger += .005;

    if (hunger < 1) {
      mateWeight = 1;
      hungry = false;
    } 
    else {
      mateWeight = 0;
      hungry = true;
    }


    obstacleVector = obstacleSeparation();
    obstacleVector.mult(hungry ? hunger : 3);
    applyForce(obstacleVector);

    wanderVector = wander();
    wanderVector.mult(wanderWeight);
    applyForce(wanderVector);

    PVector sep = separate();
    sep.mult(2.5 - mateWeight);
    applyForce(sep);
  }

  PVector steer(PVector desired) {

    desired.normalize();
    desired.mult(maxspeed);
    PVector steerV = PVector.sub(desired, velocity);
    steerV.limit(maxforce);
    return steerV;
  }

  String hungerToS() {
    String toReturn = "satisfied";
    if (hunger > 1 && hunger < 2) {
      return "peckish";
    } 
    else if (hunger > 2 && hunger < 3) {
      return "hungry";
    } 
    else if (hunger > 3 && hunger < 4) {
      return "famished";
    }
    else if (hunger > 4) {
      toReturn = "starving";
    }

    return toReturn;
  }

  void go(String dir) {
    if (dir == "up") {
      applyForce(new PVector(0, -10));
    }
    if (dir == "down") {
      applyForce(new PVector(0, 10));
    }
    if (dir == "left") {
      applyForce(new PVector(-10, 0));
    }
    if (dir == "right") {
      applyForce(new PVector(10, 0));
    }
  }

  void mate() {
    for (Body b : bodies) {
      if (millis() - lastPregnant > 1000 && millis() - bornAt > 10000 && b != this && location.dist(b.location) < 10 && random(1) > .5) {
        println(name + " and " + b.name + " have mated!");
        //Body baby = new Body(location.x, location.y, names[int(random(0, names.length-1))]);
        //bodies.add(baby);
        pregnant = true;
        lastPregnant = millis();
      }
    }
  }


  PVector matingDance() {
    PVector target = new PVector(width/2 + cos(r + mateTheta) * (width/4 + mateTheta*10), height/2 + sin(r + mateTheta) * (height/4 + mateTheta*10));
    mateTheta += .01;
    return seek(target);
  }

  PVector seekFarthest() {
    float longestDistance = 0;
    Body target = bodies.get(0);
    for (Body b : bodies) {
      if (b != this) {
        float d = location.dist(b.location);
        if (d > longestDistance) { 
          longestDistance = d;
          target = b;
        }
      }
    }
    return seek(target.location);
  }

  PVector seekFatest() {
    PVector target = new PVector();
    float largestBody = 0;
    for (Body b : bodies) {
      if (b != this && b.r > largestBody && location.dist(b.location) < 100) {
        target = b.location;
        largestBody = b.r;
      }
    }
    return seek(target);
  }


  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    return steer(desired);
  }

  PVector wander() {
    float wanderR = 30;         // Radius for our "wander circle"
    float wanderD = 80;         // Distance for our "wander circle"
    float change = 0.3;
    wandertheta += random(-change, change); // Randomly change wander theta

    // Now we have to calculate the new location to steer towards on the wander circle
    PVector circleloc = velocity.get();    // Start with velocity
    circleloc.normalize();                 // Normalize to get heading
    circleloc.mult(wanderD);               // Multiply by distance
    circleloc.add(location);               // Make it relative to boid's location
    float h = velocity.heading2D();        // We need to know the heading to offset wandertheta

    PVector circleOffSet = new PVector(wanderR * cos(wandertheta + h), wanderR * sin(wandertheta + h));
    PVector target = PVector.add(circleloc, circleOffSet);
    return seek(target);
  }

  PVector obstacles() {
    PVector steerV = new PVector();
    PVector target = PVector.add(location, velocity);//velocity.get();

    if (m.blocked(target)) {
      PVector desired = PVector.sub(location, target);
      steerV = PVector.sub(desired, velocity);
      steerV.limit(maxforce);
    }    
    return steerV;
  }

  PVector obstacleSeparation() {
    PVector steerV = new PVector();
    PVector desired = new PVector();
    float sep = r;
    PVector sum = new PVector();
    int count = 0;

    for (int x = int(location.x - sep/2); x < location.x + sep/2; x ++) {
      for (int y = int(location.y - sep/2); y < location.y + sep/2; y ++) {
        if (dist(location.x, location.y, x, y) < sep/2 && m.blocked(x, y)) {
          float d = PVector.dist(location, new PVector(x, y));
          PVector diff;
          if (hungry) {
            diff = PVector.sub(new PVector(x, y), location);
            eat(x, y);
          } 
          else {
            diff = PVector.sub(location, new PVector(x, y));
          }
          diff.normalize();
          diff.div(d); // Weight by distance
          sum.add(diff);
          count++;
        }
      }
    }

    if (count > 0) {
      //println(name + " has a meal");

      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      steerV = PVector.sub(sum, velocity);
      steerV.limit(maxforce);
      //obstacleWeight = 3;
      //wanderWeight = 1;
    } 
    else {
      //obstacleWeight = 0.0;
      //wanderWeight = .1;
    }

    return steerV;
  }


  void flock() {
    PVector sep = separate();   // Separation
    PVector ali = align();      // Alignment
    PVector coh = cohesion();   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }


  // Separation
  // Method checks for nearby boids and steers away
  PVector separate () {
    float desiredseparation = 25.0f;
    PVector steerV = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Body other : bodies) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steerV.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steerV.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steerV.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steerV.normalize();
      steerV.mult(maxspeed);
      steerV.sub(velocity);
      steerV.limit(maxforce);
    }
    return steerV;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align () {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Body other : bodies) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steerV = PVector.sub(sum, velocity);
      steerV.limit(maxforce);
      return steerV;
    } 
    else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion () {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Body other : bodies) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } 
    else {
      return new PVector(0, 0);
    }
  }


  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}


class Map {
  int w, h;
  ArrayList<PVector> coords = new ArrayList<PVector>();
  PGraphics buffer;
  int rows, cols;
  int cellsize = 60;
  color bg = color(240);

  Map(int _w, int _h) {
    w = _w;
    h = _h;
    rows = width/cellsize;
    cols = width/cellsize;
    buffer = createGraphics(w, h);
    writeBuffer();
  }

  boolean blocked(int x, int y) {
    int future = int(y * width + x);
    if (future > 0 && future < buffer.pixels.length && brightness(buffer.pixels[future]) < 230) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean blocked(PVector location) {
    int future = int(location.y * width + location.x);
    if (future > 0 && future < buffer.pixels.length && brightness(buffer.pixels[future]) == 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }

  void clearPixel(int x, int y) {
    buffer.pixels[y * width + x] = bg;
  }

  void writeBuffer() {
    buffer.beginDraw();
    buffer.background(bg);

    buffer.noFill();
    buffer.stroke(0);
    buffer.rect(0, 0, width-1, height-1);

    buffer.noStroke();
    buffer.fill(0, 200, 0, 100);
    for (int x = 0; x < width; x+=cellsize) {
      for (int y = 0; y < height; y+=cellsize) {
        if (random(1) < .1) {
          buffer.ellipse(x, y, cellsize, cellsize);
        }
      }
    }
    buffer.endDraw();
    buffer.loadPixels();
  }

  void regrow(float x, float y) {
    buffer.beginDraw();
    buffer.noStroke();
    buffer.fill(0, 200, 0, 100);
    buffer.ellipse(x, y, cellsize, cellsize);
    buffer.endDraw();
    buffer.loadPixels();
  }

  void plant(float x, float y) {
    regrow(x, y);
  }

  void display() {
    buffer.updatePixels();
    image(buffer, 0, 0, w, h);
  }
}
