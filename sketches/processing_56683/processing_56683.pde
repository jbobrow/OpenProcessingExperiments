
// Flocking
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009
// Boid class
// Methods for Separation, Cohesion, Alignment added
// Modified by Paul Hertz

import java.util.ArrayList;
import com.ignotus.aifile.*;

public class Boid {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float mass = 1.0f;
  PApplet parent;
  float separationWeight = 1.5f;
  float cohesionWeight = 1.0f;
  float alignmentWeight = 1.0f;
  /** desired separation between boids */
  float separationDistance = 24.0f;
  /** radius within which we look for neighbors */
  float alignmentDistance = 80.0f;
  /** radius to center of flock  */
  float cohesionDistance = 120.f;

  /**
   * @param parent   a PApplet instance
   * @param l        location of Boid instance
   * @param ms       maximum speed
   * @param mf       maximum force
   */
  public Boid(PApplet parent, PVector l, float ms, float mf) {
    this.parent = parent;
    acc = new PVector(0,0);
    vel = new PVector(parent.random(-1,1),parent.random(-1,1));
    loc = l.get();
    r = 2.0f;
    maxspeed = ms;
    maxforce = mf;
  }

  /**
   * Drives the boid by calling flock(), update(), borders() and render(), in that order.
   * @param boids   an array of Boids in the flock
   */
  public void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  // We accumulate a new acceleration each time based on three rules
  public void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(separationWeight);
    ali.mult(alignmentWeight);
    coh.mult(cohesionWeight);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }

  // Method to update location
  public void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  public void seek(PVector target) {
    acc.add(steer(target,false));
  }

  public void arrive(PVector target) {
    acc.add(steer(target,true));
  }


  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  public PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) {
        desired.mult(maxspeed * (d/100.0f)); // This damping is somewhat arbitrary
      }
      else {
        desired.mult(maxspeed);
      }
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0);
    }
    return steer;
  }

  public void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + PApplet.radians(90);
    parent.fill(175);
    parent.stroke(0);
    parent.strokeWeight(1.0f);
    parent.pushMatrix();
    parent.translate(loc.x,loc.y);
    parent.rotate(theta);
    parent.beginShape(PApplet.TRIANGLES);
    parent.vertex(0, -r*2);
    parent.vertex(-r, r*2);
    parent.vertex(r, r*2);
    parent.endShape();
    parent.popMatrix();
  }

  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = parent.width+r;
    if (loc.y < -r) loc.y = parent.height+r;
    if (loc.x > parent.width + r) loc.x = -r;
    if (loc.y > parent.height + r) loc.y = -r;
  }
  
  public void applyForce(PVector force) {
      PVector f = PVector.div(force, mass);
      acc.add(f);
  }

  // Separation
  // Method checks for nearby boids and steers away
  public PVector separate (ArrayList<Boid> boids) {
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < separationDistance)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc,other.loc);
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
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  public PVector align (ArrayList<Boid> boids) {
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < alignmentDistance)) {
        steer.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }
    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  public PVector cohesion (ArrayList<Boid> boids) {
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < cohesionDistance)) {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return steer(sum,false);  // Steer towards the location
    }
    return sum;
  }

  
  
  /**
   * @return the loc
   */
  public PVector getLoc() {
    return loc;
  }

  /**
   * @param loc the loc to set
   */
  public void setLoc(PVector loc) {
    this.loc = loc;
  }

  /**
   * @return the mass
   */
  public float getMass() {
    return mass;
  }

  /**
   * @param mass the mass to set
   */
  public void setMass(float mass) {
    this.mass = mass;
  }

  /**
   * @return the separationWeight
   */
  public float getSeparationWeight() {
    return separationWeight;
  }

  /**
   * @param separationWeight the separationWeight to set
   */
  public void setSeparationWeight(float separationWeight) {
    this.separationWeight = separationWeight;
  }

  /**
   * @return the cohesionWeight
   */
  public float getCohesionWeight() {
    return cohesionWeight;
  }

  /**
   * @param cohesionWeight the cohesionWeight to set
   */
  public void setCohesionWeight(float cohesionWeight) {
    this.cohesionWeight = cohesionWeight;
  }

  /**
   * @return the alignmentWeight
   */
  public float getAlignmentWeight() {
    return alignmentWeight;
  }

  /**
   * @param alignmentWeight the alignmentWeight to set
   */
  public void setAlignmentWeight(float alignmentWeight) {
    this.alignmentWeight = alignmentWeight;
  }

  /**
   * @return the separationDistance
   */
  public float getSeparationDistance() {
    return separationDistance;
  }

  /**
   * @param separationDistance the separationDistance to set
   */
  public void setSeparationDistance(float separationDistance) {
    this.separationDistance = separationDistance;
  }

  /**
   * @return the alignmentDistance
   */
  public float getAlignmentDistance() {
    return alignmentDistance;
  }

  /**
   * @param alignmentDistance the alignmentDistance to set
   */
  public void setAlignmentDistance(float alignmentDistance) {
    this.alignmentDistance = alignmentDistance;
  }

  /**
   * @return the cohesionDistance
   */
  public float getCohesionDistance() {
    return cohesionDistance;
  }

  /**
   * @param cohesionDistance the cohesionDistance to set
   */
  public void setCohesionDistance(float cohesionDistance) {
    this.cohesionDistance = cohesionDistance;
  }
  
}


