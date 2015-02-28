
//Project 3 by Carson Russell
/*source code borrowed from Yanni Loukissas' Braitenburg Vehicles & updated to run on current build of Processing
There seems to be a bug that allows the vehicles to get stuck on the edges of the sketch

*/










// Window Size
final int X_SIZE = 600;
final int Y_SIZE = 600;

// Image for analysis
final String imageName = "Inverse.jpg";
PImage bgImage;

// Framerate in frames-per-second
final int FRAME_RATE = 600;

//VEHICLE DATA
// Number of vehicles on the image

final int NUM_VEHICLES = 100;
final int VEHICLE_WIDTH = 1;
final int VEHICLE_LENGTH = 1;
final color VEHICLE_COLOR = #FF00FF;
final float SPEED_MULT     = 2;


Vehicle[] vehicles = new Vehicle[NUM_VEHICLES];      //Vehicle state information

//color trail Boolean

final boolean LEAVE_TRAILS = true;
final color   TRAIL_COLOR = #A5F262;  // The color of the trail
final float   CHANGE_PER_TRAIL = 0.1; // the amount toward that color for each pass


void setup(){
  
  size(600, 600);
  background(255);
  bgImage = loadImage(imageName);
  makeVehicles();
  frameRate(FRAME_RATE);
}

void draw(){
  
  drawImage();
  calculateNextVehicleStates();
  updateVehicleStates();
  drawVehicles();
}

// VEHICLE CLASS
class Vehicle {

  float x, y, direction;                // Location and direction (direction is in radians)
  float nextX, nextY, nextDirection;    // Location and direction to update to
  float lSensorX, lSensorY, rSensorX, rSensorY;  // Left and right sensor locations
  float lSensorVal, rSensorVal;          // Left and right sensor values
  float width, length;                   // Width and length of the vehicle (set by default to VEHICLE_WIDTH and VEHICLE_HEIGHT)
  int   type;                            // What type of vehicle is this?
                                         // Right now we are only using one type (0), but you might want to define more.
  color trailColor = TRAIL_COLOR;        // The color of the trail. Likely different for every vehicle type.
  color vehicleColor = VEHICLE_COLOR;   // The color of the vehicle.
  boolean onEdge;                        // Have we hit an edge?
 
 
//VEHICLE DIMENSIONS and LOCATION
  Vehicle(int aType) {
    type = aType;
    x = random(X_SIZE);
    y = random(Y_SIZE);
    onEdge = false;
    
    direction = random(0, 360.0);
    width = VEHICLE_WIDTH;
    length = VEHICLE_LENGTH;
  }
  
// ------------------ V E H I C L E  .  U P D A T E   S T A T E ---------------------------------
// Update the vehicle's internal state with the new values
  void updateState() {
    x = nextX;
    y = nextY;
    direction = nextDirection;
    updateSensorPositions();  // Update where the sensors are
    

    if (LEAVE_TRAILS) {
      float dx2 = -(width/2) * sin(HALF_PI - direction);
      float dy2 = (width/2) * cos(HALF_PI - direction);
      int trailX = int(x - dx2);
      int trailY = int(y + dy2);
      int index = trailY*X_SIZE + trailX;
      if (index < 0 || index >= X_SIZE * Y_SIZE) {
        return;
      }
      color c = bgImage.pixels[index];
      int dRed = int( (red(trailColor) - red(c)) * CHANGE_PER_TRAIL);
      int dGreen = int( (green(trailColor) - green(c)) * CHANGE_PER_TRAIL);
      int dBlue = int( (blue(trailColor) - blue(c)) * CHANGE_PER_TRAIL);
      
      bgImage.pixels[index] = color(red(c)+dRed,green(c)+dGreen,blue(c)+dBlue);
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
  
// ------------------ V E H I C L E  .  R E A D   S E N S O R S ---------------------------------
  void readSensors() {    
    if (lSensorY < 0 || lSensorY > Y_SIZE || lSensorX < 0 || lSensorX > X_SIZE) {
      lSensorVal = 0;
      onEdge = true;
    }
    else {
      lSensorVal = SPEED_MULT * brightness(get((int)lSensorX, (int)lSensorY)) / 255.0;
    }
    
    if (rSensorY < 0 || rSensorY > Y_SIZE || rSensorX < 0 || rSensorX > X_SIZE) {
      rSensorVal = 0;
      onEdge = true;
    }
    else {
      rSensorVal = SPEED_MULT * brightness(get((int)rSensorX, (int)rSensorY)) / 255.0;
    }
  }
  
// ------------------ V E H I C L E  .  C A L C U L A T E   N E X T   S T A T E ---------------------------------
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
   /*  
    noStroke();
    fill(vehicleColor);
    
    pushMatrix();
    translate(ix, iy);
    rotate(direction);
    rect(0, -5, width, length);
    popMatrix();
    
    ellipseMode(CENTER_DIAMETER);
    fill(#FFFFFF);
    ellipse(lSensorX, lSensorY, 3, 3);
    ellipse(rSensorX, rSensorY, 3, 3);*/
  
  }
}



// --------------- M A K E    V E H I C L E S -------------------------------
// Initialize all the vehicle data randomly
void makeVehicles() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i] = new Vehicle(0);
  }
}

// --------------- C A L C U L A T E   N E X T   V E H I C L E   S T A T E S --------------
// Loop through and calculate the next state for each vehicle
void calculateNextVehicleStates() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i].calculateNextState();
  }
}

// --------------- U P D A T E   V E H I C L E   S T A T E S --------------
// Loop through and give each vehicle its next state
void updateVehicleStates() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i].updateState();
  }
}


// -------------- D R A W   I M A G E ------------------------------------
// Draw the background image (continuously effaced with trails)
void drawImage() {
  loadPixels();
  System.arraycopy(bgImage.pixels , 0, pixels, 0, X_SIZE*Y_SIZE);
  updatePixels();
}


// --------------- D R A W   V E H I C L E S ------------------------------
// Draw each vehicle
void drawVehicles() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i].draw();
  }
}


//DISTANCE
  float distance(float x1, float y1, float x2, float y2) { 
    float dist;
    float dx, dy;
    dx = abs(x1 - x2);
    dy = abs(y1 - y2);
    dist = sqrt(sq(dx) + sq(dy));
    return dist;
  } 

