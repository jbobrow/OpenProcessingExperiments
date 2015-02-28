
/*Ashleigh Rissmeyer
 A program that models a game of Quidditch. 
 Black bludgers appear randomly on screen.
 The red quaffle follows the mouse.
 Every time a goal is scored (the red quaffle goes 
 through the hoop), press the UP button. This will
 print the new score for the team.
 */

//set up a global constant to record the number
//of points scored for one goal
final int GOAL_IS_SCORED = 10;

//set up global variables
boolean ballOnLeftSide=true;
int backgroundColor=190;
int hoopColor1=0;
int hoopColor2=0;
int score=0;

void setup() {
  size(500, 500);
  background (backgroundColor);
}

void draw() {
  background(backgroundColor);

  drawQuidditchPitch();
  drawQuaffle();
  flyingBludgers();
  changeOffenseLeft();
  changeOffenseRight();
  testBooleans();
}

//Set up the basic structure of the Quidditch pitch,
//including the field and the hoops (one on each end)
void drawQuidditchPitch () {
  //set up the pitch itself
  fill(112, 219, 147);
  strokeWeight(1);
  ellipse(250, 250, 450, 250);
  ellipse(250, 250, 100, 100);
  line(250, 125, 250, 375);


  //set up the goal posts
  strokeWeight(4);
  line(425, 275, 425, 125);
  line(75, 275, 75, 125);

  //set up the hoops
  fill(backgroundColor, 0);
  stroke(hoopColor1);
  ellipse(75, 75, 100, 100);
  stroke(hoopColor2);
  ellipse(425, 75, 100, 100);
}

//draw a black ball (called a bludger) 
//that moves around the screen at random
//modeling the behavior of a bludger from the books
void flyingBludgers() {
  float xCoordinate=random(0, 475);
  float yCoordinate=random(0, 475);
  frameRate(10);
  fill(0);
  stroke(0);
  ellipse(xCoordinate, yCoordinate, 25, 25);
}

//draw a red ball (called a quaffle) that follows
//the mouse across the screen and "scores" by
//going through the hoop
void drawQuaffle () {
  stroke(0);
  fill(255, 0, 0);
  strokeWeight(1);
  ellipse(mouseX, mouseY, 30, 30);
}


//create a method that will add ten points to
//the score every time the "UP" arrow is pressed
void keyPressed() {
  if (keyCode == UP) {
    println(calculateScore());
  }
  else {
  }
}

int calculateScore () {
  score=score+GOAL_IS_SCORED; 
  return score;
}

void changeOffenseLeft () {
  if (mouseX>(width/2)) {
    hoopColor1=0;
  } 
  else {
    hoopColor1=255;
  }
}

void changeOffenseRight () {
  if (mouseX<(width/2)) {
    hoopColor2=0;
  } 
  else {
    hoopColor2=255;
  }
}

void testBooleans () {
  if (mouseX<(width/2)) {
    ballOnLeftSide=true;
  }
  else {
    ballOnLeftSide=!ballOnLeftSide;
  }
}
