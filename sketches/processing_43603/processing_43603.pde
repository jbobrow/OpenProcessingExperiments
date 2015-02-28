
/*
 Alex Nelson, Iv Shqevi, and Adam Anzivino
 Project 2 
 Refrence: Yanni Code
 System: Expresses road mapping based on population. 
 We did this by using an image that shows population based on darker values for more densely populated areas.
 The lines were more attracted to darker values, therefore creating more roads in more populated areas.
 */





//Page Size
int X_SIZE = 500;
int Y_SIZE = 323;


//Images Used
PImage newImage;
PImage population;


//ROAD Data  
int NUM_ROADS = 10000;             
int ROAD_WIDTH = 2;
int ROAD_LENGTH = 4;
float SPEED_MULT = 2.0F;
ROAD[] ROADs = new ROAD[10000];     
boolean LEAVE_TRAILS = true;        // Trail is left which forms the roads
int TRAIL_COLOR = 0xff111111;
float CHANGE_PER_TRAIL = 0.01F;
int FRAME_RATE = 60;                // 60 frames per second


//Upload Images
void setup()
{
  size(500, 323);
  background(255);
  population = loadImage("us-population-map.jpg");
  newImage = loadImage("USA.jpg");
  makeROADs();     // Sets up variable to later be used to make the ROADs
  frameRate(60);      // The window will refresh 60 times a second
}

//Setting up commands
void draw()
{
  drawImage();
  calculateNextROADStates();
  updateROADStates();
}


void makeROADs()
{   
  for (int i = 0; i < 10000; i++)     // Start from 0 and go up by 1 until you reach 10000 roads
    ROADs[i] = new ROAD(0);
}

void calculateNextROADStates()        // Allows for each road to be different
{
  for (int i = 0; i < 10000; i++)    
    ROADs[i].calculateNextState();
}

void updateROADStates()               // Updates the image with the "next" roads
{
  for (int i = 0; i < 10000; i++)
    ROADs[i].updateState();
}

void drawImage()
{
  loadPixels();
  System.arraycopy(newImage.pixels, 0, pixels, 0, (X_SIZE*Y_SIZE)); 
  updatePixels();                                 // Takes the pixels and shows them in the newImage
}

void drawROADs()
{
  for (int i = 0; i < 10000; i++)
    ROADs[i].drawR();
}


//ROAD Setup
class ROAD {

  float x, y, direction;                         // Placement and direction
  float nextX, nextY, nextDirection;             // Movement and progression
  float lSensorX, lSensorY, rSensorX, rSensorY;  // Topo(aka Dark Tone) Location Sensor from left to right
  float lSensorVal, rSensorVal;                  // Sensor values from left to right
  float Rwidth, Rlength;                         // Length and Width of the roads around the topography
  int   type;                                    // Sets up variable for the line type 
  int trailColor;                                // Color of the ROAD's trail
  boolean onEdge;                                // Sets up true or false statement for when an edge has or hasn't been hit


//Road characteristics
  ROAD(int i)
  {
    type = i;
    trailColor = #000000;                        // Black trails
    x = random(X_SIZE);
    y = random(Y_SIZE);
    onEdge = true;   
    direction = random(0.0F,90F);   
    Rwidth = 2.0F;                           
    Rlength = 4;
  }

 
 
 //Update the vehicles variables
  void updateState()
  {
    x = nextX;      
    y = nextY;
    direction = nextDirection;
    updateSensorPositions();                                  //update where the sensors are location
    float f = -(Rwidth / 2.0F) * sin(1.570796F - direction);
    float f1 = (Rwidth / 2.0F) * cos(1.570796F - direction);
    int i = parseInt(x - f);
    int j = parseInt(y + f1);
    int k = j * 500 + i;
    if (k < 0 || k >= (X_SIZE*Y_SIZE))
    {
      return;
    } 
    else
    {
      //Locating RGB pixels in the image
      int l = newImage.pixels[k];
      int i1 = parseInt((red(trailColor) - red(l)) * 0.01F);
      int j1 = parseInt((green(trailColor) - green(l)) * 0.01F);
      int k1 = parseInt((blue(trailColor) - blue(l)) * 0.01F);
      newImage.pixels[k] = color(red(l) + (float)i1, green(l) + (float)j1, blue(l) + (float)k1);
      return;
    }
  }


  void updateSensorPositions()
  {
    float f = -Rlength * sin(direction);
    float f1 = Rlength * cos(direction);
    float f2 = -Rwidth * sin(1.570796F - direction);
    float f3 = Rwidth * cos(1.570796F - direction);
    rSensorX = x + f;
    rSensorY = y + f1;
    lSensorX = rSensorX - f2;
    lSensorY = rSensorY + f3;
  }
  
  
//Detecting brightness values of the image..darker areas on the image are more populated therefore they have more roads
  void readSensors()
  {
    if (lSensorY < 0 || lSensorY > Y_SIZE || lSensorX < 0F || lSensorX > X_SIZE)
    {
      lSensorVal = 0;
      onEdge = true;
    } 
    else
    {
      lSensorVal = (SPEED_MULT * brightness(population.get((int)lSensorX, (int)lSensorY))) / 255F;
    }
    if (rSensorY < 0.0F || rSensorY > 323F || rSensorX < 0.0F || rSensorX > 500F)
    {
      rSensorVal = 0.0F;
      onEdge = true;
    } 
    else
    {
      rSensorVal = (SPEED_MULT * brightness(population.get((int)rSensorX, (int)rSensorY))) / 255F;
    }
  }


//Updating direction of road
  void calculateNextState()
  {
    readSensors();
    if (onEdge)                                // If an edge is hit, 
    {
      nextX = random(500F);                         // then randomly replace the trails on the page
      nextY = random(323F);
      nextDirection = random(6.283185F);
      onEdge = false;
      return;
    }
    float f = lSensorVal;
    float f1 = rSensorVal;
    float f2 = atan2(f1 - f, Rwidth);
    float f3 = (f1 + f) / 2.0F;
    float f4 = cos(direction + f2 / 2.0F) * f3;
    float f5 = - sin(direction + f2 / 2.0F) * f3;
    nextX = x + f5;
    nextY = y + f4;
    nextDirection = direction + f2;
    if (nextDirection > 6.283185F)
      nextDirection -= 6.283185F;
  }

//Draw new road
  void drawR()
  {
    int i = parseInt(x);
    int j = parseInt(y);
    stroke(20);
    pushMatrix();
    translate(i, j);
    rotate(direction);
    rect(0.0F, 0.0F, Rwidth, Rlength);
    popMatrix();
    noStroke();
    ellipseMode(3);
    fill(0.0F, 0.0F, 220F);
    ellipse(lSensorX, lSensorY, 3, 3);
    ellipse(rSensorX, rSensorY, 3, 3);
  }
}


