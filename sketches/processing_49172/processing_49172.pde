
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
  PVector pos,vel,acc,ali,coh,sep;         // pos, velocity, and acceleration in a vector datatype
  
  int   h;                                 // hue, at birth...
  float maxSpeed;                          // maximum magnitude for the velocity vector
  float sc;                                // scale factor for the render of the boid
  
  float neighborhoodRadius = 100;          // radius in which it looks for fellow boids
  float maxSteerForce      = 0.1;          // maximum magnitude of the steering vector
  float flap               = 0;            // controls the action of wings
  float time               = 0;            // time lapse factor for controlling the shape/behaviour of the boid
  
  boolean avoidWalls;                      // walls
  boolean seekMouse;                       // mouse
  boolean flatBoid;                        // 3D boid...
  boolean boidWings;                       // has wings...
  
  boolean autoColor;                       // will set various colors according to hue, when true...
                                           // false will follow below color settings...
                                           //    
  int boidColor  = color(0,0,255);         // flat boid blue...
  int side1Color = color(255,0,0);         // red sides/belly
  int side2Color = color(255,0,0);         // ...
  int tailColor  = color(0,255,0);         // green tail
  int wingColor  = color(255,255,255);     // white wings
  
  Boid(PVector inPos)
  {
    pos = new PVector();
    pos.set(inPos);
    vel = new PVector(random(-1,1),random(-1,1),random(1,-1));
    acc = new PVector(0,0,0);
    neighborhoodRadius = 100;
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
* Ron Vonk, additions
* Changelog
* ---------
* 13.12.2011: Started work, corrected avoidance and bounds behaviour
*/
  void run(ArrayList bl)
  {
    time+=0.1;                   // adjust time lapse; with this, we can control the shape/behaviour of the bird in time...

    flap = 10*sin(time);         // such as the wing configuration, which follows a sinoïd, in timelapse; comment // out, for steady wings...

    // such as an attractor/avoider:
    // this will draw the flock to an X/Y-mousepointer on our canvas, when activated...
    // when released, it will drive the flock away in a scatter...
    //
    if (seekMouse) { acc.add(steer(mousePos(),true)); }
    //else { acc.add(avoid(mousePos(),true)); }

    // this will force the flock downwards, we add a Y-force each lapse... thus, we can mimic wind-force...
    //
    //acc.add(new PVector(0,.05,0));

    if (avoidWalls)              // steer away from the walls, avoidance factor 7... steep...
    {
      int aF = 7;                // maxSpeed+3 might be a fine compromise
      
      acc.add(PVector.mult(avoid(new PVector(pos.x,ymax,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(pos.x,ymin,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(xmax,pos.y,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(xmin,pos.y,pos.z),true),aF));
      acc.add(PVector.mult(avoid(new PVector(pos.x,pos.y,zmax),true),aF));
      acc.add(PVector.mult(avoid(new PVector(pos.x,pos.y,zmin),true),aF));
    }
    // do, whatever a boid does...
    //
    flock(bl);
    move();
    checkBounds();
    render();
  }
  
  /////-----------behaviors---------------
  
  void flock(ArrayList bl)
  {
    sep = seperation(bl);
    ali = alignment(bl);
    coh = cohesion(bl);
    
    //if (seekMouse) {             // apply flocking behaviour, towards mouse...
      
      acc.add(PVector.mult(sep,1));
      acc.add(PVector.mult(ali,1));
      acc.add(PVector.mult(coh,3));
    //}
    //else {                       // apply flocking behaviour, away from mouse when not in range...
    //
    //  if (PVector.dist(mousePos(),pos)>100) {
    //
    //    acc.add(PVector.mult(sep,1));
    //    acc.add(PVector.mult(ali,1));
    //    acc.add(PVector.mult(coh,3));
    //  }
    //  if (PVector.dist(mousePos(),pos)<50) {
    //    
    //    maxSpeed *= 2;            // too close for comfort: double away...
    //  }
    //  else maxSpeed = _maxSpeed;
    //}
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

      if(pos.x>xmax) pos.x-=xmax;
      if(pos.x<xmin) pos.x+=xmax;
      if(pos.y>ymax) pos.y-=ymax;
      if(pos.y<ymin) pos.y+=ymax;
      if(pos.z>zmax) pos.z-=zmax;
      if(pos.z<zmin) pos.z+=zmax;
    }
    else {                   // we bounce off walls; keep the boids inside the box; consider it ultimate steering...
    
      if(pos.x>xmax) pos.x=xmax-1;
      if(pos.x<xmin) pos.x=1;
      if(pos.y>ymax) pos.y=ymax-1;
      if(pos.y<ymin) pos.y=1;
      if(pos.z>zmax) pos.z=zmax-1;
      if(pos.z<zmin) pos.z=1;
    }  
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    rotateY(atan2(-vel.z,vel.x));
    rotateZ(asin(vel.y/vel.mag()));
    //
    //draw bird
    //
    beginShape(TRIANGLES);
    
    //stroke(boidColor);     // syntax for framed boids...
    //noFill();              // ...
    noStroke();

    fill(boidColor(autoColor,boidColor));
    vertex(3*sc,0,0); vertex(-3*sc,2*sc,0); vertex(-3*sc,-2*sc,0);

    if (!flatBoid) {
      
      fill(boidColor(autoColor,side1Color));
      vertex(3*sc,0,0); vertex(-3*sc,2*sc,0); vertex(-3*sc,0,2*sc);
    
      fill(boidColor(autoColor,side2Color));
      vertex(3*sc,0,0); vertex(-3*sc,0,2*sc); vertex(-3*sc,-2*sc,0);
    
      fill(boidColor(autoColor,tailColor));
      vertex(-3*sc,0,2*sc); vertex(-3*sc,2*sc,0); vertex(-3*sc,-2*sc,0);
      
      // boid wings
      //  
      if (boidWings) {
        
        fill(boidColor(autoColor,wingColor));
        vertex(2*sc,0,0); vertex(-1*sc,0,0); vertex(-1*sc,-8*sc,flap);
        vertex(2*sc,0,0); vertex(-1*sc,0,0); vertex(-1*sc,8*sc,flap);
      }
    }    
    endShape();
    
    //box(10);  // here's another shape...
    
    popMatrix();
  }
  //  
  // set up boid color using h...
  //
  int boidColor(boolean autoSet, int _color)
  {
    color c = _color;   // use incoming color
    
    if (autoSet)        // overrule with hue settings
      switch (h)
      {
        case 0:   c = color(0,0,0); break;
        case 1:   c = color(0,0,255); break;
        case 3:   c = color(0,255,0); break;
        case 7:   c = color(0,255,255); break;
        case 15:  c = color(255,0,0); break;
        case 31:  c = color(255,0,255); break;
        case 63:  c = color(255,255,0); break;
        case 127: c = color(255,255,127); break;
        case 255: c = color(255,255,255); break;
        default:  c = color(255,255,127); break;
      }
      
    return c;    
  }
  //  
  // mouse rendering...
  //
  PVector mousePos()
  {
    //PVector mousePos = new PVector(mouseX,mouseY,0);                  // canvas, backpanel
    //PVector mousePos = new PVector(mouseX,mouseY,zmax);               // frontpanel
    //PVector mousePos = new PVector(mouseX,mouseY,zmax/2);             // halfway
    
    PVector mousePos = new PVector(mouseX,mouseY,(zmax-zmin)*mouseX/(xmax-xmin));     // function of x
    //PVector mousePos = new PVector(mouseX,mouseY,pos.z);
    
    return mousePos;
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
      //
      // ...
      //
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
}


