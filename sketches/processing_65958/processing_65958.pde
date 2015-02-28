
class Boid
{
  //fields
  PVector pos, vel, acc; //pos, velocity, and acceleration in a vector datatype
  PVector initPos;
  float maxSpeed; //maximum magnitude ofr the velocity vector
  float maxSteerForce; //maximum magnitude of the steering vector
  color c; //color

  //constructors
  Boid(PVector inPos, color ic)
  {
    pos = new PVector();
    pos.set(inPos);
    initPos = new PVector();
    initPos.set(inPos);
    vel = new PVector(random(-10,10),random(-10,10));
    acc = new PVector(0, 0);
    c = ic;
    maxSpeed = red(c)*6.0/255 + 2;
    float sat = saturation(c)/255.0;
    float br = (brightness(c)/255.0);
    maxSteerForce = .1 + (sat*br)*.1;
  }

  void mDown()
  {
    acc.add(steer(new PVector(mouseX+random(-50, 50), mouseY+random(-50, 50)), false));
    move();
    //checkBounds();
    render();
  }

  void mDownR()
  {
    acc.add(avoid(new PVector(mouseX+random(-50, 50), mouseY+random(-50, 50)), true));
    move();
    //checkBounds();
    render();
  }

  void mUp()
  {
    if (pos.x!=initPos.x&&pos.y!=initPos.y)
      acc.add(steer(new PVector(initPos.x, initPos.y), true));
    //println(initPos);
    move();
    //checkBounds();
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
    if (pos.x>width) pos.x=0;
    if (pos.x<0) pos.x=width;
    if (pos.y>height) pos.y=0;
    if (pos.y<0) pos.y=height;
  }

  void render()
  {    
    /*pushMatrix();
     translate(pos.x,pos.y);
     stroke(c);
     point(0,0);
     popMatrix();*/
    int x2 = (int)pos.x;
    int y2 = (int)pos.y;
    if (x2 >= 0 && x2 < width && y2 >= 0 && y2 <height)
      pixels[width*y2+x2]=c;
  }

  //steering. If arrival==true, the boid slows to meet the target. Credit to Craig Reynolds
  PVector steer(PVector target, boolean arrival)
  {
    PVector steer = new PVector(); //creates vector for steering
    if (!arrival)
    {
      steer.set(PVector.sub(target, pos)); //steering vector points towards target (switch target and pos for avoiding)
      steer.limit(maxSteerForce); //limits the steering force to maxSteerForce
    }
    else
    {
      PVector targetOffset = PVector.sub(target, pos);
      float distance=targetOffset.mag();
      float rampedSpeed = maxSpeed*(distance/100);
      float clippedSpeed = min(rampedSpeed, maxSpeed);
      PVector desiredVelocity = PVector.mult(targetOffset, (clippedSpeed/distance));
      steer.set(PVector.sub(desiredVelocity, vel));
      steer.limit(maxSteerForce);
    }
    return steer;
  }

  //avoid. If weight == true avoidance vector is larger the closer the boid is to the target
  PVector avoid(PVector target, boolean weight)
  {
    PVector steer = new PVector(); //creates vector for steering
    steer.set(PVector.sub(pos, target)); //steering vector points away from target
    if (weight)
      steer.mult(10/sq(steer.mag()));
    steer.limit(maxSteerForce); //limits the steering force to maxSteerForce
    return steer;
  }
}


