
//Gina DeMatteo
//Homework Lab 3
//September 10, 2011
//Composition Created using codes given/taught in lab

void setup() {
  size(450, 300);
  smooth();
  colorMode(HSB, width);
}


float count = 0;//Establishes starting point for the counter(Start=0) 
float num = 15;//Number of rectangles that create grayscale background
float rndRadius;

int circleRadius = 0;
int circleSpeed = 1;//Establishes the speed at which the circles will expand and shrink
int numOfTries = 40; //Number of randomized circles that are drawn within set parameters



void draw() {

  //Gradient Count (Rect.) Properties
  if (count < num) { 
    noStroke();
    fill((count/num) * width);
    rect(count * width/num, 0, width/num, height);
  }
  count++;

  //Expanding/Shrinking circle's Properties
  if (circleRadius > 250) { //R sets the parameters in which the circle can expand and shrink/Limits the circle from expanding further
    circleSpeed = -1; //Speed of Circle's expanding/shrinking
  }
  if (circleRadius < 0) {
    circleSpeed = 1;
  }

  //Circle One's Properties
  stroke(0);
  fill(255);
  ellipse(400, 50, circleRadius, circleRadius);
  circleRadius = circleRadius + circleSpeed;

  //Circle Two's Properties
  stroke(0);
  fill(235, 101, 245);
  ellipse(400, 250, circleRadius, circleRadius);
  circleRadius = circleRadius + circleSpeed;


  //Randomized Circle's Properties
  rndRadius = random(100); 

  if (numOfTries > 0) {
    stroke(235, 101, 245);
    noFill();
    ellipse(random(100), random(height), rndRadius, rndRadius);
  }
  numOfTries--;
}


