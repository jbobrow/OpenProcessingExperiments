
/* @pjs crisp=true; 
 */

// creature:  test of q learning and neural network for creature survival

World world;

void setup() {
  frameRate(30);
  size(800, 700); // leave 800x200 at bottom for other controls (use control panel)
  world = new World(800, 600);
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
  final static int nActionState = 8; // can only move in 8 directions
  // 0 - food
  // 1 - base type of creature
  final static int TYPEFOOD = 0;
  final static int TYPECRITTER = 1;
  final static int INITCRITTER = 4;
  final static int INITFOOD = 60;
  final static int BREEDLIMIT = 10; // if less than total of 10 creatures, then generate more food.
  // this means if all 10 creatures are critters, they will eventually die of starvation if dLife/dTime is negative in future.
  final static float LARGENUM = 100000000000000000000000.0;

  final static float initLife = 100.0;
  final static float wallPenalty = -10.0;
  final static float foodNutrition = 10.0;
  final static int nPerception = 8;
  final static float CreatureEyeSightLength = 200.0;
  final static float gridSnap = 32; // area between outer walls and screen limit

  boolean DEBUGWALLMODE = false;
  boolean DEBUGTARGETMODE = false;
  boolean HUMANCONTROLMODE = true;

  // precompute for speed
  float[] sinTable;
  float[] cosTable;
  CreatureSetting[] creatureSetting;
  ArrayList<Creature> creatures;
  ArrayList<Wall> walls;
  Creature myCreature; // selected controlled creature, can select one at a time.

  int sizeX, sizeY; // size of game canvas (less than real canvas)
  int latest_cid; // assing a unique integer ID to each critter
  
  float barX, barY; // base location of info bar for selected creature

  CreatureSetting foodCreature, critterCreature; // settings of creatures such as size

    World(int theWidth, int theHeight) {
    sizeX = theWidth;
    sizeY = theHeight;
    
    barX = 10;
    barY = sizeY;

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
    foodCreature.radius = 6.0;
    foodCreature.bodyColor = color(90, 199, 78, 255);
    foodCreature.maxSpeed = 0.15;
    foodCreature.maxForce = 0.15;
    foodCreature.nMembranePoints = 16;
    foodCreature.nPerception = 0;
    creatureSetting[0] = foodCreature;

    critterCreature = new CreatureSetting();
    critterCreature.radius = 16.0;
    critterCreature.bodyColor = color(200, 50, 50, 200);
    critterCreature.maxSpeed = 3.0;
    critterCreature.maxForce = 0.2;
    critterCreature.nMembranePoints = 32;
    critterCreature.nPerception = world.nPerception;
    creatureSetting[1] = critterCreature;

    // draw walls

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

    for (int i = 0; i < INITCRITTER; i++) {
      addRandomCreature(TYPECRITTER);
    }

    for (int i = 0; i < INITFOOD; i++) {
      addRandomCreature(TYPEFOOD);
    }
  }

  // return true if (x, y) is within valid play area
  boolean inValidArea(float x, float y) {
    float g = 32;
    if ((x > g) && (x < (sizeX - g)) && (y > g) && (y < (sizeY - g))) {
      return true;
    }
    return false;
  }

  void addCreature(float x, float y, int creatureType) {
    float r = creatureSetting[creatureType].radius;
    if (isTouchingWall(x, y, r) == false && inValidArea(x, y) == true) {
      creatures.add( new Creature(x, y, creatureType) );
    }
  }

  void addRandomCreature(int creatureType) {
    float cx, cy, r;
    r = creatureSetting[creatureType].radius;
    do {
      cx = random(gridSnap, sizeX-gridSnap);
      cy = random(gridSnap, sizeY-gridSnap);
    } 
    while (isTouchingWall (cx, cy, r)==true);
    addCreature(cx, cy, creatureType);
  }  

  int createCID() {
    latest_cid ++;
    return latest_cid;
  }

  // returns true if a circle at cx, cy center point (radius r) is touching any of the walls in world
  boolean isTouchingWall(float cx, float cy, float r) {
    float d;
    for (Wall w : walls) {
      d = CustomTool.distanceToCircle(w.point1.x, w.point1.y, w.point2.x, w.point2.y, cx, cy, r);
      if (d <= r) {
        return true;
      }
    }
    return false;
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

  void rotatePVector(PVector orig, float theta) {
    // theta is in degrees
    float x, y;
    x = orig.x;
    y = orig.y;
    orig.x = x*fastCos(theta) - y*fastSin(theta);
    orig.y = x*fastSin(theta) + y*fastCos(theta);
  }



  void display () {
    Creature c;
    for (int i = 0; i < creatures.size (); i++) {
      c = creatures.get(i);
      c.decide();
      c.update();
      c.display();
    }

    for (Wall w : walls) {
      w.display();
    }

    if (mousePressed) {
      if ( getCreatureAtLocation(mouseX, mouseY) == false ) {
        addCreature(mouseX, mouseY, TYPEFOOD);
      }
    }

    if (myCreature != null) {
      strokeWeight(0.1);
      //fill(50, 50, 255, 50);
      //fill(255, 255, 255, 0);
      noFill();
      ellipse(myCreature.position.x, myCreature.position.y, myCreature.setting.radius*3, myCreature.setting.radius*3);
      displayCreatureDetails(myCreature);
    }
    
    // if no food left, add random food again
    if (creatures.size() <= BREEDLIMIT) {
    for (int i = 0; i < INITFOOD; i++) {
      addRandomCreature(TYPEFOOD);
    }
    }
    
  }
  
  // draws on the lower part of the screen details about the creature
  void displayCreatureDetails(Creature c) {
    // draw life bar
    float life = c.setting.life;
    fill(min(255,max(-life*100,0)), min(255,max(life*100,0)), 0, 120);
    rect(barX+100, barY-8, map(life, 0, 200, 0, 100), 16);
    
    // draw perception rods
    float rodWidth = 8;
    float rodHeight = 16;
    color nutritionColor = color(255, 255, 255, 120);

    for (int i = c.setting.nPerception-1; i >=0 ; i--) { // descending loop to map natural direction to screen (left to right)
      PerceptionRod p = c.perceptionRods[i];
      fill(p.rodColor);
      rect(barX+i*rodWidth+10, barY+16, rodWidth, rodHeight);
      if (p.sightNutrition >= 0) {
        nutritionColor = color(50, 155+map(p.sightNutrition, 0, 10, 0, 100), 50, 120);
      } else {
        nutritionColor = color(155+map(-p.sightNutrition, 0, 10, 0, 100), 50, 50, 120);
      }
      fill(nutritionColor);
      rect(barX+10+i*rodWidth, barY+16+rodHeight+1, rodWidth, rodHeight);
      fill(50, 50, 200, map(p.sightDistance, 0, world.CreatureEyeSightLength, 150, 0));
      rect(barX+10+i*rodWidth, barY+16+2*rodHeight+2, rodWidth, rodHeight);
    }
    
  }
  
}

class Wall {
  PVector point1;
  PVector point2;
  color wallColor;
  float nutrition;

  Wall(float x1, float y1, float x2, float y2) {
    wallColor = color(127);
    point1 = new PVector(x1, y1);
    point2 = new PVector(x2, y2);
    nutrition = world.wallPenalty; // if critter hits wall, it loses some life.
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

class PerceptionRod {
  PVector theCenter;
  float directionDegree; // direction in degrees (not radians)
  PVector direction; // normalized direction vector.
  color rodColor;
  PVector point1;
  PVector point2;
  float bufferSpace = 4.0;

  // record what is seen
  int sightType;
  float sightLife;
  float sightNutrition;
  float sightDistance;

  PerceptionRod() {
    rodColor = color(230, 230, 230, 100);
    theCenter = new PVector(0.0, 0.0);
    direction = new PVector(0.0, 0.0);
    point1 = new PVector(0.0, 0.0);
    point2 = new PVector(0.0, 0.0);
  }

  void init(float cx, float cy, float r, float directionAngleDegrees, float eyeSight) {
    theCenter.x = cx;
    theCenter.y = cy;
    directionDegree = directionAngleDegrees;
    direction.x = world.fastCos(directionDegree);
    direction.y = world.fastSin(directionDegree);
    point1.x = (r + bufferSpace) * direction.x;
    point1.y = (r + bufferSpace) * direction.y;
    point2.x = (eyeSight) * direction.x;
    point2.y = (eyeSight) * direction.y;
    point1.add(theCenter);
    point2.add(theCenter);

    sightDistance = eyeSight;
    sightType = -2; // nothing
    sightLife = 0.0;
    sightNutrition = 0.0;
  }

  void processSight() {
    float x1, y1, x2, y2, cx, cy, r;
    float best, d2, dpt_creature;
    PVector pt;
    x1 = point1.x;
    y1 = point1.y;
    x2 = point2.x;
    y2 = point2.y;
    best = world.LARGENUM;

    // scan for walls
    float x3, y3, x4, y4;
    for (Wall w : world.walls) {
      x3 = w.point1.x;
      y3 = w.point1.y;
      x4 = w.point2.x;
      y4 = w.point2.y;
      pt = CustomTool.intersection_lineline(x1, y1, x2, y2, x3, y3, x4, y4);
      if (pt != null) {
        d2 = CustomTool.dist2(pt, point1);
        if (d2 < best) {
          best = d2;
          sightType = -1; // wall
          sightLife = 0.0; // no life for walls
          sightNutrition = w.nutrition;
          x2 = pt.x;
          y2 = pt.y;
        }
      }
    }

    // scan for creatures
    for (Creature c : world.creatures) {
      cx = c.position.x;
      cy = c.position.y;
      r = c.setting.radius;
      pt = CustomTool.getClosestPointToCenter( x1, y1, x2, y2, cx, cy, r);
      d2 = CustomTool.dist2(pt, point1);
      dpt_creature = CustomTool.dist2(pt, c.position);
      if (d2 < best && (dpt_creature < r*r) ) {
        best = d2;
        //sightDistance = eyeSight;
        sightType = c.creatureType; // nothing
        sightLife = c.setting.life;
        sightNutrition = c.setting.nutrition;
        x2 = pt.x;
        y2 = pt.y;
      }
    }

    point2.x = x2;
    point2.y = y2;
    sightDistance = sqrt(CustomTool.dist2(point1, point2));

    // update color
    if (sightType == world.TYPECRITTER) {
      rodColor = color(230, 0, 0, 50);
    } else if (sightType == world.TYPEFOOD) {
      if (sightNutrition >= 0) {
        rodColor = color(0, 230, 0, 50);
      } else {
        rodColor = color(0, 0, 230, 50);
      }
    } else if (sightType == -1) { // wall
      rodColor = color(200, 200, 200, 100);
    } else {
      rodColor = color(240, 240, 240, 100);
    }
  }

  void display() {
    stroke(rodColor);
    line(point1.x, point1.y, point2.x, point2.y);
  }
}

class CreatureSetting {
  float radius;
  color bodyColor;
  float maxSpeed;
  float maxForce;
  int nMembranePoints;
  float life; // the creature's life
  float nutrition; // how much life is available for other creatures if this creature died and is eaten.
  int nPerception; // how many perception sticks creature owns
  float eyeSight; // length (in pixels) of how far creature can see.

  CreatureSetting() {
    radius = 4;
    bodyColor = color(127, 127, 127, 127);
    maxSpeed = 1.0;
    maxForce = 1.0;
    nMembranePoints = 6;
    life = world.initLife;
    nutrition = 0.0;
    nPerception = 0;
    eyeSight = world.CreatureEyeSightLength;
  }

  CreatureSetting getCopy() {
    CreatureSetting result = new CreatureSetting();
    result.radius = radius;
    result.bodyColor = bodyColor;
    result.maxSpeed = maxSpeed;
    result.maxForce = maxForce;
    result.nMembranePoints = nMembranePoints;
    result.life = life;
    result.nutrition = nutrition;
    result.nPerception = nPerception;
    result.eyeSight = eyeSight;
    return result;
  }
}


class Creature {

  // All the usual stuff
  PVector position;
  CreatureSetting setting;
  PerceptionRod[] perceptionRods;
  PVector velocity;
  PVector acceleration;
  float directionAngle;

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

    // generate array of perception rods to see.
    perceptionRods = new PerceptionRod[setting.nPerception];

    for (int i = 0; i < setting.nPerception; i++) {
      perceptionRods[i] = new PerceptionRod();
    }

    // initial speed/accel etc
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    directionAngle = 0.0;

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

    // create possibility for bad food.
    if (creatureType == world.TYPEFOOD) {
      float nutrition = random(-world.foodNutrition, world.foodNutrition);
      if (nutrition >= 0) {
        nutrition = map(nutrition, 0, world.foodNutrition, world.foodNutrition/2, world.foodNutrition);
      } else {
        nutrition = -map(-nutrition, 0, world.foodNutrition, world.foodNutrition/2, world.foodNutrition);
      }
      float greenColor = 0;
      float blueColor = 0;
      if (nutrition > 0) { // good stuff is green
        greenColor = map(nutrition, 0, world.foodNutrition, 150, 205);
      } else { // bad stuff is blue
        blueColor = map(-nutrition, 0, world.foodNutrition, 150, 205);
      }
      setting.nutrition = nutrition;
      setting.bodyColor = color(125, 50+greenColor, 50+blueColor, 127);
    }
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

    //theTarget = getClosestTarget();
    theTarget = getWanderingTarget();
    
    // the below enables mosue to control the creature
    if ( world.HUMANCONTROLMODE == true && world.myCreature != null && world.myCreature.cid == cid) {
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

  // based off a number from 0 to 8 (exclisive) return the point on the circle that will be the target for agent.
  PVector getTargetFromAction(int action) {
    float angle = 360.0 * float(action)/float(world.nActionState);
    PVector theTarget = new PVector(world.fastCos(angle), world.fastSin(angle));
    PVector direction = new PVector();
    direction = velocity.get();
    direction.normalize();
    direction.mult(setting.radius);

    theTarget.mult(setting.radius);

    //    theTarget.rotate(directionAngle); // not implemented in processingjs
    world.rotatePVector(theTarget, directionAngle);

    theTarget.add(direction);
    theTarget.add(position);

    if (world.DEBUGTARGETMODE == true) {
      fill(200);
      ellipse(theTarget.x, theTarget.y, 4, 4);
      fill(255);
      PVector theCenter = new PVector();
      theCenter = PVector.add(direction, position);
      ellipse(theCenter.x, theCenter.y, setting.radius*2, setting.radius*2);
    }
    return theTarget;
  }

  PVector getWanderingTarget() {
    int action; // 0 to world.nActionState (exclisive), 
    action = int( random(0, world.nActionState) );

    return getTargetFromAction(action);
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
      d2 = CustomTool.dist2(position, theTarget);
      if (d2 < closest) {
        bestTarget = theTarget;
        closest = d2;
      }
    }
    if (bestTarget == null && creatureType == world.TYPECRITTER) {
      for (int i = 0; i < 30; i++) {
        world.addRandomCreature(world.TYPEFOOD);
      }
    }
    return bestTarget;
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector theTarget) {
    PVector desired = PVector.sub(theTarget, position);  // A vector pointing from the location to the target
    float magsq = CustomTool.dist2(theTarget, position);
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
      float d2 = CustomTool.dist2(position, other.position);
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
          // absorb nutrition after eating
          setting.life += other.setting.nutrition;
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

  // return the cloesest point from any wall in world.walls from self.
  PVector getClosestPointToWall() {
    PVector result;
    PVector pt;
    result = null;
    float best = world.LARGENUM;
    float x1, x2, y1, y2, cx, cy, r, d2;
    cx = position.x;
    cy = position.y;
    r = setting.radius;
    for (Wall w : world.walls) {
      x1 = w.point1.x;
      y1 = w.point1.y;
      x2 = w.point2.x;
      y2 = w.point2.y;
      pt = CustomTool.getClosestPointToCenter( x1, y1, x2, y2, cx, cy, r);
      d2 = CustomTool.dist2(pt, position);
      if (d2 < best) {
        best = d2;
        result = pt;
      }
    }
    return result;
  }

  void update() {

    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(setting.maxSpeed);

    directionAngle = degrees(atan2(velocity.y, velocity.x)); // update the direction angle of creature (radians);

    PVector wallPt;
    // do wall collision here
    wallPt = getClosestPointToWall();

    if (world.DEBUGWALLMODE == true) {
      fill(200);
      ellipse(wallPt.x, wallPt.y, 8, 8);
      line(wallPt.x, wallPt.y, position.x, position.y);
    }

    if (isInside(wallPt.x, wallPt.y) == true) {
      //do bounce here
      // u = (v · n / n · n) n 
      // w = v − u
      // v' = w - u
      //
      PVector u = new PVector();
      PVector n = new PVector();
      PVector w = new PVector();
      n = PVector.sub(position, wallPt);
      n.normalize();
      u = PVector.mult(n, PVector.dot(velocity, n));
      w = PVector.sub(velocity, u);
      velocity = PVector.sub(w, u);
      PVector bounce = new PVector();
      bounce = velocity.get();
      bounce.normalize();
      bounce.mult(setting.radius/4.0);
      position.add(bounce);
      
      // take off life for hitting wall:
      setting.life += world.wallPenalty;
    }

    position.add(velocity);

    // Reset accelertion to 0 each cycle
    acceleration.mult(0);

    // update perception rods
    float angleIncrement = 180.0 / float(setting.nPerception+1);

    float perceptionAngle = directionAngle+angleIncrement-90.0;// + angleIncrement;

    for (int i = 0; i < setting.nPerception; i++) {
      perceptionRods[i].init(position.x, position.y, setting.radius, perceptionAngle, setting.eyeSight);
      perceptionRods[i].processSight();
      perceptionAngle += angleIncrement;
    }
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

    // draw perception rods
    for (PerceptionRod p : perceptionRods) {
      p.display();
    }
  }
}

// A useful class to intersect lines and circles or to gest the closest point to a circle in a given segment
// author      Ale Gonzlez

static class CustomTool
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

  static boolean same_sign(float a, float b) {

    return (( a * b) >= 0);
  }

  // check for line-line intersection
  static PVector intersection_lineline(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

    float a1, a2, b1, b2, c1, c2;
    float r1, r2, r3, r4;
    float denom, offset, num;
    float x, y;
    x = 0;
    y = 0;

    PVector result;

    result = null;

    a1 = y2 - y1;

    b1 = x1 - x2;
    c1 = (x2 * y1) - (x1 * y2);

    r3 = ((a1 * x3) + (b1 * y3) + c1);
    r4 = ((a1 * x4) + (b1 * y4) + c1);

    if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)) {
      return result;
    }

    a2 = y4 - y3;
    b2 = x3 - x4;
    c2 = (x4 * y3) - (x3 * y4);

    r1 = (a2 * x1) + (b2 * y1) + c2;
    r2 = (a2 * x2) + (b2 * y2) + c2;

    if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))) {
      return result;
    }

    denom = (a1 * b2) - (a2 * b1);

    if (denom == 0) {
      return result;
    }

    if (denom < 0) {
      offset = -denom / 2;
    } else {
      offset = denom / 2 ;
    }

    num = (b1 * c2) - (b2 * c1);
    if (num < 0) {
      x = (num - offset) / denom;
    } else {
      x = (num + offset) / denom;
    }

    num = (a2 * c1) - (a1 * c2);
    if (num < 0) {
      y = ( num - offset) / denom;
    } else {
      y = (num + offset) / denom;
    }

    result = new PVector(x, y);

    return result;
  }
}

