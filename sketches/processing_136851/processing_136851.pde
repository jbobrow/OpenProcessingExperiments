
class Mover 
{
  PVector location;
  PVector direction;
  PVector target;
  float speed, SPEED;

  float topSpeed;

  float d;

  Mover ()
  {
    location = new PVector(random(width), random(height));
    target = new PVector(random(width), random(height));
    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));


    d = random (5, 20);
    speed = map (d, 5, 20, 5, 1);
    SPEED = speed;

    topSpeed = 7;
  }
  
  void setLocation (float x, float y)
  {
    location.x = x;
    location.y = y;
  }


  void setTarget (PVector newTarget)
  {
    if (target != null)
    {
      target.x = newTarget.x;
      target.y = newTarget.y;
    } else target = new PVector (newTarget.x, newTarget.y);
    //target.x = constrain (target.x, d/2, width-d/2);
    //target.y = constrain (target.y, d/2, height-d/2);
  }

  void move ()
  {

    if (target != null) move ( target); else location.add (getVelocity ());

    if (speed > SPEED) speed *= 0.97; else if (speed < SPEED) speed *= 1.01;
  }

  void move (PVector force)
  {
    float maxDis = dist (0, 0, width, height);
    float dis = dist (force.x, force.y, location.x, location.y);
    float angle = atan2 (force.y - location.y, force.x - location.x);

    float forceStrength = map (dis, 0, maxDis, 0.5, 0.1);


    PVector acceleration = new PVector (cos(angle)*forceStrength, sin (angle)*forceStrength);   

    forceStrength *= map (d, 5, 20, 3, 0.2);

    speed += forceStrength;

    float slowDownarea = map (d, 5, 20, 80, 50);
    if (dis < slowDownarea)
    {
      speed *= 0.85;
      acceleration.normalize();
    }

    speed = constrain (speed, 1, topSpeed);

    direction.add (acceleration);
    direction.normalize();
    location.add (getVelocity ());

    checkTargetReached();
  }

  void checkTargetReached ()
  {
    float currentDistanceToTarget = dist(location.x, location.y, target.x, target.y);
    if (currentDistanceToTarget < speed || currentDistanceToTarget < d/2)
    {
      target = null;
    }
  }

  PVector getVelocity ()
  {
    PVector velocity = new PVector (direction.x * speed, direction.y * speed);
    return velocity;
  }

  void checkEdges ()
  {
    if (location.x < -width/2+d/2)
    {
      location.x = -width/2+d/2;
      direction.x = direction.x * -1;
    } else if (location.x > width/2-d/2) 
    {
      location.x = width/2-d/2;
      direction.x = direction.x * -1;
    }

    if (location.y < -height/2 + d/2)
    {
      location.y = -height/2+d/2;
      direction.y = direction.y * -1;
    } else if (location.y > height/2-d/2) 
    {
      location.y = height/2-d/2;
      direction.y = direction.y * -1;
    }
  }


  void display ()
  {
    noStroke();
    fill (#b1c999);
    ellipse (location.x, location.y, d, d);

    if (target != null)
    {
      fill (#e8e2b2);
      ellipse (target.x, target.y, 3, 3);
    }
    strokeWeight (1);
    stroke (255);
    line (location.x, location.y, location.x + direction.x*d/2, location.y + direction.y*d/2);
  }
}



