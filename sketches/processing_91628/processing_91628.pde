
/*

Pearlyn Lii
ID 3 
12/28/13
Particle System

An exploration of:
"Crowd Path Following"
Daniel Shiffman <http://www.shiffman.net>
The Nature of Code, Spring 2009
Via Reynolds: http://www.red3d.com/cwr/steer/CrowdPath.html


*/

// A path object (series of connected points)
Path path;

// Two vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(800,800);
  smooth();

  // Call a function to generate new Path object
  newPath();

  // We are now making random vehicles and storing them in an ArrayList
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 220; i++) {
    newVehicle(random(width),random(height));
  }
}

void draw() {
  background(0);
  // Display the path
//  path.display();

  for (Vehicle v : vehicles) {
    // Path following and separation are worked on in this function
    v.applyBehaviors(vehicles,path);
    // Call the generic run method (update, borders, display, etc.)
    v.run();
  }
}

void newPath() {
  // A path is a series of connected points
  // A more sophisticated path might be a curve
  path = new Path();
  float offset = 20;
  path.addPoint(offset,offset);
  path.addPoint(width-offset,offset*2);
  path.addPoint(width+offset,height-offset);
  path.addPoint(width/2,height-offset*6);
  path.addPoint(offset,height-offset);
}

void newVehicle(float x, float y) {
  float maxspeed = random(8,10);
  float maxforce = 0.2;
  vehicles.add(new Vehicle(new PVector(x,y),maxspeed,maxforce));
}



void mousePressed() {
  newVehicle(mouseX,mouseY);
}




class Path {

  // A Path is an arraylist of points (PVector objects)
  ArrayList<PVector> points;
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;

  Path() {
    // Arbitrary radius of 20
    radius = 175;
    points = new ArrayList<PVector>();
  }

  // Add a point to the path
  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    points.add(point);
  }

  // Draw the path
  void display() {
    strokeJoin(ROUND);
    
    // Draw thick line for radius
    stroke(275);
    strokeWeight(radius*.5);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    // Draw thin line for center of path
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
}



// Vehicle class

class Vehicle {

  // All the usual stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    // Constructor initialize all values
  Vehicle( PVector l, float ms, float mf) {
    location = l.get();
    r = 12;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(maxspeed, 0);
  }

  // A function to deal with path following and separation
  void applyBehaviors(ArrayList vehicles, Path path) {
    // Follow path force
    PVector f = follow(path);
    // Separate from other boids force
    PVector s = separate(vehicles);
    // Arbitrary weighting
    f.mult(3);
    s.mult(1);
    // Accumulate in acceleration
    applyForce(f);
    applyForce(s);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }



  // Main "run" function
  public void run() {
    update();
    borders();
    render();
  }


  // This function implements Craig Reynolds' path following algorithm
  // http://www.red3d.com/cwr/steer/PathFollow.html
  PVector follow(Path p) {

    // Predict location 25 (arbitrary choice) frames ahead
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(15);
    PVector predictLoc = PVector.add(location, predict);

    // Now we must find the normal to the path from the predicted location
    // We look at the normal for each line segment and pick out the closest one
    PVector normal = null;
    PVector target = null;
    float worldRecord = 1000000;  // Start with a very high worldRecord distance that can easily be beaten

    // Loop through all points of the path
    for (int i = 0; i < p.points.size(); i++) {

      // Look at a line segment
      PVector a = p.points.get(i);
      PVector b = p.points.get((i+1)%p.points.size()); // Note Path has to wraparound

      // Get the normal point to that line
      PVector normalPoint = getNormalPoint(predictLoc, a, b);

      // Check if normal is on line segment
      PVector dir = PVector.sub(b, a);
      // If it's not within the line segment, consider the normal to just be the end of the line segment (point b)
      //if (da + db > line.mag()+1) {
      if (normalPoint.x < min(a.x,b.x) || normalPoint.x > max(a.x,b.x) || normalPoint.y < min(a.y,b.y) || normalPoint.y > max(a.y,b.y)) {
        normalPoint = b.get();
        // If we're at the end we really want the next line segment for looking ahead
        a = p.points.get((i+1)%p.points.size());
        b = p.points.get((i+2)%p.points.size());  // Path wraps around
        dir = PVector.sub(b, a);
      }

      // How far away are we from the path?
      float d = PVector.dist(predictLoc, normalPoint);
      // Did we beat the worldRecord and find the closest line segment?
      if (d < worldRecord) {
        worldRecord = d;
        normal = normalPoint;
        
        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        dir.normalize();
        // This is an oversimplification
        // Should be based on distance to path & velocity
        dir.mult(25);
        target = normal.get();
        target.add(dir);
        
      }
    }

   

    // Only if the distance is greater than the path's radius do we bother to steer
    if (worldRecord > p.radius) {
      return seek(target);
    } 
    else {
      return new PVector(0, 0);
    }
  }


  // A function to get the normal point from a point (p) to a line segment (a-b)
  // This function could be optimized to make fewer new Vector objects
  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // Vector from a to p
    PVector ap = PVector.sub(p, a);
    // Vector from a to b
    PVector ab = PVector.sub(b, a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    float desiredseparation = r*2;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Vehicle other = (Vehicle) boids.get(i);
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
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
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

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocationity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

      return steer;
  }


  void render() {
    // Simpler boid is just a circle
    fill(255, 90);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, 9, 9);
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    //if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    //if (location.y > height+r) location.y = -r;
  }
}





