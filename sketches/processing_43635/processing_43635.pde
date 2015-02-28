
// S H A D O W  E L E M E N T S

// GLOBAL CONSTANTS

// Size of window
final int X_SIZE = 500;
final int Y_SIZE = 323;

// Background image
final String imageName = "shadow2map.jpg";
PImage bgImage;
PImage newImage;
// Framerate in frames-per-second
final int FRAME_RATE = 600;

// ----------------------- V E H I C L E  C O N S T A N T S -------------------------
// Number of vehicles on the image
final int NUM_VEHICLES = 350;
final int VEHICLE_WIDTH = 4;
final int VEHICLE_LENGTH = 12;
final color VEHICLE_COLOR = #FF00FF;

// Increasing this increases the speed they travel
// also makes it harder for them to turn sharply
final float SPEED_MULT     = .2;

// Vehicle state information stored in this array
// of objects of class Vehicle
Vehicle[] vehicles = new Vehicle[NUM_VEHICLES];

// Leave trails as they move?
final boolean LEAVE_TRAILS = true;
// Amounts to change the underlying image color when leaving a trail
final color   TRAIL_COLOR = #44CCE0;  // The final color of the trail
final float   CHANGE_PER_TRAIL = 0.1; // the amount toward that color for each pass

// ----------------------- E L E M E N T  C O N S T A N T S -------------------------
final int NUM_ELEMENTS = 300;
final int ELEMENT_SIZE = 5;
final color ELEMENT_COLOR = #FFFFFF;
Element[] elements = new Element[NUM_ELEMENTS];


// --------------- S E T U P -------------------------------
// Initialize the starting conditions
// Randomly assign values to all cells
void setup()
{
  size(X_SIZE, Y_SIZE);
  background(255);
  bgImage = loadImage("shadow3map.jpg"); 
  newImage = loadImage ("USA.jpg");
  makeVehicles();
  makeElements();
  frameRate(FRAME_RATE);
}

// --------------- L O O P -------------------------------
void draw()
{
  drawImage();
  calculateNextVehicleStates();
  updateVehicleStates();
  //drawVehicles();
  //buildElements();
  detectCollisions();
}

// ----------------------- C L A S S   V E H I C L E --------------
// Vehicle is a class. We will discuss what that is in class on Friday.
// A class is a template for making objects. An object is a container for
// variables and functions. That is not enough explanation. Do not worry about it.
// But nonetheless know that each vehicle has all of the following attributes and
// can have any of the following calls made on it.
class Vehicle {

  float x, y, direction;    // Location and direction (direction is in radians)
  float nextX, nextY, nextDirection;  // Location and direction to update to
  float lSensorX, lSensorY, rSensorX, rSensorY;  // Left and right sensor locations
  float lSensorVal, rSensorVal;  // Left and right sensor values
  float width, length;           // Width and length of the vehicle (set by default to VEHICLE_WIDTH and VEHICLE_HEIGHT)
  int   type;                    // What type of vehicle is this?
  // Right now we are only using one type (0), but you might want to define more.
  color trailColor = TRAIL_COLOR;  // The color of the trail. Likely different for every vehicle type.
  color vehicleColor = VEHICLE_COLOR; // The color of the vehicle.
  boolean onEdge;                  // Have we hit an edge?


  // ------------------ V E H I C L E ---------------------------------
  // Constructor function. This is called each time a new vehicle object is
  // created. Randomly assigns state values. 
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

    // Leave the trail sticking out of the middle of the back of the vehicle
    if (LEAVE_TRAILS) {
      float dx2 = -(width/2) * sin(HALF_PI - direction);
      float dy2 = (width/2) * cos(HALF_PI - direction);
      int trailX = int(x - dx2);
      int trailY = int(y + dy2);
      int index = trailY*X_SIZE + trailX;
      if (index < 0 || index >= X_SIZE * Y_SIZE) {
        return;
      }
      color c = newImage.pixels[index];
      int dRed = int( (red(trailColor) - red(c)) * CHANGE_PER_TRAIL);
      int dGreen = int( (green(trailColor) - green(c)) * CHANGE_PER_TRAIL);
      int dBlue = int( (blue(trailColor) - blue(c)) * CHANGE_PER_TRAIL);

      newImage.pixels[index] = color(red(c)+dRed, green(c)+dGreen, blue(c)+dBlue);
    }
  }

  // ------------------ V E H I C L E  .  U P D A T E   S E N S O R   P O S I T I O N S ---------------------------------
  // Update where the vehicle's sensors are
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
  // Get values from the sensors (right now senses brightness only)
  // You could change that to have them sense whatever you want.
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
    rect(0, -5, width, length);
    popMatrix();

    ellipseMode(CENTER_DIAMETER);
    fill(#FFFFFF);
    ellipse(lSensorX, lSensorY, 3, 3);
    ellipse(rSensorX, rSensorY, 3, 3);
  }
}


// ----------------------- E L E M E N T  C L A S S ------------------------
class Element {
  float x, y;   //Location
  int type;   //Type of tower
  float eSize;
  boolean state;  //Is it mereged?

  // -------------------------- E L E M E N T ------------------------------
  Element(int atype) {
    type = atype;
    x = int(random(width));
    y = int(random(height));
    eSize = 4;
  }

  // ----------------------- E L E M E N T . B U I L D ---------------------
  void build() {
    fill(ELEMENT_COLOR);
    merge();
    rect(x, y, eSize, eSize);
  }

  // ----------------------- E L E M E N T . M E R G E --------------------
  void merge() { 
    boolean overlap;
    for (int i = 0; i < elements.length; i++) {
      overlap = distance(x, y, elements[i].x, elements[i].y) < eSize;
      if ((this != elements[i]) && overlap) {
        elements[i].x = this.x + eSize;
      }
    }
  }
}

// --------------- M A K E    E L E M E N T S -------------------------------
void makeElements() {
  for (int i = 0; i < NUM_ELEMENTS; i++) {
    elements[i] = new Element(0);
  }
}

// --------------- B U I L D  E L E M E N T S  ------------------------------
void buildElements() {
  for (int i = 0; i < NUM_ELEMENTS; i++) {
    elements[i].build();
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
  arrayCopy(newImage.pixels, 0, pixels, 0, X_SIZE*Y_SIZE);
  updatePixels();
}


// --------------- D R A W   V E H I C L E S ------------------------------
// Draw each vehicle
void drawVehicles() {
  for (int i = 0; i < NUM_VEHICLES; i++) {
    vehicles[i].draw();
  }
}

// --------------- D E T E C T  C O L L I S I O N S ------------------------
// Detect collisions between vehicles and elements
void detectCollisions() {
  float x1, y1, x2, y2;
  float tolerance = 3;
  for (int i = 0; i < NUM_VEHICLES; i++) {
    for (int ii = 0; ii < NUM_ELEMENTS; ii++) {
      x1 = vehicles[i].x;
      y1 = vehicles[i].y;
      x2 = elements[ii].x;
      y2 = elements[ii].y;

      if (distance(x1, y1, x2, y2) < tolerance) {
        elements[ii].x = vehicles[i].x;
        elements[ii].y = vehicles[i].y;
      }
    }
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


