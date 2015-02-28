
/**
 * Motion 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 09/02/12
 */

//create initial global variables
int     radius;
float  frequency, position, positionAdder;
float   posOne, posTwo;

float [] redBall = new float [200];
float [] greenBall = new float [200];

void setup() {
  size(800, 800);
  background(0);
  smooth();

  radius        = 300;
  frequency     = 200;
  position      = 0;
  positionAdder = ( (float)frequency / 44100) * TWO_PI;
  
}

void draw() {

  noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  //translate(width/2, height/2);
  position += positionAdder;
  
  // Red Circle
  fill(255, 0, 0);
  posOne = oscillationPositive(position)+mouseY;
  for (int i=0; i < redBall.length; i++){
  ellipse(6*i, redBall[i], 20, 20);
  }

  // Green
  fill(0, 255, 0);
  posTwo = oscillationNegative(position)+mouseY;
  for (int i=0; i < greenBall.length; i++){
  ellipse(6*i, greenBall[i], 20, 20);
  }

  for (int i=0; i < 199; i++){
    redBall[i] = redBall[i+1];
    greenBall[i] = greenBall[i+1];
  }
  
  redBall[199]=posOne;
  greenBall[199]=posTwo;

  println(redBall);
}

//Instead of creating a function that is void (ie returns nothing)
//Here are two functions that return a float value

float oscillationPositive(float position) {
  
  float pos = sin(position);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

  float oscillationNegative(float position) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * radius;
  
  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}


