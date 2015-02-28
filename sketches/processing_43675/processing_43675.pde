
//Project 2: System Study
//By Adrianne Blossom & Araceli Bollo
//October 23, 2011
//Original Soure Code: Braitenberg Vehicles-Shadow Elements Redux


final String imageName = "RBWCircles.jpg";
PImage bgImage;

final int FRAME_RATE = 60;

// ----------------------- V E H I C L E  C O N S T A N T S -------------------------
// Number of vehicles on the image
final int NUM_VEHICLES = 50;
final int VEHICLE_WIDTH = 4;
final int VEHICLE_LENGTH = 12;
final color VEHICLE_COLOR = #FF0000;

final float SPEED_MULT     = 4;

Vehicle[] vehicles = new Vehicle[NUM_VEHICLES];

//Trails
final boolean LEAVE_TRAILS = true;
// Below, CHANGE_PER_TRAIL controls the color value amount of trails left behind points and gets darker until it reaches the pure TRAIL_Color value.
final color   TRAIL_COLOR = #262DD3;
final float   CHANGE_PER_TRAIL = 0.1;


// --------------- S E T U P -------------------------------
void setup()
{
  size(400,400);
  background(255);
  bgImage = loadImage(imageName);
  makeVehicles();
  frameRate(FRAME_RATE);
}

// --------------- L O O P -------------------------------
void draw()
{
  drawImage();
  calculateNextVehicleStates();
  updateVehicleStates();
  drawVehicles();
  detectCollisions();
}

// ----------------------- C L A S S   V E H I C L E --------------
class Vehicle {

  float x, y, direction;    // Location and direction (direction is in radians)
  float nextX, nextY, nextDirection;  // Location and direction to update to
  float lSensorX, lSensorY, rSensorX, rSensorY;  // Left and right sensor locations
  float lSensorVal, rSensorVal;  // Left and right sensor values
  float width, length;           // Width and length of the vehicle (set by default to VEHICLE_WIDTH and VEHICLE_HEIGHT)
  int   type;                    // Vehicle Type
  color trailColor = TRAIL_COLOR;  
  color vehicleColor = VEHICLE_COLOR; 
  boolean onEdge; 



  // ------------------ V E H I C L E --------------------------------- 
  Vehicle(int aType) {
    type = aType;
    x = random(400);
    y = random(400);
    onEdge = false;

    direction = random(0, 360.0);
    width = VEHICLE_WIDTH;
    length = VEHICLE_LENGTH;
  }

  // ------------------ V E H I C L E  .  U P D A T E   S T A T E ---------------------------------
  void updateState() {
    x = nextX;
    y = nextY;
    direction = nextDirection;
    updateSensorPositions();  



    if (LEAVE_TRAILS) {
      float dx2 = -(width/2) * sin(HALF_PI - direction);
      float dy2 = (width/2) * cos(HALF_PI - direction);
      int trailX = int(x - dx2);
      int trailY = int(y + dy2);
      int index = trailY*400 + trailX;
      if (index < 0 || index >= 400* 400) {
        return;
      }
      color c = bgImage.pixels[index];
      int dRed = int( (red(trailColor) - red(c)) * CHANGE_PER_TRAIL);
      int dGreen = int( (green(trailColor) - green(c)) * CHANGE_PER_TRAIL);
      int dBlue = int( (blue(trailColor) - blue(c)) * CHANGE_PER_TRAIL);

      bgImage.pixels[index] = color(red(c)+dRed, green(c)+dGreen, blue(c)+dBlue);
    }
  }

  // ------------------ V E H I C L E  .  U P D A T E   S E N S O R   P O S I T I O N S ---------------------------------
  void updateSensorPositions() {
    float dx = -length * sin(direction);
    float dy = length * cos(direction);

    float dx2 = -width * sin(HALF_PI - direction);
    float dy2 = width * cos(HALF_PI - direction);

    rSensorX = x + dx;
    rSensorY = y + dy;

    lSensorX = rSensorX - dx2;
    lSensorY = rSensorY + dy2;
  }

  // ------------------ V E H I C L E  .  R E A D   S E N S O R S . WHITE ---------------------------------
  /* Get values from the sensors (right now senses brightness only)
   Here is where we encountered the most trouble with the code and trying to get the vehicles to behave in a certain way.
   What we ended up discovering is that changing one sensors onEdge value to false did not kill the vehicle but instead caused
   it to stop on the edge of the sketch. We wanted it to stop in the red. Now the vehicles stop and create a frame around the
   circles.*/
  void readSensors() {    
    if (lSensorY < 0 || lSensorY > 400 || lSensorX < 0 || lSensorX > 400) {
      lSensorVal = 0;
      onEdge = true;
    }
    else {
      lSensorVal = SPEED_MULT * brightness(get((int)lSensorX, (int)lSensorY)) / 255.0;
    }

    if (rSensorY < 0 || rSensorY > 400 || rSensorX < 0 || rSensorX > 400) {
      rSensorVal = 0;
      onEdge =false ;
    }
    else {
      rSensorVal = SPEED_MULT * brightness(get((int)rSensorX, (int)rSensorY)) / 255.0;
    }
  }

  // ------------------ V E H I C L E  .  C A L C U L A T E   N E X T   S T A T E ---------------------------------
  // Determine what the nest state should be depending on the sensor values
  void calculateNextState() {
    readSensors();

    // If you've hit an edge, reposition randomly
    if (onEdge) {
      nextDirection = random(360);
      onEdge = false;
      return;
    }

    // Here's where you'd cross sensor wires. vL and vR are velocity of left and right
    // wheels, and lSensorVal and rSensorVal are the left and right sensor values.
    // A lot of behavior can be changed by messing with these two lines.
    float vL = lSensorVal;
    float vR = rSensorVal;    

    float dRot = atan2((vR - vL), width);
    float avg = (vR + vL) / 2.0;
    float dy = cos(direction + (dRot / 2.0)) * avg;
    float dx = -sin(direction + (dRot / 2.0)) * avg;

    nextX = x + dx;
    nextY = y + dy;
    nextDirection = direction + dRot;
    if (nextDirection > TWO_PI) {
      nextDirection -= TWO_PI;
    }
  }

  // ------------------ V E H I C L E  .  D R A W ---------------------------------
  // Draw the vehicle
  void draw() {
    int ix = int(x);
    int iy = int(y);

    noStroke();
    fill(vehicleColor);

    pushMatrix();
    translate(ix, iy);
    rotate(direction);
    ellipse(5, -5, 2, 2);
    popMatrix();

    ellipseMode(CENTER_DIAMETER);
    ellipse(lSensorX, lSensorY, 0, 0);
    ellipse(rSensorX, rSensorY, 0, 0);
  }
}

// --------------- M A K E    V E H I C L E S -------------------------------
void makeVehicles() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i] = new Vehicle(0);
  }
}

// --------------- C A L C U L A T E   N E X T   V E H I C L E   S T A T E S --------------
void calculateNextVehicleStates() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i].calculateNextState();
  }
}

// --------------- U P D A T E   V E H I C L E   S T A T E S --------------
void updateVehicleStates() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i].updateState();
  }
}


// -------------- D R A W   I M A G E ------------------------------------
// Draw the background image (continuously effaced with trails)
void drawImage() {
  loadPixels();
  arrayCopy(bgImage.pixels, 0, pixels, 0, 400*400);
  updatePixels();
}


// --------------- D R A W   V E H I C L E S ------------------------------
void drawVehicles() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i].draw();
  }
}

// --------------- D E T E C T  C O L L I S I O N S ------------------------
void detectCollisions() {
  float x1, y1;
  float tolerance = 3;
  for (int i = 0; i < NUM_VEHICLES; i++) {
    x1 = vehicles[i].x;
    y1 = vehicles[i].y;
  }
}



// --------------- D I S T A N C E ----------------------
float distance(float x1, float y1, float x2, float y2) { 
  float dist;
  float dx, dy;
  dx = abs(x1 - x2);
  dy = abs(y1 - y2);
  dist = sqrt(sq(dx) + sq(dy));
  return dist;
} 


