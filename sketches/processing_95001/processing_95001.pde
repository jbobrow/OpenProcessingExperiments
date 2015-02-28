
//planets
// panet = (force, acceleration, velocity, position, colour, mass, size) /////////////////////
int numberOfPlanets = 10;
Planet planet[] = new Planet[numberOfPlanets];
// player
Spaceship ship = new Spaceship(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(800, 850), new PVector(100, 100, 100), 10, 10);
// portal
Portal portal = new Portal(new PVector(100, 100));
float portalDistance;
//fuel
float maxFuel = 100;
float fuel = maxFuel;

// definition of levels ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int levelsCompleted = 0;
int level = 1;
boolean startLevel = false;
boolean nextLevel = false;
int planetsInLevel;

void levelOne() {
  portal.position = new PVector(100, 100);
  planet[0] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(600, 450), new PVector(230, 230, 0), 200, 70);
  ship = new Spaceship(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(800, 850), new PVector(100, 100, 100), 10, 10);
}

void levelTwo() {
  portal.position = new PVector(50, 50);
  planet[0] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(200, 300), new PVector(230, 230, 0), 200, 70);
  planet[1] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(550, 450), new PVector(230, 6, 100), 100, 40);
  planet[2] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(800, 200), new PVector(0, 30, 200), 70, 30);
  ship = new Spaceship(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(850, 850), new PVector(100, 100, 100), 10, 10);
}

void levelThree() {
  portal.position = new PVector(800, 800);
  planet[0] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(300, 600), new PVector(230, 230, 0), 200, 70);
  planet[1] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(300, 200), new PVector(230, 6, 100), 20, 40);
  planet[2] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(700, 700), new PVector(0, 200, 50), 70, 30);
  planet[3] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(800, 200), new PVector(240, 0, 0), 80, 100);
  ship = new Spaceship(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(50, 50), new PVector(100, 100, 100), 10, 10);
}


void generateLevel() { // random level generation
  for (int j = 0; j < 10; j++) {
    planet[j] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0, 0), 0, 0);
    planet[j].planetSize = 1.2*(planet[j].mass);
  }
  planetsInLevel = int(random(7) + 3);
  portal.position = new PVector(random(800), random(500));
  for (int j = 0; j < planetsInLevel; j++) {
    planet[j] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(random(1000), random(700)), new PVector(random(255), random(255), random(255)), random(50) + 20, 0);
    planet[j].planetSize = 1.2*(planet[j].mass);
    if ((dist(portal.position.x, portal.position.y, planet[j].position.x, planet[j].position.y)) < (40)) {
      planet[j].position.x += -50;
      planet[j].position.y += -50;
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// for rotation and thrusters///////////
float theta = PI/2;
PVector rotation = new PVector(0, 0);
PVector shipDirection = new PVector(0, 0);
float thrust = 0;
PVector thrustDirection = new PVector(0, 0);
///////////////////////////////////////////

// these are for WASD ////////////////
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int result;
///////////////////////////////////////

void setup() {
  size(1200, 900);
  background(0);
  rectMode(CENTER);

  //initiallize array of planets//////////////////////////
  for (int j = 0; j < numberOfPlanets; j++) {
    planet[j] = new Planet(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0, 0), 0, 0);
  }
  ////////////////////////////////////////////////////////
}

void draw() {
  background(50);
  
  // levels completed counter
  text("Levels Completed: " + levelsCompleted, 1050, 50);
  //////
  
  thrust = 0;

  // positioning portal and planets in each level///////////////
  if ((level == 1) && (startLevel == false)) {
    levelOne();
    fuel = maxFuel;
  }
  // intro text////
  if (level == 1) {
    text("W - Forward Thruster", 1000, 200);
    text("S - Reverse Thruster", 1000, 215);
    text("A - Rotate Counter-clockwise", 1000, 230); 
    text("D - Rotate Clockwise", 1000, 245); 
    text("R - Reset Level", 1000, 260); 
    text("N - Generate New Level", 1000, 275);
    text("(after level 3)", 1000, 290);
    /////////////////
  }
  if ((level == 2) && (startLevel == false)) {
    levelTwo();
    fuel = maxFuel;
  }
  if ((level == 3) && (startLevel == false)) {
    levelThree();
    fuel = maxFuel;
  }
  if ((level > 3) && (startLevel == false)) {
    fuel = maxFuel;
    if (nextLevel == true) {
      generateLevel();
      nextLevel = false;
    }
  }

  for (int j = 0; j < numberOfPlanets; j++) {
    planet[j].update();
  }
  portal.update();

  //////////////////////////////////////////////////////////////

  // this makes WASD happen //////////////////////////////////////////////
  // disclaimer: I stole this from the internet. thank you internet////////////////
  switch(result) {
  case NORTH: 
    thrust = 3;
    startLevel = true;
    fuel--;
    break;
  case EAST: 
    theta += -0.1;
    break;
  case SOUTH: 
    thrust = -3;
    startLevel = true;
    fuel--;
    break;
  case WEST: 
    theta += 0.1;
    break;
  case NORTH|EAST: 
    thrust = 3; 
    theta += -0.1; 
    startLevel = true;
    fuel--;
    break;
  case NORTH|WEST: 
    thrust = 3; 
    theta += 0.1; 
    startLevel = true;
    fuel--;
    break;
  case SOUTH|EAST: 
    thrust = -3; 
    theta += -0.1; 
    startLevel = true;
    fuel--;
    break;
  case SOUTH|WEST: 
    thrust = -3; 
    theta += 0.1; 
    startLevel = true;
    fuel--;
    break;
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // reset level ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (keyPressed) { // pressing reset button
    if ((key == 'r') || (key == 'R')) {
      if (level < 4) {
        startLevel = false;
      }
      else {
        ship.position = new PVector(1100, 800);
        ship.force.mult(0);
        ship.acceleration.mult(0);
        ship.velocity.mult(0);
        ship.update();
        startLevel = false;
      }
    }
  }

  for (int j = 0; j < numberOfPlanets; j++) { // death by falling into planet
    if (dist(ship.position.x, ship.position.y, planet[j].position.x, planet[j].position.y) < (planet[j].planetSize - 10))
      if (level < 4) {
        startLevel = false;
      }
      else {
        ship.position = new PVector(1100, 800);
        ship.force.mult(0);
        ship.acceleration.mult(0);
        ship.velocity.mult(0);
        ship.update();
        startLevel = false;
      }
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // get a new level /////////////////////////////////////////////////////////////////////////////////////////////////
  if (keyPressed) {
    if ((key == 'n') || (key == 'N')) {
      if (level > 3) {
        generateLevel();
        nextLevel = true;
        ship.position = new PVector(1100, 800);
        ship.force.mult(0);
        ship.acceleration.mult(0);
        ship.velocity.mult(0);
        ship.update();
        startLevel = false;
        delay(100);
      }
    }
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////

  // for rotation and thrusters/////////////////////////////////////////////////////////////////////////////
  rotation.x = 100 * cos(theta);
  rotation.y = 100 * sin(theta);

  fill(0, 255, 0);
  line(ship.position.x, ship.position.y, ship.position.x + rotation.x, ship.position.y - rotation.y);

  shipDirection = new PVector((ship.position.x + rotation.x), (ship.position.y - rotation.y));
  thrustDirection = PVector.sub(shipDirection, ship.position);
  thrustDirection.normalize();
  thrustDirection.mult(thrust);

  if (startLevel == true) {
    for (int j = 0; j < numberOfPlanets; j++) {
      ship.netForce(planet[j]);
    }
    if (fuel > 0) {
      ship.force.add(thrustDirection);
    }
  }
  ship.update();
  /////////////////////////////////////////////////////////////////////////////

  // fuel bar ////////////////////////////////////////////////////////////////
  fill(0, 255, 0);
  rectMode(CORNER);
  rect(0, 880, fuel*5, 20);
  rectMode(CENTER);
  text("Fuel:", 15, 875); 
  /////////////////////////////////////////////////////////////////////

  //portal collision ///////////////////////////////////////////////////
  portalDistance = dist(ship.position.x, ship.position.y, portal.position.x, portal.position.y);
  if (portalDistance < 30) {
    levelsCompleted++;
    level++;
    if (level > 3) {
      generateLevel();
      nextLevel = true;
      ship.position = new PVector(1100, 800);
      ship.force.mult(0);
      ship.acceleration.mult(0);
      ship.velocity.mult(0);
      ship.update();
    }
    startLevel = false;
  }
  //////////////////////////////////////////////////////////////////////////////
}

class Portal {

  PVector position;

  Portal(PVector position_) {
    position = position_;
  }

  // set portal position
  void update() {
    fill(0, 50, 250);
    noStroke();
    ellipse(position.x, position.y, 30, 30); 
    fill(0, 50, 250, 150);
    ellipse(position.x, position.y, 45, 45); 
    stroke(0);
  }
}

class Spaceship {

  PVector force;
  PVector acceleration;
  PVector velocity;
  PVector position;
  PVector colour;
  float mass;
  float planetSize;

  Spaceship(PVector force_, PVector acceleration_, PVector velocity_, PVector position_, PVector colour_, float mass_, float planetSize_) {
    force = force_;
    acceleration = acceleration_;
    velocity = velocity_;
    position = position_;
    colour = colour_;
    mass = mass_;
    planetSize = planetSize_;
  }

  //find net force 
  void netForce(Planet p) {
    float G = 50;
    float planetDistance;
    PVector interplanetaryForce = PVector.sub(p.position, position); //direction
    interplanetaryForce.normalize();
    //
    PVector v = p.position;
    planetDistance = dist(position.x, position.y, v.x, v.y);
    if (planetDistance < 35) {
      planetDistance = 35;
    } //r
    interplanetaryForce.mult(G*mass*p.mass/sq(planetDistance)); //Fg
    force.add(interplanetaryForce); //net force
  }

  //update stats
  void update() {
    acceleration = force; // a = F/m
    acceleration.div(mass);
    velocity.add(acceleration);
    velocity.limit(15);
    position.add(velocity);
    fill(colour.x, colour.y, colour.z);
    rectMode(CENTER);
    rect(position.x, position.y, planetSize, planetSize);
    force = new PVector(0, 0);
  }
}

class Planet {

  PVector force;
  PVector acceleration;
  PVector velocity;
  PVector position;
  PVector colour;
  float mass;
  float planetSize;

  Planet(PVector force_, PVector acceleration_, PVector velocity_, PVector position_, PVector colour_, float mass_, float planetSize_) {
    force = force_;
    acceleration = acceleration_;
    velocity = velocity_;
    position = position_;
    colour = colour_;
    mass = mass_;
    planetSize = planetSize_;
  }

  //find net force 
  void netForce(Planet p) {
    float G = 30;
    float planetDistance;
    PVector interplanetaryForce = PVector.sub(p.position, position); //direction
    interplanetaryForce.normalize();
    //
    PVector v = p.position;
    planetDistance = dist(position.x, position.y, v.x, v.y);
    if (planetDistance < 50) {
      planetDistance = 50;
    } //r
    interplanetaryForce.mult(G*mass*p.mass/sq(planetDistance)); //Fg
    force.add(interplanetaryForce); //net force
  }

  //update stats
  void update() {
    fill(colour.x, colour.y, colour.z);
    ellipse(position.x, position.y, planetSize, planetSize);
  }
}

// makes WASD happen continued
////////////////////////////////////////////////
void keyPressed() {
  switch(key) {
    case('w'):
    case('W'):
    result |=NORTH;
    break;
    case('d'):
    case('D'):
    result |=EAST;
    break;
    case('s'):
    case('S'):
    result |=SOUTH;
    break;
    case('a'):
    case('A'):
    result |=WEST;
    break;
  }
}

void keyReleased() {  
  switch(key) {
    case('w'):
    case('W'):
    result ^=NORTH;
    break;
    case('d'):
    case('D'):
    result ^=EAST;
    break;
    case('s'):
    case('S'):
    result ^=SOUTH;
    break;
    case('a'):
    case('A'):
    result ^=WEST;
    break;
  }
}
/////////////////////////////////////////////////


