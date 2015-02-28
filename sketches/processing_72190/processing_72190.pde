
//Chris_Scott_DSDN142_Project_3.
////////////////////////////////////////////////////////////////////////////////////
//StarField Veribles(Background Image).
////////////////////////////////////////////////////////////////////////////////////

float[] x = new float[900];
float[] y = new float[900];
float[] s = new float[900];

float x2 = 80;
float y2 = 80;

////////////////////////////////////////////////////////////////////////////////////
//Ship Veribles.
///////////////////////////////////////////////////////////////////////////////////

PVector shipLoc;             //Location.
PVector shipVel;             //Velocity.
PVector thrust;              //Force of Thurster/Boost.
PVector gravity;             //Force of Gravity.

float lifeLeft;              //Bar that indicates fuel/life total.
float lifeTotal;             //Life Total value.
boolean thrustOn = false;    //Afterburner-Graphical Effect.

float rotation;              //Angel that ship rotates at.
float pRotation;             //Volocity as rotate, workds with float rotation;.
PVector[] terrain;           // List of co-ords in terrain(death).

int refuelPad;               //Area on which player can re-fuel.

boolean firstGame;           //Determines weither or not game is been started prior.
boolean gameOver;            //Determines win or lose conditions.
boolean hasWon;              //Determines win conditions.

boolean highorbit = false;   // becomes true when lander is flying, values beging to decrease giving "page-scroll" effect.
//^ do I even need to implement this(?) will come back to.

/////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(700, 555);
  noCursor();                //Hides Mouse_Cursor. ( Y \ N(?))
  frameRate(60);
  background (0);

  initializeGame();

  firstGame = true;
  gameOver = true;

  ///////////////////////////////////////////////////////////////////////////////////
  //Starfield Loop

  int i = 0;
  while (i < 100) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    s[i] = random(1, 3);

    i = i +1;
  }
}

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

void initializeGame() {
  gameOver = false;
  hasWon = false;

  shipVel = new PVector(0, 0);
  thrust  = new PVector(0, 0);
  gravity = new PVector(0, 0.025);

  rotation  = 0;
  pRotation = 0;

  //////////////////////////////////////////////////////////////////////////////////////
  //Starting location and status(es) of ship.
  //////////////////////////////////////////////////////////////////////////////////////

  shipLoc   = new PVector(width / 2, height / 2);
  lifeTotal = 100.0;
  lifeLeft  = lifeTotal;

  //////////////////////////////////////////////////////////////////////////////////////  
  //Initilize Terrain Bounderies | Array
  //////////////////////////////////////////////////////////////////////////////////////

  terrain = new PVector[4];
  terrain[0] = new PVector(0, height - 32);
  terrain[1] = new PVector(50, height - 32);
  terrain[2] = new PVector(100, height - 65);
  terrain[3] = new PVector(160, height - 65);

  refuelPad = 60;
}

void draw() {
  background(0);

  /////////////////////////////////////////////////////////////////////////////////////
  //Draws Star_Field.
  /////////////////////////////////////////////////////////////////////////////////////
  int i = 0;
  while (i < 100) {
    float strcolo = map(s[i], 1, 5, 100, 255);
    stroke(strcolo);
    strokeWeight(s[i]+2);

    point(x[i], y[i]);
    x[i] = x[i] - s[i];
    if (x[i] < 0) { 
      x[i] = width;
    }
    i = i + 1;
  }

  /////////////////////////////////////////////////////////////////////////////////////
  //Simnple land mass, seperate from first void draw.
  /////////////////////////////////////////////////////////////////////////////////////

  noStroke();
  smooth();
  fill(100, 100, 10);
  ellipse (350, 555, 750, 150);
  fill(100, 110, 10);
  ellipse (350, 555, 700, 100);

  //Game-Ends when player hits screen sides.
  //////////////////////////////////////////////////////////////////////////////////////

  if (shipLoc.x > width || shipLoc.x < 0
    || shipLoc.y > height || shipLoc.y < 0) {
    gameOver = true;
  }

  if (thrustOn) {
    lifeLeft -=0.2;
    if (lifeLeft < 0) {
      lifeLeft = 0;
    }

    //When Burner off, stop pervious effect. | Fuel Remaining Conditions.
    ///////////////////////////////////////////////////////////////////////////////////////

    if (lifeLeft == 0) {
      thrust = new PVector(0, 0);
      thrustOn = false;
    }
    else {
      thrust = new PVector(sin(rotation) * 0.045, cos(rotation) * -0.045);
    }
  }



  else if (gameOver) {
    if (hasWon)
      fill (0, 225, 0);
    text("Click to begin.", width/2, 10, 0);
  }
  else {
    fill(255, 0, 0);
    textAlign(CENTER);
    text(".", width/2, 20, 0);
  }   

  if (gameOver) {
    thrustOn = false;
  }
  else {
    shipVel.add(thrust);
    shipVel.add(gravity);
    shipLoc.add(shipVel);

    rotation += pRotation;
  }

  drawlifeBar();
  drawTerrain();
  //drawRefuelPad();
  drawLanderAndConllision();
}

void mousePressed() {
  
  if (mouseButton == LEFT) {
    if (gameOver) {
      firstGame = false;
      initializeGame();
}  
    if (!gameOver) {
      thrustOn = true;
}

    pRotation = PI / 64;                 //Thrust Left.
}
  else if (mouseButton == RIGHT) {
    if (gameOver) {
      firstGame = false;
      initializeGame();
}  
    if (!gameOver) {
      thrustOn = true;
}

    pRotation = -PI / 64;                 //Thrust Right.
  }
}

void mouseDragged() {
  
    if (gameOver) {
      firstGame = false;
      initializeGame();
    }
    
    if (!gameOver) {
       thrustOn = true;
    }
}


void mouseReleased() {
  if (mouseButton == LEFT) {
      thrust = new PVector(0, 0);
      thrustOn = false;

      pRotation = 0;
  }    
    else if (mouseButton == RIGHT) {
      thrust = new PVector(0, 0);
      thrustOn = false;

      pRotation = 0;
  }
}

//Sets invisible landscape bounderies.
///////////////////////////////////////////////////////////////////////////////////////

void drawTerrain() {
  noStroke();
  PVector last = terrain[0];
  for (int i=1; i<terrain.length; i++) {
    line(last.x, last.y, terrain[i].x, terrain[i].y);
    last = terrain[i];
  }
}

//Draws area that allows for refueling ship.
///////////////////////////////////////////////////////////////////////////////////////

/*
void drawRefuelPad() {
 stroke(200, 200, 200);
 pushMatrix();
 
 
 PVector padPos = terrain[refuelPad];
 translate(padPos.x, padPos.y);
 
 PVector padVector = PVector.sub(terrain[refuelPad+1], terrain[refuelPad]);
 
 float angle = PVector.angleBetween(new PVector(1, 0), padVector);
 if (padVector.y < 0) {
 
 }
 rotate(angle);
 rect(0, 0, padVector.mag(), 10);
 popMatrix();
 */

//Displays Fuel_Ammount Bar.
////////////////////////////////////////////////////////////////////////////////////////

void drawlifeBar() {
  noFill();
  stroke(228, 128, 0);

  rect(10, 10, 100 * lifeLeft / lifeTotal, 10);
}

//Checks for Terrain Collisions + Draws ship.
////////////////////////////////////////////////////////////////////////////////////////

void drawLanderAndConllision() {
  PVector translation = new PVector(round(shipLoc.x), round(shipLoc.y));

  noFill();

  int shipW = 10;             // Width of ship.
  int shipH = 27;             // Height of ship.

  //Sets Center of ship in y direction + axies that ship will rotate around pivot point(?)
  ////////////////////////////////////////////////////////////////////////////////////////

  int cy = 10;

  //Creates flame visual for thruster.
  /////////////////////////////////////////////////////////////////////////////////////////

  if (thrustOn) {
    stroke(204, 102, 0);

    PVector flameTip = new PVector(0, shipH-cy + shipH*0.5);
    PVector flameLeft = new PVector(-shipW+2, shipH-cy);
    PVector flameRight = new PVector(shipW-2, shipH-cy);

    transform(flameTip, rotation, translation);
    transform(flameLeft, rotation, translation);
    transform(flameRight, rotation, translation);

    line(flameTip.x, flameTip.y, flameLeft.x, flameLeft.y);
    line(flameTip.x, flameTip.y, flameRight.x, flameRight.y);
    line(flameLeft.x, flameLeft.y, flameRight.x, flameRight.y);
  }

  stroke(80, 10, 0);

  //Draws the ship, like a bawse. Code is rendering me insane.
  //////////////////////////////////////////////////////////////////////////////////////////////

  PVector shipTip = new PVector(0, -cy);
  PVector shipLeft = new PVector(-shipW, shipH-cy);
  PVector shipRight = new PVector(shipW, shipH-cy);

  transform(shipTip, rotation, translation);
  transform(shipLeft, rotation, translation);
  transform(shipRight, rotation, translation);

  line(shipTip.x, shipTip.y, shipLeft.x, shipLeft.y);
  line(shipTip.x, shipTip.y, shipRight.x, shipRight.y);
  line(shipLeft.x, shipLeft.y, shipRight.x, shipRight.y);


  //Checks for vollision against terrain and ship.
  //////////////////////////////////////////////////////////////////////////////////////////////

  PVector end1 = terrain[0];
  for (int i=1; i<terrain.length; i++) {
    PVector end2 = terrain[i];

    boolean leftHull = intersect(shipTip, shipLeft, end1, end2);
    boolean rightHull = intersect(shipTip, shipRight, end1, end2);
    boolean bottom = intersect(shipLeft, shipRight, end1, end2);

    //Ship Collides with terrain, game over.
    //////////////////////////////////////////////////////////////////////////////////////////////

    if (leftHull || rightHull || bottom) {
      gameOver = true;

      //Will no lose if collide with refuel pad.
      //////////////////////////////////////////////////////////////////////////////////////////////

      if (i == refuelPad + 1) {
        if (bottom || (leftHull && rightHull)) {

          //Rechecks angle of ship.
          //////////////////////////////////////////////////////////////////////////////////////////////

          PVector shipBase = PVector.sub(shipRight, shipLeft);
          PVector padV =  PVector.sub(end2, end1);

          if (PVector.angleBetween(shipBase, padV) < PI/16) {
            // Now check that we are not moving too fast
            hasWon = shipVel.mag() < 1;
          }
        }
      }
    }

    end1 = terrain[i];
  }
}
void transform(PVector p, float rotation, PVector translation) {
  float x = p.x;
  float y = p.y;
  p.x = x * cos(rotation) - y * sin(rotation);
  p.y = x * sin(rotation) + y * cos(rotation);

  p.add(translation);
}

//Algorithm from third-party source, credits to http://comgeom.cs.uiuc.edu 
///////////////////////////////////////////////////////////////////////////////////////////////////

boolean intersect(PVector a, PVector b, PVector c, PVector d) {
  boolean acd = ccw(a, c, d) < 0;
  boolean bcd = ccw(b, c, d) < 0;
  boolean abc = ccw(a, b, c) < 0;
  boolean abd = ccw(a, b, d) < 0;

  return acd != bcd && abc != abd;
}

/**
 * Returns >0 if the three points are in clockwise order, <0 if they are
 * in counter clockwise order, or 0 if they are collinear.
 */
float ccw(PVector p1, PVector p2, PVector p3) {
  return (p2.x - p1.x) * (p3.y - p1.y) - (p2.y - p1.y) * (p3.x - p1.x);
}
