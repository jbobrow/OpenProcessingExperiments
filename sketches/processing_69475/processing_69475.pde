
/**
 * Motion 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 09/02/12
 */

//create initial global variables
int     radius;
float	frequency, position, positionAdder;
float   posOne, posTwo;
float x;
float y;
float step;
boolean movingUp;
boolean movingDown;
boolean paused;
int[] starX;
int[] starY;
float[] redX;
float[] redY;
float[] greenX;
float[] greenY;
int[] starR;


void setup() {
  size(800, 800);
  background(0);
  smooth();
  paused = false;
  starX = new int[10];
  starY = new int[10];
  redX = new float[1000];
  redY = new float[1000];  
  greenX = new float[1000];
  greenY = new float[1000];
  starR = new int[10];
  noStroke();
  fill(255);
  for (int i=0;i<10;i++) {
    starX[i] = (int)random(width);
    starY[i] = (int)random(height);
    starR[i] = (int)random(10);
  }
  y = 0;
  x=0;
  step = 5;
  //Sets the magnitude
  radius        = 120;

  //Sets rate of motion
  frequency     = 420;

  //Provides initial position value
  position      = 0;

  //**This is important**
  //This specifies the increment taken for each draw cycle
  //A way to think of this is that we are taking a circle, which is two pi in radians
  //And breaking it up into 44,100 pieces (see http://en.wikipedia.org/wiki/44,100_Hz)
  //Our frequency is then saying how many steps to take around the circle each cycle
  //And positionAdder is that incremental value in radians
  positionAdder = ( (float)frequency / 44100) * TWO_PI;
}

void draw() {
  if (!paused) {
    x++;
    fill(0, 0, 0, 20);
    rect(0, 0, width, height);
    noStroke();
    fill(100);
    for (int i=0;i<10;i++) {
      if (starX[i]<=width) {
        starX[i] += 5;
      } 
      else {
        starX[i] = 0-(int)random(width);
        starY[i] = (int)random(height);
      }
      ellipse(starX[i], starY[i], starR[i], starR[i]);
    }    
    //This simulates a "tail" on the end of the moving object
    //by using the alpha channel of a rect instead of a backgroud
    //Change the alpha value of fill to see what happens


    if (movingUp == true) {
      y -= step;
    } 
    else if (movingDown == true) {
      y += step;
    }

    translate((width/2)+100, (height/2)+y);

    // Move the origin to the center of screen
    strokeWeight(3);
    //Increment the position of the object
    position += positionAdder;
    posOne = oscillationPositive(position);
    posTwo = oscillationNegative(position);


    // Red Circle
    fill(255, 0, 0);
    stroke(255, 0, 0);
    ellipse(0, posOne, 20, 20);
    noFill();
    bezier(0, posOne, -160, posOne, -160, posOne, -200, 0);
    // Green
    fill(0, 255, 0);
    stroke(0, 255, 0);
    ellipse(0, posTwo, 20, 20);
    noFill();
    bezier(0, posTwo, -160, posTwo, -160, posTwo, -200, 0);
    //rotating all objects 90 degrees (or PI/2.0) that follow this function
    //for info on translate, rotation, etc. check this out: http://processing.org/learning/transform2d/
    noFill();
    stroke(0, 0, 255);
    strokeWeight(2);
    for (int i = 0; i < 12; i++) {
      int deg = 360/12*i;
      float angle = radians(deg);
      ellipse((cos(angle) * 10)-200, sin(angle) * 10, 20, 20);
    }
    noStroke();
  }
}

//Instead of creating a function that is void (ie returns nothing)
//Here are two functions that return a float value

float oscillationPositive(float position) {

  float pos = sin(position);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { 
    position -= TWO_PI;
  }

  //this tells the function what value to return
  return pos;
}

float oscillationNegative(float position) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { 
    position -= TWO_PI;
  }

  //this tells the function what value to return
  return pos;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      movingUp = true;
    } 
    else if (keyCode == DOWN) {
      movingDown = true;
    }
  }
  if (key == 'p') {
    if (paused) {
      paused = false;
    } 
    else {
      paused = true;
    }
  }
}

void keyReleased() {
  movingUp = false;
  movingDown = false;
}


