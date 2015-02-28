
ArrayList<Flock> allFlocks;
ArrayList<Dot> allDots;
int nDots;

void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  noStroke();

  nDots = 50;

  allFlocks = new ArrayList<Flock>();

  allDots = new ArrayList<Dot>();
  for (int i=0; i<nDots; i++) {
    float x = random(width);
    float y = random(height);
    float s = random(0, 100);
    Dot d = new Dot(x, y, s, 10);
    allDots.add(d);
  }
}

void draw() {
  background(0, 0, 100);

  for (int i=0; i<allDots.size(); i++) {
    Dot ithDot = allDots.get(i);
    Flock iFlock = ithDot.flock;
    PVector ip = ithDot.position;
    
    float shadeDiff = iFlock.avgShade - ithDot.shade;
    if (shadeDiff>1.0) {
      ithDot.shade+=(shadeDiff*ithDot.agreeableness/100.0);
    }

    if (iFlock.stdev>(40.0*ithDot.openness)) {
      iFlock.removeDot(ithDot);
      if (iFlock.flockSize()==0) {
        allFlocks.remove(iFlock);
      }
      Flock fnew = new Flock();
      fnew.addDot(ithDot);
      ithDot.flock = fnew;
    }
    else {
      for (int j=0; j<i; j++) {
        Dot jthDot = allDots.get(j);
        Flock jFlock = jthDot.flock;
        PVector jp = jthDot.position;

        float dx = ip.x-jp.x;
        float dy = ip.y-jp.y;
        float dh = sqrt(dx*dx+dy*dy);

        if (dh > ithDot.radius && dh<ithDot.radius*20) {

          float componentInX = dx/dh;
          float componentInY = dy/dh;
          float proportionToDistanceSquared = 1.0/(dh*dh);

          float attraction = ithDot.checkCompatibility(jthDot.flock.avgShade);

          if (attraction<ithDot.openness*proportionToDistanceSquared*20
          && jFlock.stdev<(30.0*ithDot.openness)) {
            iFlock.removeDot(ithDot);
            jFlock.addDot(ithDot);

            ithDot.flock = jFlock;

            if (iFlock.flockSize()==0) {
              allFlocks.remove(iFlock);
            }
          }
        }
      }
    }
  }

  for (Flock f: allFlocks) {
    f.run();
  }
  
  fill(0,0,0);
  text ("# of Flocks: "  + str(allFlocks.size()), 5,15); 
}


void keyPressed() {
  if (key=='r' || key=='R') {
    allFlocks.clear();
    allDots.clear();
    for (int i=0; i<nDots; i++) {
      float x = random(width);
      float y = random(height);
      float s = random(0, 100);
      Dot d = new Dot(x, y, s, 10);
      allDots.add(d);
    }
  }
}


class Dot {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float shade;
  float radius;
  float maxforce;
  float maxspeed;
  ArrayList<Dot> group; //prioritized members of group this Dot associates with
  //The following are the Dot's characteristics
  float agreeableness; //probability of going w/ flow of group
  float extraversion; //probability of associating with other Dots
  float openness; //probability of being interested in a different color
  float spontaneity; //probability of randomly going off somewhere
  
  Flock flock;

  Dot (float x, float y, float s, float rad) {
    position = new PVector(x, y);

    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));
    
    acceleration = new PVector(0, 0);

    shade = s;
    
    radius = rad;

    maxspeed = 1.0;
    maxforce = 0.01;

    group = new ArrayList<Dot>();
    flock = new Flock();
    flock.addDot(this);

    agreeableness = random(0, 1.0);
    extraversion = random(0, 1.0);
    openness = random(0, 1.0); 
    spontaneity = random(0, 1.0);
    
//    println(str(shade)+"   "+str(openness));
  }

  float checkCompatibility (float s) {
    float lower = min(s, shade);
    float higher = max(s, shade);
    float shadeDist = min(higher-lower,(100-higher)+lower);
    float distRatio = abs(shadeDist)/100;
    return distRatio;
  }
  
  void updateFlock(Flock f) {
    flock = f;
  }

  void run(ArrayList<Dot> dots) {
    flock(dots);
    update();
    handleBoundaries();
    render();
  }

  void handleBoundaries() {
    if (position.x > width+radius ) position.x -= width;
    if (position.x < 0-radius     ) position.x += width;
    if (position.y > height+radius) position.y -= height;
    if (position.y < 0-radius     ) position.y += height;
  }

  void applyForce (PVector force) {
    acceleration.add(force);
  }

  //From Flocking by Daniel Shiffman
  //http://processing.org/examples/flocking.html
  void flock(ArrayList<Dot> dots) {
    PVector sep = separate(allDots);
    PVector ali = align(dots);
    PVector coh = cohesion(dots);
    sep.mult(1.5);
    coh.mult(1.0);
    ali.mult(1.0);

    applyForce(sep);
    applyForce(coh);
    applyForce(ali);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    // Scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  // Separation
  // Method checks for nearby dots and steers away
  PVector separate (ArrayList<Dot> dots) {
    float desiredseparation = 15.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every dot in the system, check if it's too close
    for (Dot other : dots) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // steer.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby dot in the system, calculate the average velocity
  PVector align (ArrayList<Dot> dots) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Dot other : dots) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // sum.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby dots, calculate steering vector towards that position
  PVector cohesion (ArrayList<Dot> dots) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Dot other : dots) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } 
    else {
      return new PVector(0, 0);
    }
  }

  void render() {
    fill(shade,100,100);
    ellipse(position.x, position.y, radius, radius);
  }
}


class Flock {
  ArrayList<Dot> dots;
  float avgShade;
  float pcx;
  float pcy;
  float stdev;
  
  Flock() {
    dots = new ArrayList<Dot>();
    avgShade = 0;
    pcx = 0;
    pcy = 0;
    stdev = 0;
    allFlocks.add(this);
  }
  
  void updateInfo(){
    float newx = 0;
    float newy = 0;
    int n = dots.size();
    float tempsum = 0;
    float totalShade = avgShade*n;
    for (Dot d: dots) {
      PVector pos = d.position;
      newx+=pos.x;
      newy+=pos.y;
      
      tempsum+=pow((totalShade-d.shade),2);
    }
    
    pcx = newx/dots.size();
    pcy = newy/dots.size();
    
    stdev = sqrt(tempsum/n);
  }
  
  void addDot(Dot d) {
    //Using previous numbers to calculate new avgs for runtime 
    int n0 = dots.size();
    float totShade0 = avgShade*n0;
    int n = n0+1;
    float totShade = totShade0+d.shade;
    //Update the avg
    avgShade = totShade/n;
    
    d.updateFlock(this);
    dots.add(d);
  }
  
  void removeDot(Dot d) {
    //Using previous numbers to calculate new avgs for runtime 
    int n0 = dots.size();
    float totShade0 = avgShade*n0;
    int n = n0-1;
    float totShade = totShade0-d.shade;
    //Update the avg
    avgShade = totShade/n;
    
    dots.remove(d);
  }
  
  int flockSize() {
    return dots.size();
  }
  
  void run() {
    for (Dot d: dots) {
      d.run(dots);
    }
  }
}
