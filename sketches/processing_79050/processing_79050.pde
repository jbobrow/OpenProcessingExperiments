
/**
 * Boid class for Processing, 
 * Nicolas Liautaud 2009
 * <br/>
 * Used by BoidsFlock class
 */

class Boid
{
  PVector pos;
  PVector vel;

  /**
   * Class constructor.
   */
  Boid()
  {
    pos = boids.zone.randomPos();
    vel = new PVector(random(0,1), random(0,1));
  }
  /**
   * Class constructor specifying position of boid.
   */
  Boid(int x, int y)
  {
    init(x, y, random(0,1), random(0,1));
  }
  /**
   * Class constructor specifying position of boid.
   */
  Boid(PVector p)
  {
    init(int(p.x), int(p.y), random(0,1), random(0,1));
  }
  private void init(int px, int py, float vx, float vy)
  {
    pos = new PVector(px, py);
    vel = new PVector(vx, vy);
  }

  /**
   * <p>Boid cohesion : try to approach other boids.</p>
   * <p>Compute the average direction to the barycenter of the
   * percepted flock, and add a part of that to velocity.</p>
   */
  void goToCenter()
  {
    PVector v = new PVector();
    int nbr = 0;
    for(int i=0; i < boids.size(); i++)
    {
      Boid b = (Boid) boids.get(i);
      if(b != this && PVector.dist(pos, b.pos) < boids.perception)
      {
        // add position of each other percepted boid
        v.add(b.pos);
        nbr++;
      }
    }
    if(nbr > 0)
    {
      v = PVector.sub(PVector.div(v, (float)nbr), pos); // do average
      v.mult(boids.cohesion * 0.001); // set intensity
      vel.add(v); // and add to velocity
    }
  }

  /**
   * <p>Boid avoidance : try to keep a minimum distance between others.</p>
   * <p>Compute the average opposite way to the "touched"
   * flock, and add a part of that to velocity.</p>
   */
  void keepDistance()
  {
    PVector u, v = new PVector();
    for(int i=0; i < boids.size(); i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = PVector.dist(pos, b.pos);
      if(b != this && d < boids.aura)
      {
        u = PVector.sub(pos, b.pos);
        u.normalize();
        u.div(d);
        v.add(u);
      }
    }
    v.mult(boids.avoidance); // set intensity
    vel.add(v); // and add to velocity
  }

  /**
   * <p>Boid imitation : try to move in the same way than other boids.</p>
   * <p>Compute the average velocity of the percepted
   * flock, and add a part of that to velocity.</p>
   */
  void matchVelocity()
  {
    PVector v = new PVector();
    int nbr = 0;
    for(int i=0; i < boids.size(); i++)
    { 
      Boid b = (Boid) boids.get(i);
      if(b != this && PVector.dist(pos, b.pos) < boids.perception)
      {
        // add velocity of each other percepted boid
        v.add(b.vel);
        nbr++;
      }
    }
    if(nbr > 0)
    {
      v = PVector.sub(PVector.div(v, nbr), vel); // do average
      v.mult(boids.imitation * 0.01); // set intensity
      vel.add(v); // and add to velocity
    }
  }

  void limitVelocity(float lim){
    if(vel.mag() > lim)
      vel = PVector.mult(PVector.div(vel, vel.mag()), lim);
  }

  /**
   * Keep a boid in zone by changing his velocity or position.
   *
   * @param  z Zone : zone to keep in
   * @param  loopZone boolean : loop or bounce on zone sides
   */
  void keepInZone(Zone z, boolean loopZone)
  {
    int maxX = z.x + z.w;
    int maxY = z.y + z.h;
    if(!loopZone)
    {
      // When a boid approach a side, an opposite vector is added to velocity (bounce)
      float efficiency = .03;
      // efficiency ~ 10 : boids immediately rejected
      // efficiency ~ .1  : boids slowly change direction
      PVector v = new PVector();
      if(pos.x <= z.x + boids.perception)       v.x = (z.x + boids.perception - pos.x) * efficiency;
      else if(pos.x >= maxX - boids.perception) v.x = (maxX - boids.perception - pos.x) * efficiency;
      if(pos.y <= z.y + boids.perception)       v.y = (z.y + boids.perception - pos.y) * efficiency;
      else if(pos.y >= maxY - boids.perception) v.y = (maxY - boids.perception - pos.y) * efficiency;
      vel.add(v);
    } 
    else
    {
      // When a boid cross a side, he's placed on the opposite side (teleport)
      if(pos.x <= z.x)       pos.x = maxX;
      else if(pos.x >= maxX) pos.x = z.x;
      if(pos.y <= z.y)       pos.y = maxY;
      else if(pos.y >= maxY) pos.y = z.y;
    }
  }

  /**
   * Affect boid velocity with an linear point force.
   *
   * @param  x x-coordinate of the effector
   * @param  y y-coordinate of the effector
   * @param  a aura of the effector (effect distance)
   * @param  i intensity of the effector. > 0 for attraction, < 0 for repulsion
   */
  void effector(int x, int y, float a, float e)
  {
    float d = dist(x, y, pos.x, pos.y);
    if(d < a)
    {
      PVector v = new PVector();
      if(pos.x >= x) v.x += (a-d) * e * 0.01;
      else v.x -= (a-d) * e * 0.01;
      if(pos.y >= y) v.y += (a-d) * e * 0.01;
      else v.y -= (a-d) * e * 0.01;
      vel.sub(v);
    }
  }

  /**
   * Display boid.
   */
  void display()
  {
    fill(255, 215, 245); 
    stroke(255, 0, 240);
    ellipse(pos.x, pos.y, boids.size, boids.size);
    float f = boids.size * 0.2; // vector factor
    line(pos.x, pos.y, pos.x + vel.x * f, pos.y + vel.y * f);
  }
}

