
final int X_SIZE = 500;    //Program setup
final int Y_SIZE = 300;

final String imageName = "shadow2map.jpg";
final String imageName2 = "Architecture.jpg";
PImage bgImage;
PImage newPic;

final int FRAME_RATE = 75;

final int NUM_BUGS = 35;
final int BUG_WIDTH = 4;
final int BUG_LENGTH = 10;
final color BUG_COLOR = 255;
final float SPEED_MULT = 4;

Bug[] bugs = new Bug[NUM_BUGS];

final boolean LEAVE_TRAILS = true;
final float   CHANGE_PER_TRAIL = 0.1; 

void setup()
{
  size(500, 300);
  bgImage = loadImage(imageName);
  newPic = loadImage(imageName2);
  newPic.loadPixels();

  makeBugs();
  frameRate(FRAME_RATE);
}

void draw()
{
  background(255);
  drawImage();
  calculateNextBugStates();
  updateBugStates();
  drawBugs();
}

class Bug {   //Bug setup

  float x, y, direction;    
  float nextX, nextY, nextDirection;  
  float lSensorX, lSensorY, rSensorX, rSensorY;  
  float lSensorVal, rSensorVal;  
  float width, length;          
  int   type;                    
  color bugColor = BUG_COLOR; 
  boolean onEdge;

  Bug(int aType) {
    type = aType;
    x = random(X_SIZE);
    y = random(Y_SIZE);
    onEdge = false;

    direction = random(0, 360.0);
    width = BUG_WIDTH;
    length = BUG_LENGTH;
  }


  void updateState() {
    x = nextX;
    y = nextY;
    direction = nextDirection;
    updateSensorPositions();  

    if (LEAVE_TRAILS) {   //Bug trails revealing second image
      float dx2 = -(width/2) * sin(HALF_PI - direction);
      float dy2 = (width/2) * cos(HALF_PI - direction);
      int trailX = int(x - dx2);
      int trailY = int(y + dy2);
      int index = trailY*X_SIZE + trailX;
      if (index < 0 || index >= X_SIZE * Y_SIZE) {
        return;
      }

      bgImage.pixels[index] = newPic.pixels[index];
    }
  }

  void updateSensorPositions() {    //sensing black or white areas 
    float dx = -length * sin(direction);
    float dy = length * cos(direction);

    float dx2 = -width * sin(HALF_PI - direction);
    float dy2 = width * cos(HALF_PI - direction);

    rSensorX = x + dx;
    rSensorY = y + dy;

    lSensorX = rSensorX - dx2;
    lSensorY = rSensorY + dy2;
  }

  void readSensors() {    //sensors setup
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

  void calculateNextState() {    //bug boundaries
    readSensors();

    if (onEdge) {
      nextDirection = random(360);
      onEdge = false;
      return;
    }

    float vL = lSensorVal;    //Sensors
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


  void draw() {    //drawing the bug
    int ix = int(x);
    int iy = int(y);

    noStroke();
    fill(bugColor);

    pushMatrix();
    translate(ix, iy);
    rotate(direction);
    ellipse(0, -5, width, length);
    popMatrix();
    
   
  }
}

void makeBugs() {
  for (int i = 0; i < NUM_BUGS; i++) {
    bugs[i] = new Bug(0);
  }
}

void calculateNextBugStates() {
  for (int i = 0; i < NUM_BUGS; i++) {
    bugs[i].calculateNextState();
  }
}

void updateBugStates() {
  for (int i = 0; i < NUM_BUGS; i++) {
    bugs[i].updateState();
  }
}

void drawImage() {    //shows the background image
  loadPixels();
  arrayCopy(bgImage.pixels, 0, pixels, 0, X_SIZE*Y_SIZE);
  updatePixels();
}


void drawBugs() {
  for (int i = 0; i < NUM_BUGS; i++) {
    bugs[i].draw();
  }
}

float distance(float x1, float y1, float x2, float y2) { 
  float dist;
  float dx, dy;
  dx = abs(x1 - x2);
  dy = abs(y1 - y2);
  dist = sqrt(sq(dx) + sq(dy));
  return dist;
} 


