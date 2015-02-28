
/*Boid object class
* Matt Wetmore, full credits
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
  PVector pos,vel,acc;                     // position, velocity, and acceleration in a vector datatype
  float   neighborhoodRadius;              // radius in which it looks for fellow boids
  float   maxSteerForce;                   // maximum magnitude of the steering vector
  float   time;                            // time lapse factor for controlling the shape/behaviour of the boid
  
  int   h;                                 // hue, at birth...
  float maxSpeed;                          // maximum magnitude for the velocity vector
  float sc;                                // scale factor for the render of the boid
  
  boolean avoidWalls;                      // walls
  boolean seekMouse;                       // mouse
  boolean flatBoid;                        // 3D boid...
  boolean boidWings;                       // has wings...
  boolean autoColor;                       // will set various colors according to h setting, when true...
                                           // false will follow class color settings...
  float xPos;
  float yPos;
  float zPos;
  float rY;
  float rX;
  float rZ;
  float sC;
  float fL;
    
  Boid(PVector inPos)
  {
    pos = new PVector();
    pos.set(inPos);
    vel = new PVector(random(-1,1),random(-1,1),random(1,-1));
    acc = new PVector(0,0,0);
    neighborhoodRadius = 100;
    maxSteerForce      = 0.1;
    time               = 0;
  }
  //Boid(PVector inPos,PVector inVel,float r)
  //{
  //  pos = new PVector();
  //  pos.set(inPos);
  //  vel = new PVector();
  //  vel.set(inVel);
  //  acc = new PVector(0,0);
  //  neighborhoodRadius = r;
  //}
  
/*Boid object class
* Ron Vonk, additions; copyright rvonk.nl
* Changelog
* ---------
* 13.12.2011: Started work, corrected attracting/avoidance and bounds behaviour
*/
  void run(ArrayList bl)
  {
    // do, whatever a boid does...
    //
    runAttractors();
    runAvoiders();

    flock(bl);
    move();
    checkBounds();
    render(true);
  }
  
  void sandBox()
  {
    render(false);
  }
  
  /////-----------behaviors---------------
  
  void runAttractors()
  {
    // add attractors:
    // this will draw the flock to an X/Y-mousepointer on our canvas, when activated...
    // when released, it will drive the flock away in a scatter...
    //
    if (seekMouse) acc.add(steer(sem.mouse.mousePos(),true));
    
    // this will force the flock downwards, we add a Y-attractor each lapse... thus, we can mimic wind-force...
    //
    //acc.add(new PVector(0,.05,0));
    //
  }
  
  void runAvoiders()
  {
    // add avoiders:
    //
    //if (!seekMouse) acc.add(avoid(sem.mouse.mousePos(),true));
    
    //if (!seekMouse) {
    //
    //  if (PVector.dist(sem.mouse.mousePos(),pos)>100)
    //  { 
    //    apply flocking behaviour, away from mouse when not in range...
    //  }
    //  if (PVector.dist(sem.mouse.mousePos(),pos)<50) {
    //    
    //    maxSpeed *= 2;            // too close for comfort: double away...
    //  }
    //  else maxSpeed = cMaxSpeed;
    //}

    if (avoidWalls)                 // steer away from the walls, steep...
    {
      float aF = maxSpeed+3;        //  might be a fine compromise for an avoidance factor...
      
      acc.add(PVector.mult(avoid(new PVector(pos.x,canvas.ymax,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(pos.x,canvas.ymin,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(canvas.xmax,pos.y,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(canvas.xmin,pos.y,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(pos.x,pos.y,canvas.zmax),true),aF));
      acc.add(PVector.mult(avoid(new PVector(pos.x,pos.y,canvas.zmin),true),aF));
    }
  }
  
  void flock(ArrayList bl)
  {
    acc.add(PVector.mult(seperation(bl),1));
    acc.add(PVector.mult(alignment(bl),1));
    acc.add(PVector.mult(cohesion(bl),3));
  }
  
  void scatter()
  {
  // obviously, scatter is the opposite method of flock...
  // just replace steer, with avoid...
  //  
  }
  ////------------------------------------
    
  void move()
  {
    vel.add(acc);            // add acceleration to velocity
    vel.limit(maxSpeed);     // make sure the velocity vector magnitude does not exceed maxSpeed
    pos.add(vel);            // add velocity to position
    acc.mult(0);             // reset acceleration
  }
  
  void checkBounds()
  {
    if (!avoidWalls) {       // we fly through walls, just mirror; we need an update of the flock to change the boundaries...

      if(pos.x>canvas.xmax) pos.x-=canvas.xmax;
      if(pos.x<canvas.xmin) pos.x+=canvas.xmax;
      if(pos.y>canvas.ymax) pos.y-=canvas.ymax;
      if(pos.y<canvas.ymin) pos.y+=canvas.ymax;
      if(pos.z>canvas.zmax) pos.z-=canvas.zmax;
      if(pos.z<canvas.zmin) pos.z+=canvas.zmax;
    }
    else {                   // we bounce off walls; keep the boids inside the box; consider it ultimate steering...
    
      if(pos.x>canvas.xmax) pos.x=canvas.xmax-1;
      if(pos.x<canvas.xmin) pos.x=1;
      if(pos.y>canvas.ymax) pos.y=canvas.ymax-1;
      if(pos.y<canvas.ymin) pos.y=1;
      if(pos.z>canvas.zmax) pos.z=canvas.zmax-1;
      if(pos.z<canvas.zmin) pos.z=1;
    }  
  }
  
  void render(boolean renderFlock)
  {
    // standard running behaviour...
    //
    xPos = pos.x;
    yPos = pos.y;
    zPos = pos.z;
    rY   = atan2(-vel.z,vel.x);
    rX   = 0;
    rZ   = asin(vel.y/vel.mag());
    sC   = sc;
    
    time+=0.1;              // adjust time lapse; with this, we can control the shape/behaviour of the bird in time...
    fL   = sin(time);       // such as the wing configuration, which follows a sinoïd, in timelapse; comment // out, for steady wings...

    pushMatrix();

    if (!renderFlock)       // called from sandBox method; we also listen to mouse action...
    {
      xPos = (canvas.xmax-canvas.xmin)/2;
      yPos = (canvas.ymax-canvas.ymin)/2;
      zPos = (canvas.zmax-canvas.zmin)/2;
      rY   = canvas.rY();
      rX   = canvas.rX();
      rZ   = rY/rX;
      sC   = 15*sC;
      fL   = 15*fL;
    }  
    translate(xPos,yPos,zPos);
    rotateY(rY);
    rotateZ(rZ);
    
    drawShape();    //draw bird
    
    popMatrix();
  }
  //  
  // steering... if arrival==true, the boid slows down to meet the target. Credit to Craig Reynolds
  //
  PVector steer(PVector target,boolean arrival)
  {
    PVector steer = new PVector();          // creates vector for steering
    if(!arrival)
    {
      steer.set(PVector.sub(target,pos));   // steering vector points towards target (switch target and pos for avoiding) <<<<<<<<<<<<<<<<<!!!!
      steer.limit(maxSteerForce);           // limits the steering force to maxSteerForce
    }
    else
    {
      PVector targetOffset = PVector.sub(target,pos);
      float   distance     = targetOffset.mag();
      float   rampedSpeed  = maxSpeed*(distance/100);
      float   clippedSpeed = min(rampedSpeed,maxSpeed);
      PVector desiredVel   = PVector.mult(targetOffset,(clippedSpeed/distance));
      steer.set(PVector.sub(desiredVel,vel));
    }
    return steer;
  }
  //
  // avoiding.. if weight == true avoidance vector is larger the closer the boid is to the target
  //
  PVector avoid(PVector target,boolean weight)
  {
    PVector steer = new PVector();                  // creates vector for steering
    steer.set(PVector.sub(pos,target));             // steering vector points away from target
    if(weight)
      steer.mult(1/sq(PVector.dist(pos,target)));
      steer.limit(maxSteerForce);                   // limits the steering force to maxSteerForce times 2, heavy steering allowed
    return steer;
  }
  
  PVector seperation(ArrayList boids)
  {
    PVector posSum = new PVector(0,0,0);
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
    PVector velSum = new PVector(0,0,0);
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
    PVector posSum = new PVector(0,0,0);
    PVector steer = new PVector(0,0,0);
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

  void drawShape()
  {
    beginShape(TRIANGLES);
    
    if (flatBoid) {
      
      noFill();                                                                // syntax for framed boids...
      
      stroke(new Color(h).set(autoColor,'f'));                             // boids back...
      vertex(3*sC,0,0); vertex(-3*sC,2*sC,0); vertex(-3*sC,-2*sC,0);

      stroke(new Color(h).set(autoColor,'t'));                             // boids tail...
      vertex(-3*sC,0,2*sC); vertex(-3*sC,2*sC,0); vertex(-3*sC,-2*sC,0);
    }  
    else {
      
      // noStroke();                                                           // more lines...

      fill(new Color(h).set(autoColor,'f'));                               // boids back...
      vertex(0,2*sC,0); vertex(0,-2*sC,0); vertex(-9*sC,0,0);

      fill(new Color(h).set(autoColor,'t'));                               // boids tail...
      vertex(-9*sC,3*sC,0); vertex(-6.5*sC,0.5*sC,0); vertex(-9*sC,0,0);
      vertex(-9*sC,-3*sC,0); vertex(-6.5*sC,-0.5*sC,0); vertex(-9*sC,0,0);
      
      fill(new Color(h).set(autoColor,'l'));                               // boids belly left...
      //vertex(3*sC,0,0); vertex(-3*sC,2*sC,0); vertex(-3*sC,0,2*sC);
      vertex(0,2*sC,0); vertex(2*sC,0,-2*sC); vertex(-9*sC,0,0);
    
      fill(new Color(h).set(autoColor,'r'));                               // boids belly right...
      //vertex(3*sC,0,0); vertex(-3*sC,0,2*sC); vertex(-3*sC,-2*sC,0);
      vertex(0,-2*sC,0); vertex(2*sC,0,-2*sC); vertex(-9*sC,0,0);
    
      fill(new Color(h).set(autoColor,'b'));                               // boids beak...
      vertex(0,2*sC,0); vertex(0,-2*sC,0); vertex(2*sC,0,-2*sC);
      
    }
    endShape();
    
    if (boidWings) {
        
      fill(new Color(h).set(autoColor,'w'));
      //vertex(2*sC,0,0); vertex(-1*sC,0,0); vertex(-1*sC,-8*sC,fL);
      beginShape();
      //vertex(0,2*sC,0); vertex(0,6*sC,0); vertex(-1*sC,9*sC,0); vertex(-3*sC,7*sC,0); vertex(-4.5*sC,1*sC,0);
      vertex(0,2*sC,0); vertex(0,6*sC,5*fL); vertex(-1*sC,9*sC,8*fL); vertex(-3*sC,7*sC,8*fL); vertex(-4.5*sC,1*sC,0);
      endShape(CLOSE); 
      //vertex(2*sC,0,0); vertex(-1*sC,0,0); vertex(-1*sC,8*sC,fL);
      beginShape();
      //vertex(0,-2*sC,0); vertex(0,-6*sC,0); vertex(-1*sC,-9*sC,0); vertex(-3*sC,-7*sC,0); vertex(-4.5*sC,-1*sC,0);
      vertex(0,-2*sC,0); vertex(0,-6*sC,5*fL); vertex(-1*sC,-9*sC,8*fL); vertex(-3*sC,-7*sC,8*fL); vertex(-4.5*sC,-1*sC,0);
      endShape(CLOSE); 

    }
    //box(10);  // here's another shape...
  }

}


