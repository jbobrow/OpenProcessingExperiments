
//Parris Boyd, Melanie Broadhurst, and Bryan Williams
//Project 2: Angry Birds Remixed
//Code based from Nicolas Liautaud's Boid Code



ArrayList foodList, obstList;
int foodNbr, obstNbr, boidsNbr;
boolean displayAura, displayPerception;
boolean changeObstAura, changeFoodAura;
float obstAuraFactor, foodAuraFactor;
BoidsFlock boids;

PImage redbird;
PImage pig;
PImage sky;
PImage fort;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  redbird = loadImage("redbird.png");
  pig = loadImage("pig.png");
  sky = loadImage("sky.jpg");
  fort = loadImage("fort.png");

  // initialize obstacles
  obstList = new ArrayList();
  obstNbr  = 10;
  obstAuraFactor = 3;

  // initialize food
  foodList = new ArrayList();
  foodNbr  = 10;
  foodAuraFactor = 3;
 
  // initialize birds
  boids = new BoidsFlock();
  boidsNbr = 40;

  // create pigs
  for (int i=0; i < foodNbr; i++) {
    foodList.add(new Obj());
    Obj o = (Obj)foodList.get(i);
    o.aura = o.rad * foodAuraFactor;
  }

  // create forts
  for (int i=0; i < obstNbr; i++) {
    obstList.add(new Obst());
    Obst o = (Obst)obstList.get(i);
    o.aura = o.rad * obstAuraFactor;
  }

  // create birds
  for (int i=0; i < boidsNbr; i++) {
    boids.add();
  }
}


void draw() {
  background(sky);
  // draw food
  for (int i=0; i<foodList.size(); i++)
  {
    Obj f = (Obj) foodList.get(i);
    f.display(120, 255, 120);
  }
  
  // draw forts
  for (int i=0; i<obstList.size(); i++) {
    Obst o = (Obst) obstList.get(i);
    o.display();
  }

  // draw birds
  boids.display();

  // make the birds go towards the pigs
  boids.update();

  if (foodList.size() < 10) {
    foodList.add(new Obj(floor(random(width)), floor(random(height))));
  }
}


// changes the initial positioning if spacebar is pressed
void keyPressed() {
  if (key == ' ') setup();
}


//setting up the birds
class Boid {
  PVector pos;
  PVector vel;

  Boid()
  {
    pos = boids.zone.randomPos();
    vel = new PVector(random(0, 1), random(0, 1));
  }
  
  //position of the birds 
  Boid(int x, int y) {
    init(x, y, random(0, 1), random(0, 1));
  }

  Boid(PVector p) {
    init(int(p.x), int(p.y), random(0, 1), random(0, 1));
  }
  private void init(int px, int py, float vx, float vy)
  {
    pos = new PVector(px, py);
    vel = new PVector(vx, vy);
  }

 //Birds gravitating to eachother 
  void goToCenter() {
    PVector v = new PVector();
    int nbr = 0;
    for (int i=0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);
      if (b != this && PVector.dist(pos, b.pos) < boids.perception) {
        // add position of each other percepted boid
        v.add(b.pos);
        nbr++;
      }
    }
    if (nbr > 0) {
      v = PVector.sub(PVector.div(v, (float)nbr), pos); // do average
      v.mult(boids.cohesion * 0.001); // set intensity
      vel.add(v); // and add to velocity
    }
  }

  //Minimum distance between birds
  void keepDistance() {
    PVector u, v = new PVector();
    for (int i=0; i < boids.size(); i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = PVector.dist(pos, b.pos);
      if (b != this && d < boids.aura) {
        u = PVector.sub(pos, b.pos);
        u.normalize();
        u.div(d);
        v.add(u);
      }
    }
    v.mult(boids.avoidance); // set intensity
    vel.add(v); // and add to velocity
  }

  //Birds mimic eachothers movements
  void matchVelocity() {
    PVector v = new PVector();
    int nbr = 0;
    for (int i=0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);
      if (b != this && PVector.dist(pos, b.pos) < boids.perception) {
        // add velocity of each other percepted bird
        v.add(b.vel);
        nbr++;
      }
    }
    if (nbr > 0) {
      v = PVector.sub(PVector.div(v, nbr), vel); // do average
      v.mult(boids.imitation * 0.01); // set intensity
      vel.add(v); // and add to velocity
    }
  }

  void limitVelocity(float lim) {
    if (vel.mag() > lim)
      vel = PVector.mult(PVector.div(vel, vel.mag()), lim);
  }

  //Keep a bird in zone by changing his velocity or position.
  void keepInZone(Zone z, boolean loopZone) {
    int maxX = z.x + z.w;
    int maxY = z.y + z.h;
    if (!loopZone) {
      // When a bird approaches a side, an opposite vector is added to velocity to make it bounce
      float efficiency = .3;
      // efficiency ~ 10 : birds immediately rejected
      // efficiency ~ .1  : birds slowly change direction
      PVector v = new PVector();
      if (pos.x <= z.x + boids.perception)       v.x = (z.x + boids.perception - pos.x) * efficiency;
      else if (pos.x >= maxX - boids.perception) v.x = (maxX - boids.perception - pos.x) * efficiency;
      if (pos.y <= z.y + boids.perception)       v.y = (z.y + boids.perception - pos.y) * efficiency;
      else if (pos.y >= maxY - boids.perception) v.y = (maxY - boids.perception - pos.y) * efficiency;
      vel.add(v);
    }
    else {
      // birds move from bottom to the top of the screen
      if (pos.x <= z.x)       pos.x = maxX;
      else if (pos.x >= maxX) pos.x = z.x;
      if (pos.y <= z.y)       pos.y = maxY;
      else if (pos.y >= maxY) pos.y = z.y;
    }
  }

  //Affect bird velocity with an linear point force
  void effector(int x, int y, float a, float e) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < a) {
      PVector v = new PVector();
      if (pos.x >= x) v.x += (a-d) * e * 0.01;
      else v.x -= (a-d) * e * 0.01;
      if (pos.y >= y) v.y += (a-d) * e * 0.01;
      else v.y -= (a-d) * e * 0.01;
      vel.sub(v);
    }
  }

  // Display bird
  void display() {
    fill(210, 230, 250);
    stroke(100, 150, 250);
    image(redbird, pos.x, pos.y);
    float f = boids.size * 0.2; // vector factor
  }
}

 //Use Boid and Zone class
class BoidsFlock {
  // Simulation zone
  Zone zone;
  // Keep in zone by looping or bouncing
  boolean loopZone;
  // Birds list
  ArrayList list;
  // Birds try to approach other boids
  float cohesion;
  // Birds try to keep a minimum distance between others
  float avoidance;
  // Birds try to move in the same way than other boids
  float imitation;
  // Birds radius
  int size = 7;
  // Distance for which birds touch things (avoidance, collisions)
  float aura;
  // Distance for which birds sees and responds to its environment
  float perception;
  // Define cruise-speed and stress-speed limit
  float speedLimit;

 //class constructor
  BoidsFlock() {
    zone = new Zone(-25, -25, width, height);
    loopZone = true;
    list = new ArrayList();
    cohesion = 10;
    avoidance = 10;
    imitation = 10;
    size = 7;
    aura = 3 * size;
    perception = 10 * size;
    speedLimit = 4;
  }


  //Add a bird to flock.
  void add() {
    list.add(new Boid());
  }
  //Add a bird to flock at the defined position
  void add(int x, int y) {
    list.add(new Boid(x, y));
  }
  /**
   * Add a bird to flock at the defined position.
   */
  void add(PVector p) {
    list.add(new Boid(p));
  }


   //Add a bird to flock outside object list auras or don't create it.
  void addOutside(ArrayList objs) {
    boolean collide = false;
    int it = 0, itMax = 50000;
    PVector pos;
    // do this while random pos is in Obj zone
    do {
      it++;
      pos = boids.zone.randomPos();
      for (int i=0; i<objs.size(); i++) {
        Obj o = (Obj) objs.get(i);
        if (PVector.dist(pos, o.pos) < o.aura) {
          collide = true;
          break;
        }
      }
    } 
    while (collide && it < itMax);
    if (!collide) list.add(new Boid(pos));
  }


  //Delete bird from flock.
  void del(int i) {
    list.remove(i);
  }

  //Return the number of birds in flock.
  int size() {
    return list.size();
  }

  //Return the specified bird
  Boid get(int i) {
    return (Boid) list.get(i);
  }

  //Update each bird position and velocity according to simulation rules
  void update() {
    for (int i=0; i<list.size(); i++) {
      Boid b = (Boid) list.get(i);

      // basic flock rules
      b.goToCenter();
      b.keepDistance();
      b.matchVelocity();

      // additionnal rules
      b.keepInZone(zone, loopZone);

      // Cruise-speed limitation
      b.limitVelocity(speedLimit);

      // pig attraction and attack
      boolean contact;
      for (int j=0; j<foodList.size(); j++) {
        Obj f = (Obj) foodList.get(j);
        // medium attraction when perceived
        b.effector(int(f.pos.x), int(f.pos.y), f.aura + boids.perception, 1.2);
        // big repulsion on contact
        b.effector(int(f.pos.x), int(f.pos.y), f.rad + boids.size, -40);
        // if contact
        if (PVector.dist(f.pos, b.pos) < f.rad + boids.size) {
          f.rad -= .03;// reduce obj size
          // if size is too small delete it and update control value
          if (f.rad <= 5) {
            foodList.remove(j);
          }
        }
      }

      // obstacles boids.avoidance
      for (int j=0; j<obstList.size(); j++) {
        Obst o = (Obst) obstList.get(j);
        // small repulsion when perceived (anticipation)
        b.effector(int(o.pos.x), int(o.pos.y), o.aura + boids.perception, -0.2);
        // big repulsion on contact (collision)
        b.effector(int(o.pos.x), int(o.pos.y), o.rad + boids.size, -20);
      }

      // mouse repulsion
      b.effector(mouseX, mouseY, 70, -7);
      
      // finally update position
      b.pos.add(b.vel);
    }
  }

  //Draw each bird
  void display() {
    for (int i=0; i < list.size(); i++) {
      Boid b = (Boid) list.get(i);
      b.display();
    }
  }

  void displayAura() {
    fill(255, 180, 150, 50);
    stroke(255, 180, 150);
    Boid b = (Boid) boids.get(0);
    ellipse(b.pos.x, b.pos.y, boids.aura * 2, boids.aura * 2);
  }
}

//Used for bird movement
class Obj {
  PVector pos;
  float rad;
  float aura;

  Obj() {
    init(boids.zone.randomPos());
  }
  Obj(int x, int y) {
    init(new PVector(x, y));
  }
  void init(PVector p) {
    pos = p;
    rad = random(10, 30);
    aura = 3 * rad;
  }

  void display() {
    display(100, 100, 100);
  }
  void display(int r, int g, int b) {
    fill(r, g, b, 50);
    stroke(r, g, b);
    image(pig, pos.x, pos.y);
  }
}

class Obst {
  PVector pos;
  float rad;
  float aura;

  Obst() {
    init(boids.zone.randomPos());
  }
  Obst(int x, int y) {
    init(new PVector(x, y));
  }
  void init(PVector p) {
    pos = p;
    rad = random(10, 30);
    aura = 3 * rad;
  }

  void display() {
    display(100, 100, 100);
  }
  void display(int r, int g, int b) {

    stroke(r, g, b);
    image(fort, pos.x, pos.y);
  }
}

//Zone class
class Zone {
  int x, y, w, h;

  Zone(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }

  // define if coord is in zone
  boolean isIn(PVector v) {
    return isIn(int(v.x), int(v.y));
  }
  boolean isIn(int px, int py) {
    if (px > x && px < x + w &&
      py > y && py < y + h)
      return true;
    else return false;
  }

  // return a random pos vector in zone
  PVector randomPos() {
    return new PVector(random(x, x + w), random(y, y + h));
  }
}


