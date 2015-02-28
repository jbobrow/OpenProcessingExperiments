
Spawner[] myCrystalArray;
Spawner myCrystal;

int maxGeneration;
int counter;
int objectCounter;
int amount;
int delay;
int weight;
int childrenChance;
float speed;
boolean debugMode;
color cBackground;
float childDelay;
float noiseStrength;
float noiseAngle;
float myAngle;
float speedVar;

void setup() {
  smooth();
  size(768, 768);
  frameRate(30);
  myCrystalArray = new Spawner[1000];
  myInit();
}

void myInit () {
  debugMode = false;
  cBackground = color(255);
  amount = 40;
  delay = 5;
  weight = 6;
  childrenChance = 1;
  speed = 2;
  maxGeneration = 3;
  childDelay = 10;
  noiseStrength = 0;
  noiseAngle = 0;
  myAngle = 45;
  speedVar = 0.3;
}

void draw() {  
  counter++;

  // CREATE NEW CRYSTALS WITH A SLIGHT DELAY
  if (counter > delay && objectCounter < amount) {
    float out_angle;
    PVector out_vector = getPointOnEdge(width, height);
    out_angle = getAngle(out_vector) + int(getRandomMinus(myAngle));
    myCrystalArray[objectCounter] = new Spawner(out_vector, out_angle, speed, weight, childrenChance);
    objectCounter++;
    counter-=counter;
  } 

  if (debugMode == true) background(cBackground);

  // LOOK OUT FOR OBSTACLES. STOP WHEN FOUND ONE.
  for (int i=0; i<objectCounter; i++) {
    myCrystalArray[i].checkObstacles();
    if (myCrystalArray[i].obstacle == false) {
      myCrystalArray[i].moveLine();
    }
  }

  // DRAW BACKGROUND, THEN DRAW LINES
  if (debugMode == false) background(cBackground);
  for (int i=0; i<objectCounter; i++) {
    myCrystalArray[i].drawLine();
  }
}


void mousePressed() {
  myInit();
  counter = 0;
  objectCounter = 0;
}

void keyPressed() {
  if (key == 'w') noiseAngle+=.25;
  else if (key == 's') noiseAngle-=.25;
  else if (key == 'd') debugMode=!debugMode;
  else if (key == 'p') {
    saveFrame("capture ####.png");
    println("image saved");
  }
}


// GET DIRECTION FOR POINT ON BORDER
int getAngle(PVector in_vector) {
  int angle = 0;
  if (in_vector.x == 0) angle = 90;
  else if (in_vector.x == width) angle = 270;
  else if (in_vector.y == 0) angle = 0;
  else if (in_vector.y == height) angle = 180;
  return angle;
}


// RETURNS A POINT ON THE BORDER OF THE SKETCH
PVector getPointOnEdge(float in_width, float in_height) {
  float nullpoint = round( random(0, 1) );
  PVector vector1 = new PVector( nullpoint*in_width, round( random( 0.1*in_height, 0.9*in_height  ) ) );
  PVector vector2 = new PVector( round( random( 0.1*in_width, 0.9*in_width ) ), nullpoint*in_height );

  int decider = round(random(0, 1));
  if (decider == 0) return vector1;
  else return vector2;
}


// RETURNS YOUR INPUT NUMBER EITHER POSITIVE OR NEGATIVE
float getRandomMinus(float in_number) {
  float out_number = in_number*(round(random(0, 1))*2-1);
  return out_number;
}

class Spawner {

  int childrenChance;
  float weight;
  float speed;
  float angle;
  int direction;
  float seed = random(0, 1000);
  int counter;
  float childCounter;
  int faktor;

  float checkDistance = 12.5;
  int checkSize = 20;
  float angleVar = 1;

  float deltaX;
  float deltaY;
  PVector[] coordinates = new PVector[10000];
  boolean obstacle = false;


  // CONSTRUCTOR
  Spawner(PVector in_vector, float in_angle, float in_speed, float in_weight, int in_childrenChance) {

    // GET PARAMETERS
    speed = in_speed*random(1-speedVar, 1+speedVar);
    angle = in_angle+random(-angleVar, angleVar);
    weight = in_weight*0.5;
    coordinates[0] = in_vector;
    childrenChance = in_childrenChance+1;
    faktor = int(getRandomMinus(1));
    childCounter=childDelay*random(-0.5, 0.5);
  }


  // CHECK IF THE SPACE IN FRONT OF THE CRYSTAL IS FREE (WHITE)
  void checkObstacles() {
    speed = speed;  // + 0.1*(noise(counter*.01,seed)-.5);
    angle = angle + noiseStrength*(noise(counter*.01+seed)-.5) + faktor*noiseAngle;
    deltaX = sin(radians(angle))*speed;
    deltaY = cos(radians(angle))*speed;  

    float checkX = coordinates[counter].x + deltaX * checkDistance - checkSize/2;
    float checkY = coordinates[counter].y + deltaY * checkDistance - checkSize/2;

    if (debugMode == true) strokeWeight(1);
    if (checkX < 0-checkSize/2 || checkX > width-checkSize/2 || checkY < 0-checkSize/2 || checkY > height-checkSize/2) {
      obstacle = true;
      stroke(255, 0, 0);
    } 
    else if (getAverageColor(get(int(checkX), int(checkY), checkSize, checkSize)) != color(255)) {
      obstacle = true;
      stroke(0, 0, 255);
    } 
    else {
      obstacle = false;
      stroke(0, 0, 0);
    }
    if (debugMode == true) rect(checkX+1, checkY+1, checkSize+2, checkSize+2);
  }


  void moveLine() {    
    childCounter++;
    if (childCounter > childDelay*childrenChance && childrenChance < maxGeneration+1) {
      makeChild(int(angle));
      objectCounter++;
      childCounter-=childCounter*random(0.75, 1.25);
    }

    counter++;
    coordinates[counter] = new PVector();
    coordinates[counter].x = coordinates[counter-1].x + deltaX;
    coordinates[counter].y = coordinates[counter-1].y + deltaY;
  }


  void drawLine() {
    for (int i=counter; i>0; i--) {
      stroke(0); // use i here?
      noFill();
      strokeWeight(weight*log(counter-i+1));
      if (counter !=0) line(coordinates[i].x, coordinates[i].y, coordinates[i-1].x, coordinates[i-1].y);
    }
  }


  // SPAWN A NEW CRYSTAL IN A 90 DEGREES ANGLE
  void makeChild(int in_angle) {
    float out_angle = in_angle;
    out_angle += getRandomMinus(90);
    PVector out_vector = coordinates[counter];
    myCrystalArray[objectCounter] = new Spawner(out_vector, out_angle, speed, weight, childrenChance);
  }


  // GET AVERAGE COLOR OF DEFINED AREA
  color getAverageColor(PImage img) {
    img.loadPixels();
    int r = 0, g = 0, b = 0;
    for (int i=0; i<img.pixels.length; i++) {
      color c = img.pixels[i];
      r += c>>16&0xFF;
      g += c>>8&0xFF;
      b += c&0xFF;
    }
    r /= img.pixels.length;
    g /= img.pixels.length;
    b /= img.pixels.length;
    return color(r, g, b);
  }
}



