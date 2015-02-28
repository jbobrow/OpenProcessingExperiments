
// The Boid class

float centerAvoidanceWeight = 2.0;
float tlumienie = 0.97;
  
class Boid {  
  PVector destination;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rx, ry;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  String word;
  boolean used;
  float sentenceOffset, wordHue;

  Boid(float x, float y, float z, String word) {
    destination = new PVector(0,0,0);
    acceleration = new PVector(0,0,0);
    velocity = new PVector(random(-1,1),random(-1,1),random(-1,1));
    location = new PVector(x,y,z);
    rx = textAscent() + textDescent();
    ry = textWidth(word);
    maxspeed = 4;
    maxforce = 0.06;
    this.word = word;
  }

  void run(Flock flock) {
    if(!step(flock)) return;
    
    //
    // Render
    //
    if(used) {
      fill(bgColor);
      text(word, location.x-1, location.y-1);
      text(word, location.x+2, location.y+2);
      
      colorMode(HSB, 1);
      float newHue = mutatorHue + sentenceOffset;
      newHue -= floor(newHue);
      
      fill(singleColorMutator(activeShadow, newHue));
      text(word, location.x+1, location.y+1);
      fill(singleColorMutator(activeFace, newHue));
      text(word, location.x, location.y);
      
      colorMode(RGB, 255);
    } else {
      int one = (velocity.z < 0) ? -1 : 1;
      fill(inactiveShadow);
      text(word, location.x-one, location.y-one);
      fill(inactiveHighlight);
      text(word, location.x+one, location.y+one);
      fill(location.z + inactiveR, location.z + inactiveG, location.z + inactiveB);
      text(word, location.x, location.y);
    }
  }
  
  boolean step(Flock flock) {
    //
    // Flock
    //
    PVector sep = separate(flock.boids);   // Separation
    PVector ali = align(flock.boids);      // Alignment
    PVector coh = cohesion(flock.boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.5);
    //ali.mult(1.0);
    //coh.mult(1.0);
    acceleration.add(sep);
    acceleration.add(ali);
    acceleration.add(coh);
    
    float w = textWidth(word) / 2;
    
    if (!used && (destination.y!=0) && (
      (location.x < -w) ||
      (location.x > width + w) ||
      (location.y < -20) ||
      (location.y > height + 20)
    )) {
      flock.boidsToRemove.add(this);
      return false;
    }
    
    if (destination.y!=0) {
      PVector dest = goDestination();
      dest.mult(4.0);
      acceleration.add(dest);
    } else {
      PVector cen = avoidCenter();     // Avoid center of the scene
      PVector bor = avoidBorder();     // Avoid border of the scene
      cen.mult(centerAvoidanceWeight);
      bor.mult(3.0);
      acceleration.add(cen);
      acceleration.add(bor);
    }
    // Add the force vectors to acceleration
    
    //
    // Update
    //
    velocity.add(acceleration); // Update velocity
    if(!used)
      velocity.limit(maxspeed);   // Limit speed
    else
      velocity.mult(tlumienie);
    location.add(velocity);
    acceleration.mult(0);       // Reset accelertion to 0 each cycle
    
    if(used && (destination.dist(location) < 3) && (velocity.mag() < 0.8)) {
      ++flock.atDestination;
    }
    
    return true;
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);  // A vector pointing from the location to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = ry;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      PVector va = new PVector(location.x, location.y);
      PVector vb = new PVector(other.location.x, other.location.y);
      float d = PVector.dist(va,vb);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(va,vb);
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

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = ry+rx;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0,0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = ry+rx;
    PVector sum = new PVector(0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } else {
      return new PVector(0,0);
    }
  }

  // Fly to destination point
  PVector goDestination () {
    PVector steer = PVector.sub(destination, location);
    
    steer.normalize();
    steer.mult(maxspeed);
    steer.sub(velocity);
    steer.limit(maxforce);
    
    return steer;
  }

  // Scene center avoidance
  PVector avoidCenter () {
    float x = location.x * 2 / width - 1;
    float y = location.y * 2 / height - 1;
    float z = location.z / 100;
    float d = sqrt(sq(x) + sq(y));
    if(d >= 1) return new PVector(0,0,0);
    
    PVector steer = new PVector(width / 2, height / 2, 0);
    steer.sub(location);
    steer.normalize();
    steer.mult(-1);
    steer.mult(maxspeed);
    steer.sub(velocity);
    steer.limit(maxforce);
    steer.mult(sq(1 - d));
    
    return steer;
  }

  // Scene border avoidance
  PVector avoidBorder () {
    float margin = 30.0;
    PVector steer = new PVector(0,0,0);
    
    if(location.x < margin) {
      steer.x = sq((margin - location.x) / margin);
    } else if(width - location.x <= margin) {
      steer.x = -sq((width - location.x - 1 - margin) / margin);
    }
    
    if(location.y < margin) {
      steer.y = sq((margin - location.y) / margin);
    } else if(height - location.y <= margin) {
      steer.y = -sq((height - location.y - 1 - margin) / margin);
    }
    
    if(location.z < -50 + margin) {
      steer.z = sq( location.z + 50 - margin ); 
    } else if(location.z > 50 - margin) {
      steer.z = -sq( location.z - 50 + margin );
    }
    

    steer.mult(maxspeed);
    steer.limit(maxforce);
    return steer;
  }
}


