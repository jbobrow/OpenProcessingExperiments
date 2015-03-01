
// creature:  test of q learning and neural network for creature survival

World world;

void setup() {
  size(600, 600); // leave 800x200 at bottom for other controls (use control panel)
  world = new World(600, 800);
  world.init(); // stuff that cannot be done in GameSetting.init()
}

void draw() {
  //world.display();
  background(255);
  world.display();
}

// main world where creature lives
class World {

  // universal constants
  final static int nCreatureType = 2; // 3 type of creature types for now
  // 0 - food
  // 1 - base type of creature
  final static int TYPEFOOD = 0;
  final static int TYPECRITTER = 1;
  final static float LARGENUM = 100000000000000000000000.0;

  // precompute for speed
  float[] sinTable;
  float[] cosTable;
  CreatureSetting[] creatureSetting;
  ArrayList<Creature> creatures;
  ArrayList<Wall> walls;
  Creature myCreature; // human controlled creature, can select one at a time.

  int sizeX, sizeY; // size of game canvas (less than real canvas)
  int latest_cid; // assing a unique integer ID to each critter

  CreatureSetting foodCreature, critterCreature; // settings of creatures such as size

    World(int theWidth, int theHeight) {
    sizeX = theWidth;
    sizeY = theHeight;

    sinTable = new float[360]; // precompute sine angles for each degree
    cosTable = new float[360]; // precompute cosine angles for each degree

    for (int i=0; i<360; i++) { // precompute sine tables
      sinTable[i] = sin(radians(i));
      cosTable[i] = cos(radians(i));
    }

    creatureSetting = new CreatureSetting[nCreatureType];
    creatures = new ArrayList<Creature>();
    walls = new ArrayList<Wall>();
    myCreature = null;

    latest_cid = 0;
  }

  void init() {
    // define the new creatures below:  (in the future can be replaced with JSON)
    foodCreature = new CreatureSetting();
    foodCreature.radius = 12.0;
    foodCreature.bodyColor = color(90, 199, 78, 255);
    foodCreature.maxSpeed = 1.0;
    foodCreature.maxForce = 0.2;
    foodCreature.nMembranePoints = 16;
    creatureSetting[0] = foodCreature;

    critterCreature = new CreatureSetting();
    critterCreature.radius = 32.0;
    critterCreature.bodyColor = color(200, 50, 50, 255);
    critterCreature.maxSpeed = 3.0;
    critterCreature.maxForce = 0.2;
    critterCreature.nMembranePoints = 32;
    creatureSetting[1] = critterCreature;

    // draw walls
    float gridSnap = 32;
  walls.add( new Wall(gridSnap, gridSnap, sizeX-gridSnap, gridSnap) );
  walls.add( new Wall(sizeX-gridSnap, gridSnap, sizeX-gridSnap, sizeY-gridSnap) );
  walls.add( new Wall(sizeX-gridSnap, sizeY-gridSnap, gridSnap, sizeY-gridSnap) );
  walls.add( new Wall(gridSnap, sizeY-gridSnap, gridSnap, gridSnap) );
  walls.add( new Wall(sizeX/2, 100+gridSnap, sizeX/2, sizeY-100-gridSnap) );
  walls.add( new Wall(gridSnap, sizeY/2, sizeX/2-100-gridSnap, sizeY/2) );
  walls.add( new Wall(sizeX/2, sizeY/3, sizeX-100-gridSnap, sizeY/3) );
  walls.add( new Wall(sizeX/2+100+gridSnap, 2*sizeY/3, sizeX-gridSnap, 2*sizeY/3) );
  walls.add( new Wall(100, 100, sizeX/2-100, sizeY/2-100) );
  walls.add( new Wall(100, sizeY-100, sizeX/2-100, sizeY/2+100) );

    for (int i = 0; i < 4; i++) {
      creatures.add( new Creature(random(sizeX), random(sizeY), TYPECRITTER) );
    }

    for (int i = 0; i < 30; i++) {
      addRandomFood();
    }
  }

  void addFood(float x, float y) {
    creatures.add( new Creature(x, y, TYPEFOOD) );
  }

  void addRandomFood() {
    addFood(random(sizeX*0.1, sizeX*0.9), random(sizeY*0.1, sizeY*0.9));
  }

  int createCID() {
    latest_cid ++;
    return latest_cid;
  }

  CreatureSetting getCreatureSetting(int creatureType) {
    // access to 'world' global variable.
    if (creatureType == 0) {
      return foodCreature;
    }
    return critterCreature;
  }
  
  // returns whether location (x, y) is hovering on top of a creature
  // if so, sets myCreature to point to that creature if it is a critter
  boolean getCreatureAtLocation(float x, float y) {
    for (Creature c : creatures) {
      if (c.isInside(x, y)) {
        if (c.creatureType == TYPECRITTER) {
          myCreature = c;
        }
        return true;
      }
    }
    myCreature = null;
    return false;
  }


  float fastSin(float xDeg) {
    int deg = round(xDeg);
    if (deg >= 0) {
      return sinTable[(deg % 360)];
    }
    return -sinTable[((-deg) % 360)];
  }

  float fastCos(float xDeg) {
    int deg = round(xDeg);
    if (deg >= 0) {
      return cosTable[(deg % 360)];
    }
    return cosTable[((-deg) % 360)];
  }

  void display () {
    Creature c;
    for (int i = 0; i < creatures.size (); i++) {
      c = creatures.get(i);

      c.decide();

      c.update();
      c.display();
    }
    /*
    for (Wall w : walls) {
      w.display();
    }
    */
    
    if (mousePressed) {
      
      if ( getCreatureAtLocation(mouseX, mouseY) == false ) {
        addFood(mouseX, mouseY);
      }

    }
    
    if (myCreature != null) {
      strokeWeight(0);
      fill(50, 50, 255, 50);
      ellipse(myCreature.position.x, myCreature.position.y, myCreature.setting.radius*3, myCreature.setting.radius*3);
    }
    
  }
}

class Wall {
  PVector point1;
  PVector point2;
  color wallColor;
 
 
  Wall(float x1, float y1, float x2, float y2) {
    wallColor = color(127);
    point1 = new PVector(x1, y1);
    point2 = new PVector(x2, y2);
  }
 
  void display() {
 
    stroke(wallColor);
    line(point1.x, point1.y, point2.x, point2.y);
  }
 
  void setColorBlack() {
    wallColor = color(100);
  }
 
  void setColorRed() {
    wallColor = color(255, 0, 0);
  }
}

class CreatureSetting {
  float radius;
  color bodyColor;
  float maxSpeed;
  float maxForce;
  int nMembranePoints;
  float life;

  CreatureSetting() {
    radius = 4;
    bodyColor = color(127, 127, 127, 127);
    maxSpeed = 1.0;
    maxForce = 1.0;
    nMembranePoints = 6;
    life = 1.0; // 1.0 == full life
  }

  CreatureSetting getCopy() {
    CreatureSetting result = new CreatureSetting();
    result.radius = radius;
    result.bodyColor = bodyColor;
    result.maxSpeed = maxSpeed;
    result.maxForce = maxForce;
    result.nMembranePoints = nMembranePoints;
    return result;
  }
}


class Creature {

  // All the usual stuff
  PVector position;
  PVector internalTarget;
  CreatureSetting setting;
  PVector velocity;
  PVector acceleration;

  int creatureType;
  int cid; // unique ID number for each creature.

  float[] membraneDeviation;
  float[] membraneLocX;
  float[] membraneLocY;

  // Constructor initialize all values
  Creature(float x, float y, int theCreatureType) {
    position = new PVector(x, y);
    creatureType = theCreatureType;
    setting = world.creatureSetting[creatureType].getCopy(); // make a copy of the settings

    // generate a unique ID for the creature in the world.
    cid = world.createCID();

    // initial speed/accel etc
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);

    // precalc location for random membrane
    int nMembranePoints = setting.nMembranePoints;

    membraneDeviation = new float[nMembranePoints];
    membraneLocX = new float[nMembranePoints];
    membraneLocY = new float[nMembranePoints];

    for (int i = 0; i < setting.nMembranePoints; i++) {
      membraneDeviation[i] = 0.0;
      float angle = i * (360 / nMembranePoints);
      membraneLocX[i] = world.fastCos(angle);
      membraneLocY[i] = world.fastSin(angle);
    }

    internalTarget = new PVector(0.0, 0.0);
  }
  
  // returns true of (x, y) is inside creature
  boolean isInside(float x, float y) {
    float dx = x - position.x;
    float dy = y - position.y;
    float d2 = dx*dx + dy*dy;
    if ( d2 <= (setting.radius*setting.radius) ) {
      return true;
    }
    return false;
  }

  void decide() {

    // seperate from similar creatures (and detect if eating other creature)
    PVector separateForce = separate();

    PVector theTarget = null;

    theTarget = getClosestTarget();
    if (world.myCreature != null && world.myCreature.cid == cid) {
      theTarget = new PVector(mouseX, mouseY); // if player controlled.
    }

    PVector seekForce = new PVector(0.0, 0.0);

    if (theTarget != null) {
      seekForce = seek(theTarget);
    } 

    separateForce.mult(2); // this control the relative strength of each forces
    seekForce.mult(1); // control relative strength
    applyForce(separateForce);
    applyForce(seekForce);
  }

  void applyForce(PVector force) {
    acceleration.add(force); // can divide by mass to do a = f / m (f=ma) here.
  }

  void stopMovement() {
    velocity.mult(0);
  }

  PVector getClosestTarget() {
    PVector theTarget;
    PVector bestTarget = null;
    float d2;
    float closest = world.LARGENUM;
    for (int i = 0; i < world.creatures.size (); i++) {
      if (cid == world.creatures.get(i).cid || creatureType == world.creatures.get(i).creatureType) {
        // self is not a target, also same type is not a target.
        continue;
      }
      theTarget = world.creatures.get(i).position;
      d2 = CollisionDetect.dist2(position, theTarget);
      if (d2 < closest) {
        bestTarget = theTarget;
        closest = d2;
      }
    }
    if (bestTarget == null && creatureType == world.TYPECRITTER) {
      for (int i = 0; i < 30; i++) {
        world.addRandomFood();
      }
    }
    return bestTarget;
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector theTarget) {
    PVector desired = PVector.sub(theTarget, position);  // A vector pointing from the location to the target
    float magsq = CollisionDetect.dist2(theTarget, position);
    float r = setting.radius;
    float factor = min(1.0, magsq / (r * r));
    // Normalize desired and scale to maximum speed

    desired.normalize();
    desired.mult(setting.maxSpeed*factor);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(setting.maxForce);  // Limit to maximum steering force
    if (creatureType == world.TYPEFOOD) {
      steer.mult(-1.0); // go away from predator
    }
    return steer;
  }

  // Separation and eating
  // Method checks for nearby creatures and moves away from same type
  PVector separate () {
    float r = setting.radius;
    float other_r = 0.0;
    float desired_d2 = (r*2)*(r*2);
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    Creature other;
    for (int i = 0; i < world.creatures.size (); i++) {
      other = world.creatures.get(i);
      float d2 = CollisionDetect.dist2(position, other.position);
      other_r = other.setting.radius;
      desired_d2 = r + other_r;
      desired_d2 *= desired_d2;
      // If the distance is greater than 0 and less than an arbitrary amount
      if ((cid != other.cid) && (d2 < desired_d2) ) {
        if (creatureType == other.creatureType) {
          // Calculate vector pointing away from neighbor
          PVector diff = PVector.sub(position, other.position);
          diff.normalize();
          diff.div(desired_d2);        // Weight by distance
          sum.add(diff);
          count++;            // Keep track of how many
        } else if ( (creatureType == world.TYPECRITTER) && (other.creatureType == world.TYPEFOOD) ) { // eat the prey
          world.creatures.get(i).setting.life = 0.0;
          world.creatures.remove(i);
        }
      }
    }

    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(setting.maxSpeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(setting.maxForce);
    }
    return sum;
  }

  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(setting.maxSpeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void display() {
    // draws the creature

    fill(setting.bodyColor);
    strokeWeight(1);
    stroke(0);
    pushMatrix();

    translate(position.x, position.y);
    float theta = velocity.heading2D() + radians(90);
    rotate(theta);
    beginShape();
    float len = 0;
    float deviation = 0;
    float locX, locY;
    int nMembranePoints = setting.nMembranePoints;
    float r = setting.radius; // short hand for radius

      // draw the body of the creature
    for (int i = 0; i < nMembranePoints; i++) {
      deviation = membraneDeviation[i];
      deviation += r*0.05*random(-1, 1);
      deviation *= 0.95;
      membraneDeviation[i] = deviation;
      len = r + deviation;
      locX = membraneLocX[i];
      locY = membraneLocY[i];
      vertex(len*locX, len*locY);
    }
    endShape(CLOSE);
    // draw the eyes
    for (int i = 0; i < 2; i++ ) { // draw 2 eyes
      int eyeIndex = round(nMembranePoints*(0.625+0.25*i));
      float eyeDist = 0.6;
      len = r + membraneDeviation[eyeIndex];
      locX = membraneLocX[eyeIndex];
      locY = membraneLocY[eyeIndex];
      fill(255);
      ellipse(len*locX*eyeDist, len*locY*eyeDist, len/1.5, len/1.5);
      if (setting.radius > 8) { // only draw eye pupil if radius is large enough
        fill(0);
        ellipse(len*locX*eyeDist, len*locY*eyeDist, len/(4), len/(4));
      }
    }
    popMatrix();
  }
}

// A useful class to intersect lines and circles or to gest the closest point to a circle in a given segment
// author      Ale Gonzlez

static class CollisionDetect
{

  static float distanceToCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r)
  {
    PVector closest = getClosestPointToCenter(x1, y1, x2, y2, cx, cy, r);
    float d = abs(sqrt((closest.x - cx)*(closest.x - cx) + (closest.y - cy)*(closest.y - cy)) - r);
    return d;
  }

  static float distanceToCenter(float x1, float y1, float x2, float y2, float cx, float cy, float r)
  {
    PVector closest = getClosestPointToCenter(x1, y1, x2, y2, cx, cy, r);
    float d = sqrt((closest.x - cx)*(closest.x - cx) + (closest.y - cy)*(closest.y - cy));
    return d;
  }

  static float squaredDistanceToCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r)
  {
    float d = distanceToCircle(x1, y1, x2, y2, cx, cy, r);
    return d*d;
  }

  static float squaredDistanceToCenter(float x1, float y1, float x2, float y2, float cx, float cy, float r)
  {
    PVector closest = getClosestPointToCenter(x1, y1, x2, y2, cx, cy, r);
    float d = (closest.x - cx)*(closest.x - cx) + (closest.y - cy)*(closest.y - cy);
    return d;
  }

  static PVector getClosestPointToCenter(float x1, float y1, float x2, float y2, float cx, float cy, float r)
  {
    float
      dx = x2-x1, 
    dy = y2-y1, 
    sLength = sqrt(dx*dx + dy*dy), 
    sx = dx/sLength, 
    sy = dy/sLength, 
    pLength = (cx-x1)*sx + (cy-y1)*sy;

    if (pLength < 0)
      return new PVector(x1, y1);
    else if (pLength > sLength)
      return new PVector(x2, y2);

    return new PVector(x1 + sx*pLength, y1 + sy * pLength);
  }

  static PVector[] intersect(float x1, float y1, float x2, float y2, float cx, float cy, float r)
  {
    float sqR = r*r;
    //Check if segment extremes are inside the circle
    boolean
      oneInside = (cx-x1)*(cx-x1)+(cy-y1)*(cy-y1) < sqR, 
    twoInside = (cx-x2)*(cx-x2)+(cy-y2)*(cy-y2) < sqR;

    //If segment is inside the circle there is no intersection
    if (oneInside && twoInside) return null;

    //Get a normalized vector (sx, sy) in the direction of the segment and its magnitude (sLength)
    float
      dx = x2-x1, 
    dy = y2-y1, 
    sLength = sqrt(dx*dx + dy*dy), 
    sx = dx/sLength, 
    sy = dy/sLength;

    //Calculate the length of the projected line (pLength) connecting the origin
    // of the segment (x1, y1) to the center of the circle (cx, cy) using dot product
    float pLength = (cx-x1)*sx + (cy-y1)*sy;

    //Check if closest point in the segment is one of the segment extremes and if there is intersection in that case
    if ((pLength < 0 && !oneInside) || (pLength > sLength && !twoInside)) return null;

    //Else, closest point is between both extremes
    //If distance from this point to center is bigger than radius there is no intersection
    float
      x = x1 + sx * pLength, 
    y = y1 + sy * pLength, 
    d = sqR - ((x-cx)*(x-cx) + (y-cy)*(y-cy));
    if (d < 0) return null;

    //Calculate distance from this point to intersection points (applying Pythagoras theorem)
    d = sqrt(d);
    //Calculate intersection points
    if (oneInside)
    return new PVector[] {
      new PVector(x+sx*d, y+sy*d), null
    };
    if (twoInside)
    return new PVector[] {
      new PVector(x-sx*d, y-sy*d), null
    };
    //else
    return new PVector[] {
      new PVector(x+sx*d, y+sy*d), new PVector(x-sx*d, y-sy*d)
      };
    }

    // added fast d2 method
    static float dist2(PVector p1, PVector p2) {
      float d1 = p1.x - p2.x;
      float d2 = p1.y - p2.y;
      return (d1*d1 + d2*d2);
    }
}

