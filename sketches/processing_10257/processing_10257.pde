
class Algorithm {  
  public float centerWeight = 0.001f;
  public float minDistanceWeight = 0.1f;
  public float averageVelocityWeight = 0.1f;
  public float randomWeight = 1f;
  public float towardsPointWeight = 0.01f;
  public float momentumWeight = 1f;
  public float awayMouseWeight = 0.11f;
  public PVector attractionPoint;
  
  // TODO : add more away/attraction points
  
  public Algorithm() {
    attractionPoint = new PVector(random(width), random(height));
  }
  
  public void updateBoids(Boid [] bs) {
    PVector [] vs = new PVector[bs.length];
    for(int i = 0; i < bs.length; i++) {
      vs[i] = bs[i].velocity;
    }
    
    // update average velocities
    for(int i = 0; i < bs.length; i++) {
      Boid b = bs[i];
      Boid [] vb = visibleBoids(bs, b);
      if(vb.length > 0) {        
        PVector av = averageHeading(vb, b);
        av.mult(averageVelocityWeight);

        vs[i].add(av);
      }
    }
    
    // update centroid
    for(int i = 0; i < bs.length; i++) {
      Boid b = bs[i];
      Boid [] vb = visibleBoids(bs, b);
      if(vb.length > 0) {

        PVector ap = cohesion(vb, b);
        ap.mult(centerWeight);
        vs[i].add(ap);
      }
    }
    
    // update min move distance
    for(int i = 0; i < bs.length; i++) {
      Boid b = bs[i];
      Boid [] vb = visibleBoids(bs, b);
      if(vb.length > 0) {        
        PVector minMoveDistance = calculateMinDistance(vb, b);
        minMoveDistance.mult(minDistanceWeight);
        vs[i].sub(minMoveDistance);
      }
    }
    
    // towards a point
    for(int i = 0; i < bs.length; i++) {
      Boid b = bs[i];      
      PVector towardsPoint = towardsPoint(b, attractionPoint);
      towardsPoint.mult(towardsPointWeight);
      vs[i].add(towardsPoint);
    }
    
    // away from a point
    for(int i = 0; i < bs.length; i++) {
      Boid b = bs[i];      
      PVector ap = awayPoint(b, attractionPoint);
      ap.mult(awayMouseWeight);
      vs[i].add(ap);
    }
        
    // away from mouse
    for(int i = 0; i < bs.length; i++) {
      Boid b = bs[i];
      PVector awayPoint = awayMousePoint(b);
      awayPoint.mult(awayMouseWeight);
      vs[i].add(awayPoint);
    }
    
    // momentum
    for(int i = 0; i < bs.length; i++) {
      PVector m = momentum(bs[i]);
      m.mult(momentumWeight);
      vs[i].add(m);
    }
    
    // clamp velocities
    for(int i = 0; i < bs.length; i++) {
      Boid b = boids[i];
      vs[i].limit(b.maxVelocity);
      b.velocity = vs[i];
    }
    
    // update positions
    for(int i = 0; i < bs.length; i++) {
      bs[i].position.add(bs[i].velocity);
    }
  }
  
  // do not include the given boid in the array
  public PVector cohesion(Boid [] boids, Boid b) {
    // calculate the centeroid of the boid flock
    PVector center = new PVector();
    for(int i = 0; i < boids.length; i++) {
      center.add(boids[i].position);
    }
    center.div(boids.length);
    center.sub(b.position);
    return center;
  }
  
  // do not include the given boid in the array
  public PVector calculateMinDistance(Boid [] boids, Boid b) {
    // calculate distance we should move if too close to neighbors
    PVector offset = new PVector();
    for(int i = 0; i < boids.length; i++) {
      Boid cb = boids[i];
      if(b.position.dist(cb.position) < b.minDistance) {
        offset.sub(b.position);
        offset.add(cb.position);      
      }
    }
    return offset;
  }
  
  // do not include the given boid in the array
  public PVector averageHeading(Boid [] boids, Boid b) {
    PVector velocity = new PVector();
    // calculate average velocity of neighbors
    for(int i = 0; i < boids.length; i++) {
      velocity.add(boids[i].velocity);
    }
    velocity.div(boids.length);
    
    // remove our current velocity
    velocity.sub(b.velocity);
    
    return velocity;
  }
  
  public PVector randomVelocity(Boid b) {
    float f = b.maxVelocity;
    return PVector.add(new PVector(random(-f, f), random(-f, f), 0.0f), b.velocity);
  }
  
  public PVector towardsPoint(Boid b, PVector p) {
    PVector a;
    a = PVector.sub(p, b.position);
    return a;
  }

  public PVector awayPoint(Boid b, PVector p) {
    PVector m = new PVector(p.x, p.y, p.z);
    if(m.dist(b.position) < b.visionRange) {
      m.sub(b.position);
      m.mult(-1);
      return m;
    }
    return new PVector();
  }

  public PVector awayMousePoint(Boid b) {
    PVector m = new PVector(mouseX, mouseY, 0);
    if(m.dist(b.position) < b.visionRange) {
      m.sub(b.position);
      m.mult(-1);
      return m;
    }
    return new PVector();
  }

  public PVector momentum(Boid b) {
    return b.velocity.get();
  }
  
  public Boid [] visibleBoids(Boid [] boids, Boid b) {
    ArrayList a = new ArrayList();
    for(int i = 0; i < boids.length; i++) {
      Boid cb = boids[i];
      if(cb != b && cb.position.dist(b.position) < b.visionRange)
        a.add(cb);
    }
    
    Boid [] vb = new Boid[a.size()];
    for(int i = 0; i < a.size(); i++) {
      vb[i] = (Boid)a.get(i);
    }
    
    return vb;
  }
}

