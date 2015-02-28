
class BoidsFlock
{
  // Simulation zone
  Zone zone;
  // Keep in zone by looping or bouncing
  boolean loopZone;
  // Boids list
  ArrayList list;
  // Boids try to keep a minimum distance between others (factor)
  float avoidance;
  // Boids try to move in the same way than other boids (factor)
  float cohesion;
  float imitation;
  // Boids radius
  int size = 3;
  // Distance for which boids touch things (avoidance, collisions)
  float aura;
  // Distance for which boids sees and responds to its environment
  float perception;
  // Define cruise-speed and stress-speed limit
  float speedLimit;
 
  /**
   * Class constructor.
   */
  BoidsFlock()
  {
    zone = new Zone(0, 50, width, height-50);
    loopZone = true;
    list = new ArrayList();
    avoidance = 10;
    cohesion = 10;
    imitation = 2;
    size = 7;
    aura = 3 * size;
    perception = 10 * size;
    speedLimit = 4;
  }
 
 
  /**
   * Add a boid to flock.
   */
  void add(){
    list.add(new Boid());
  }
  /**
   * Add a boid to flock at the defined position.
   */
  void add(int x, int y){
    list.add(new Boid(x, y));
  }
  /**
   * Add a boid to flock at the defined position.
   */
  void add(PVector p){
    list.add(new Boid(p));
  }
 
  /**
   * Add a boid to flock outside object list auras or don't create it.
   *
   * @param  objs Obj ArrayList : list of objects which areas should be avoided
   */
  void addOutside(ArrayList objs)
  {
    boolean collide = false;
    int it = 0, itMax = 50000;
    PVector pos;
    // do this while random pos is in Obj zone
    do{
      it++;
      pos = boids.zone.randomPos();
      for(int i=0; i<objs.size(); i++)
      {
        Obj o = (Obj) objs.get(i);
        if(PVector.dist(pos, o.pos) < o.aura)
        {
          collide = true;
          break;
        }
      }
    } 
    while(collide && it < itMax);
    if(!collide) list.add(new Boid(pos));
  }
 
  /**
   * Delete boid from flock.
   *
   * @param  i boid index
   */
  void del(int i){
    list.remove(i);
  }
 
  /**
   * Return the number of boids in flock.
   */
  int size(){
    return list.size();
  }
 
  /**
   * Return the specified boid.
   *
   * @param i boid index
   * @return Boid
   */
  Boid get(int i){
    return (Boid) list.get(i);
  }
 
  /**
   * Update each boid position and velocity according to simulation rules.
   */
  void update()
  {
    for(int i=0; i<list.size(); i++)
    {
      Boid b = (Boid) list.get(i);
 
      // basic flock rules
      b.keepDistance();
      b.matchVelocity();
 
      // additionnal rules
      b.keepInZone(zone, loopZone);
 
      // Cruise-speed limitation
      b.limitVelocity(speedLimit);
 
      // food attraction and eat
      boolean contact;
      for(int j=0; j<foodList.size(); j++)
      {
        Obj f = (Obj) foodList.get(j);
        // medium attraction when perceived
        b.effector(0, 0, f.aura + boids.perception, 60);
      }
 
      // obstacles boids.avoidance
      for(int j=0; j<obstList.size(); j++)
      {
        Obj o = (Obj) obstList.get(j);
        // small repulsion when perceived (anticipation)
        b.effector(int(o.pos.x), int(o.pos.y), o.aura + boids.perception, -0.2);
        // big repulsion on contact (collision)
        b.effector(int(o.pos.x), int(o.pos.y), o.rad + boids.size, -20);
      }
 
      // Max-speed limitation
      //b.limitVelocity(speedLimit * 2);
 
      // finally update position
      b.pos.add(b.vel);
    }
  }
 
  /**
   * Draw each boid.
   */
  void display()
  {
    for(int i=0; i < list.size(); i++)
    {
      Boid b = (Boid) list.get(i);
      b.display();
    }
  }
}


