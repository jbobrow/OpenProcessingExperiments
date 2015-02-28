
PImage factory;

int startTime;
int intervalTime;
int currentTime;

int xVelocity;
int yVelocity;

int robotNumber; // keeping track of what robot we're drawing

int[] xPositions = new int[5]; // holds xes of robots
int[] yPositions = new int[5]; // holds ys of robots
boolean[] isShowing = new boolean[5]; // whether or not a given robot is showing

void setup() {
  size(1020, 700);
  factory = loadImage("factoryscene.jpg");
  imageMode(CENTER);

  startTime = millis();
  intervalTime = 3000;

  for (int i = 0; i < xPositions.length; i++) {
    xPositions[i] = 146; // setting ALL the xes to 146
    yPositions[i] = 154; // setting ALL the ys to 154
    isShowing[i] = false; // false
  }

  robotNumber = 0; // showing robot number zero (as weird as that sounds)
}

void draw() {
  image(factory, width/2, height/2);

  for (int i = 0; i < xPositions.length; i++) { // length of array is five 
    if (isShowing[i] == true) { // if that robot is showing
      createRobot(xPositions[i], yPositions[i]); // drawing our robot at its specific positions
      if (yPositions[i] <= 255) {
        yPositions[i] += yVelocity;
      }
      else {
        xPositions[i] += xVelocity;
      }

      if (xPositions[i] > 1020) { // if this specific robot is offscreen
        xPositions[i] = 146; // reset him to beginning
        yPositions[i] = 154; // reset him to beginning
      }
    }
  }

  currentTime=millis();
  
  if (currentTime - startTime >= intervalTime) {
    isShowing[robotNumber] = true; // show that robot
    robotNumber++; // increment which robot we're on
    if (robotNumber == 5) { // start counter over
      robotNumber = 0; // start counter over
    }
    startTime=currentTime;
  }
  //frameRate(3);
  //OnClick, want a puff to appear by the mouth of the machine
  //Then, will run function of createRobot
  //then, robot will go across screen from left to right on the conveyor belt
  //for (int i = 0; i< 10; i++) {
  //createRobot();

  //every certain amount of seconds, the xVelocity will have one added to it so that the robot moves to the right   
  xVelocity = 1;
  yVelocity = 1;

  //now how do I get the robot that just came up to move down to belt then across screen on conveyor belt?
  //createRobot();
  /* if(y <= 255){
   y += yVelocity;
   }else{
   x += xVelocity;
   } */
}

void createRobot(int x, int y) {
  println("hello!");
  fill(random(0, 255), random(0, 255), random(0, 255));
  //change rectangle mode so that the x, y coordinate is for the CENTER, not the corner
  //maybe easier if I just draw two rectangles with shapes on top but keep the x and y constant so that they will all move together
  rect(x, y, 100, 62);
  rect(x - 20, y + 72, 143, 97);
  //eyes
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(x + 16, y +10, 25, 12);
  rect(x + 64, y + 11, 25, 10);
  //mouth
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(x + 50, y +44, 29, 10);
  //tummy
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(x + 11, y + 88, 79, 51);
  //heart
  fill(random(0, 255), random(0, 255), random(0, 255));
  bezier(x + 73, y + 100, x + 63, y + 97, x + 73, y + 112, x + 82, y + 100);
}






// beginShape();
//vertices will go clockwise starting with top of head
//need 25 vertex
//Can I do this with a for loop somehow? Not sure...
/*vertex(x, y);
 vertex(x + 30, y);
 vertex(x + 30, y + 15);
 vertex(x + 50, y + 15);
 vertex(x + 50, y + 65);
 vertex(x - 20, y + 65);
 vertex(x7, y7);
 vertex(x8, y8);
 vertex(x9, y9);
 vertex(x10, y10);
 vertex(x11, y11);
 vertex(x12, y12);
 vertex(x13, y13);
 vertex(x14, y14);
 vertex(x15, y15);
 vertex(x16, y16);
 vertex(x17, y17);
 vertex(x18, y18);
 vertex(x19, y19);
 vertex(x20, y20);
 vertex(x21, y21);
 vertex(x22, y22);
 vertex(x23, y23);
 vertex(x24, y24);
 vertex(x25, y25);
 endShape();
 */

