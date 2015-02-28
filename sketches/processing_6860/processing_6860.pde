
/*Boid object class
* Matt Wetmore
* Changelog
* ---------
* 12/14/09: Started work
* 12/16/09: Revised code to work with forces instead of heading. First steering algorithm implemented
* 12/18/09: Arrival steering behavior
* 12/20/09: Alignment added NEED TO FIX COHESION
* 1/6/10: Finished algorithms. Time to clean up the code!
*/

class Boid
{
  //fields
  PVector pos,vel,acc,ali,coh,sep; //pos, velocity, and acceleration in a vector datatype
  float neighborhoodRadius; //radius in which it looks for fellow boids
  float maxSpeed = 1; //maximum magnitude for the velocity vector
  float maxSteerForce = .05; //maximum magnitude of the steering vector
  float sMod,aMod,cMod; //modifiers for the three forces on the boid
  float h; //hue
  
  //constructors
  Boid(PVector inPos)
  {
    pos = new PVector();
    pos.set(inPos);
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(0,0);
    neighborhoodRadius = 30;
    sMod = 1; aMod = 1; cMod = 4;
  }
  Boid(PVector inPos,PVector inVel,float r)
  {
    pos = new PVector();
    pos.set(inPos);
    vel = new PVector();
    vel.set(inVel);
    acc = new PVector(0,0);
    neighborhoodRadius = r;
  }
  
  void run(ArrayList bl)
  {
    acc.add(avoid(new PVector(mouseX,mouseY),true));
    ali = alignment(bl);
    coh = cohesion(bl);
    sep = seperation(bl);
    if(PVector.dist(new PVector(mouseX,mouseY),pos)>100)
    {
    acc.add(PVector.mult(ali,aMod));
    acc.add(PVector.mult(coh,cMod));
    acc.add(PVector.mult(sep,sMod));
    }
    if(PVector.dist(new PVector(mouseX,mouseY),pos)<50)
      maxSpeed = 2;
    else
    maxSpeed = 1;
    move();
    checkBounds();
    render();
  }
    
  void move()
  {
    vel.add(acc); //add acceleration to velocity
    vel.limit(maxSpeed); //make sure the velocity vector magnitude does not exceed maxSpeed
    pos.add(vel); //add velocity to position
    acc.mult(0); //reset acceleration
  }
  
  void checkBounds()
  {
    if(pos.x>width) pos.x=0;
    if(pos.x<0) pos.x=width;
    if(pos.y>height) pos.y=0;
    if(pos.y<0) pos.y=height;
  }
  
  void render()
  {
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(atan2(vel.y,vel.x)); //rotate drawing matrix to direction of velocity
    stroke(0);
    noFill();
    //ellipse(0,0,neighborhoodRadius*2,neighborhoodRadius*2);
    noStroke();
    fill(h);
    //draw triangle
    beginShape(TRIANGLES);
    vertex(3,0);
    vertex(-3,2);
    vertex(-3,-2);
    endShape();
    popMatrix();
  }
  
  //steering. If arrival==true, the boid slows to meet the target. Credit to Craig Reynolds
  PVector steer(PVector target,boolean arrival)
  {
    PVector steer = new PVector(); //creates vector for steering
    if(!arrival)
    {
      steer.set(PVector.sub(target,pos)); //steering vector points towards target (switch target and pos for avoiding)
      steer.limit(maxSteerForce); //limits the steering force to maxSteerForce
    }
    else
    {
      PVector targetOffset = PVector.sub(target,pos);
      float distance=targetOffset.mag();
      float rampedSpeed = maxSpeed*(distance/100);
      float clippedSpeed = min(rampedSpeed,maxSpeed);
      PVector desiredVelocity = PVector.mult(targetOffset,(clippedSpeed/distance));
      steer.set(PVector.sub(desiredVelocity,vel));
    }
    return steer;
  }
  
  //avoid. If weight == true avoidance vector is larger the closer the boid is to the target
  PVector avoid(PVector target,boolean weight)
  {
    PVector steer = new PVector(); //creates vector for steering
    steer.set(PVector.sub(pos,target)); //steering vector points away from target
    if(weight)
      steer.mult(1/sq(PVector.dist(pos,target)));
    //steer.limit(maxSteerForce); //limits the steering force to maxSteerForce
    return steer;
  }
  
  PVector seperation(ArrayList boids)
  {
    PVector posSum = new PVector(0,0);
    PVector repulse;
    for(int i=0;i<boids.size();i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = PVector.dist(pos,b.pos);
      if(d>0&&d<=neighborhoodRadius)
      {
        repulse = PVector.sub(pos,b.pos);
        repulse.normalize();
        repulse.div(d);
        posSum.add(repulse);
      }
    }
    return posSum;
  }
  
  PVector alignment(ArrayList boids)
  {
    PVector velSum = new PVector(0,0);
    int count = 0;
    for(int i=0;i<boids.size();i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = PVector.dist(pos,b.pos);
      if(d>0&&d<=neighborhoodRadius)
      {
        velSum.add(b.vel);
        count++;
      }
    }
    if(count>0)
    {
      velSum.div((float)count);
      velSum.limit(maxSteerForce);
    }
    return velSum;
  }
  
  PVector cohesion(ArrayList boids)
  {
    PVector posSum = new PVector(0,0);
    PVector steer = new PVector(0,0);
    int count = 0;
    for(int i=0;i<boids.size();i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = dist(pos.x,pos.y,b.pos.x,b.pos.y);
      if(d>0&&d<=neighborhoodRadius)
      {
        posSum.add(b.pos);
        count++;
      }
    }
    if(count>0)
    {
      posSum.div((float)count);
    }
    steer = PVector.sub(posSum,pos);
    steer.limit(maxSteerForce); 
    return steer;
  }
}

