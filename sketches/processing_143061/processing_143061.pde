
/*
+ Project 2 - IAT 800
 + Created by: Jillian Warren
 + Email: jlw29@sfu.ca
 + Date: October 12, 2012
 
 + Project 2 Selection: 
 (A) Create a computer game in Processing: The design of the game is entirely up to you, so be creative. 
 It might be useful to look at kids games (Connect‐4, Tic‐Tac‐Toe, Rock‐Paper‐Scissors, etc.) as well as early video games (Asteroids, 
 Space Invaders, Frogger, etc.) for inspiration, as they are not overly complicated, yet fun to play. 
 
 There are a few rules:
 • Your program must be object‐oriented, defining and using at least three
 classes.
 • You must show your skills by implementing each of the following concepts at
 least once:
 • Inheritance
 • Abstraction
 • Overloading
 
 As usual, you should make your code easy to read and understand by using comments, variable names and formatting. We also ask you
 to produce the UML diagram of your project. Upload your solution and its UML diagram (as a PDF file) to your Drop Box on the IAT 
 800 Sakai site.
 
 + About: Monster (Player) is directed by mouseX and mouseY and is on a mission to eat Orb(s) from space. 
 
 + Inpirations:
 • The monster image I edited is from: http://spendmoneyonline.net/wp-content/uploads/2012/01/domo-face-micro-rashel-fleece-blanket.jpg
 • Functionalities from:
 • http://www.learningprocessing.com/examples/chapter-10/example-10-10/
 • Processing > File > Examples > Motion > Reflection2
 */






/* GLOBAL VARIABLES */
//associated with Ground
int segments = 50;
float segs = (float) segments;
Ground[] ground = new Ground [segments]; //create array of Ground objects "ground" that holds # (50) of units equal to "segments" specified
float[] peakHeights = new float [segments+1]; // create array of floats "peakHeights" that holds # (50) of units "segments" + 1 (51)


//associated with Player
Player player; //one Player object

//associated with Timer
Timer orbTimer; //one Timer object for orb release

//associated with enemy Orb
Orb [] orbs; //an array for Sprites objects, will hold Orbs
int totalOrbs = 0; //total Orbs

//associated with score keeping
public float missed = 0;
float eaten = 0; 

//associated with difficulty level, determines how long orbs stay on canvas - allowed to hit ground more times the easier the game setting
float easy = 15; //currently set on easy, but can be changed to increase difficulty
float intermediate = 8;
float hard = 5;
float level = easy;
String levelString;
float numberToEat = 100;

//associated with game over
boolean gameOver = false;
float maxAllowedMissed = 15; //if missed is greater than or equal to this number the game is over

//associated with display
PFont myFont;





/* SETUP */
void setup () {
  size(1000, 400);
  smooth();

  player = new Player (); //create the player
  orbs = new Orb [1000]; //create 1000 placeholders in the array
  orbTimer = new Timer (150); //crete a timer that goes off every 2 seconds
  orbTimer.start (); //starting the timer
  myFont = createFont("Arial", 12, true); // A font to write text on the screen


  /* Associated with Ground */
  calculatePeakHeights (); // Calculate ground peak heights 
  createGroundSegments (); // Float value required for segment width (segs) calculations so the ground spans the entire display window, regardless of segment number.
}//end setup





/* DRAW - run game */
void draw () {
  background (0); //refresh background

  // If the game is over, create and display gameOver screen
  if (gameOver == true) {
    level = easy; //reset level to easy
    gameIsOver ();
  } //end if (game over)

  //otherwise run game
  else {
    noCursor(); //remove cursor to see monster's face


    //update player location based on mouse position, redraw at that position
    player.update (mouseX, mouseY); //update player location
    player.display(); //display player

    levelUp (); // check for level up


      // Check the timer, allows for distributed time "release" of new orbs, reset timer
    if (orbTimer.isFinished()) {
      orbRelease ();
    }//end if


    // Move and display all orbs
    moveAndDisplayOrbs ();

    //check if the game is over
    checkIfGameOver ();

    //draw ground
    drawGround ();

    //draw directions
    showDirections ();

    //show skills on screen
    showSkills ();
  }//end else (not game over)
}//end draw






/* METHODS */

//used to react to player keyboard input
void keyPressed () {
  //press e to exit
  if (key == 'e' || key == 'E') {
    wantsToExit();
  }//end if

  //press p to pause
  if (key == 'p' || key == 'P') {
    wantsToPause ();
  }//end if

  //press r to resume game
  if (key == 'r' || key == 'R') {
    wantsToResume ();
  }//end if
}//end keyPressed


//what to do when player wants to exit
void wantsToExit () {
  exit ();
}//end wantsToExit



//what to do when player wants to pause
void wantsToPause () {
  fill (255, 0, 0);
  printScreen ("Paused", width/2, height/2, 48); 
  noLoop ();
}//end wantsToPause



//what to do when player wants to resume game
void wantsToResume () {
  loop ();
}//end wantsToResume


//how to level up
void levelUp () {
  //if an orb has hit the ground more than the # of times determined by the "level" you're playing at (easy, intermediate, hard) 
  //then you didn't get to it fast enough, you're missed tally goes up and that orb is removed
  if (eaten < numberToEat) {
    level = easy;
    levelString = "Easy";
  }//end if
  else if (eaten >= numberToEat && eaten < numberToEat*2) {
    level = intermediate;
    levelString = "Intermediate";
  }//end else if
  else if (eaten >= numberToEat*3) {
    level = hard;
    levelString = "Hard";
  }//end else if
}



//calculate "heights" of ground segments
void calculatePeakHeights () {
  for (int i=0; i < peakHeights.length; i++) {
    peakHeights[i] = random(height - 60, height - 30);
  }//end for
}//end calculatePeakHeights



//create new ground "segment" objects
void createGroundSegments () {
  for (int i=0; i < segments; i++) {
    ground[i]  = new Ground (width/segs*i, peakHeights[i], width/segs*(i+1), peakHeights[i+1]);
  }//end for
}//end createGroundSegments



//what to do if the game is over
void gameIsOver () {
  fill (255);
  printScreen ("Game Over", width/2, height/2, 48);
  printScreen ("Oh No! The Orbs Destroyed Your Planet!!", width/2, height/3, 36);
}



//decide whether game is over
void checkIfGameOver () {
  if (missed >= maxAllowedMissed) {
    gameOver = true;
  }//end if
}//end checkIfGameOver



//for printing text on screen 
void printScreen (String textToPrint, int horPos, int vertPos, int fontSize) {
  textFont(myFont, fontSize);
  textAlign(CENTER);
  text(textToPrint, horPos, vertPos);
}//end gameIsOver



//create new orb objects and
void orbRelease () {
  // Initialize one orb
  orbs [totalOrbs] = new Orb();

  // Increment totalOrbs
  totalOrbs ++ ;

  // If we hit the end of the array, make orb creation "continuous" as long as game over hasn't been reached
  if (totalOrbs >= orbs.length) {
    totalOrbs = 0; // Start over
  }//end nested if

  orbTimer.start(); //start timer
}//end orbRelease



//used to move/dipslay orbs, as well as check for collisions (where some can cause removal of orb or game over)
void moveAndDisplayOrbs () {
  for (int i = 0; i < totalOrbs; i++ ) {
    orbs[i].update(); //update location, speed
    orbs[i].display(); //draw based on updates
    orbs[i].checkWallCollision(); //keep within sides of screen

      //assess whether the orb has hit the ground
    for (int j=0; j < segments; j++) {
      orbs[i].checkGroundCollision(ground[j]);
    }//end nested for 'j'


    //see if monster eats orbs
    if (player.intersect(orbs[i]) == true) {
      orbs[i].caught(); //remove caught orb
      eaten ++;//increase eaten count
    }//end nested if


    if (orbs[i].getHitGround() > level && orbs[i].alive == true) {
      orbs[i].alive = false;
      orbs[i].groundedTooLong(); //remove orb 
      missed ++; //increase missed count
    }//end nested if
  }//end for 'i'
}//end moveAndDisplayOrbs 



//draw the ground
void drawGround () {
  fill(127); //color grey
  beginShape();
  for (int i=0; i< segments; i++) {
    vertex(ground[i].getX1(), ground[i].getY1());
    vertex(ground[i].getX2(), ground[i].getY2());
  }//end for
  vertex(ground[segments-1].getX2(), height);
  vertex(ground[0].getX1(), height);
  endShape(CLOSE);
}//end drawGround


//draw directions for player
void showDirections () {
  fill(0);
  textFont (myFont, 12);
  textAlign (CENTER);
  text ("Press 'e' to exit game.  Press 'p' to pause game.  Press 'r' to resume game.", width/2, height - 10);
}//end showDirections


//draw and update orbs eaten and orbs missed 
void showSkills () {
  //show skills on screen
  textFont(myFont, 12);
  textAlign(LEFT);
  fill(255);
  text("You've eaten " + eaten + " space orbs!!!", 30, 30);
  text("You've missed " + missed + " space orbs!!!", 30, 50);
  text ("Your're playing on: " + levelString, 30, 70);
}//end showSkills

//used to create ground objects

class Ground {
  private float x1, y1, x2, y2;  
  private float medianX, medianY, len, rot;


  /* Constructor*/
  Ground(float xPos1, float yPos1, float xPos2, float yPos2) {
    x1 = xPos1;
    y1 = yPos1;
    x2 = xPos2;
    y2 = yPos2;
    medianX = (xPos1+xPos2)/2;
    medianY = (yPos1+yPos2)/2;
    len = dist(xPos1, yPos1, xPos2, yPos2);
    rot = atan2((yPos2-yPos1), (xPos2-xPos1));
  }//end constructor
  
  
  /* Methods */
  float getX1 () {
    return x1;
  }
  
  float getY1() {
    return y1;
  }
  
  float getX2() {
    return x2;
  }
  
  float getY2() {
    return y2;
  }
  
  float getMedianX() {
    return medianX;
  }
  
  float getMedianY() {
    return medianY;
  }
  
  float getLen () {
    return len;
  }
  
  float getRot() {
    return rot;
  }
  

}//end Ground class

//Orb is subclass of Sprites, it must inherit/overlaod abstract methods from superclass, used for orbs eaten by Player (monster)


class Orb extends Sprites {


  /* Variables */
  private float orbX, orbY, orbRadius;
  private PVector velocity = new PVector(random (-2, 2), random (0, 6));
  private float gravity = random (.02, .15);
  private float damping = random (0.4, 0.8);
  private float hitGround;
  Boolean alive;



  /* Constructor */
  Orb() {
    orbX = random (0, width);
    orbRadius = random (3, 10);
    orbY = -orbRadius;
    alive = true;
  }//end constructor



  /* Methods */
  //update orb movement and placement
  void update () {
    orbX += velocity.x;
    velocity.y += gravity;
    orbY += velocity.y;
  }//end updatea



  //overload Sprites display()
  void display () {
    // Draw orb
    noStroke();
    if (level - hitGround >= 5) {
      fill((int) random (0, 255), 255, (int) random (0, 255));
    }
    else {
      fill (random (100,255), 0, 0);
    }
    ellipse(orbX, orbY, orbRadius*2, orbRadius*2);
  }//end display



  //overload Sprites getX()
  float getX() {
    return orbX;
  }//end getX



    //overload Sprites getY()
  float getY() {
    return orbY;
  }//end getY



    //return orb's radius
  float getOrbRadius() {
    return orbRadius;
  }//end getOrbRadius



    //return hitGround count
  float getHitGround () {
    return hitGround;
  }//end getHitGround



    //what to do if player catches orb
  void caught () {
    //stop movements
    velocity.x = 0;
    velocity.y = 0;
    gravity = 0;
    damping = 0;

    //move offscreen
    orbY = -height;
    orbX = -width;
  }//end caught


  //what to do if player doesn't catch orb in time
  void groundedTooLong () {
    this.caught();
  }//end groundedTooLong



  //keep orbs within "sides" of the canvas
  void checkWallCollision() {
    if (orbX > width - orbRadius) {
      orbX = width - orbRadius;
      velocity.x *= -1;
      velocity.x *= damping;
    } //end if
    else if (orbX < orbRadius) {
      orbX = orbRadius;
      velocity.x *= -1;
      velocity.x *= damping;
    }//end else if
  }//end checkWallCollision



  //check whether orb has hit the ground to assess movement
  void checkGroundCollision(Ground groundSegment) {

    // Get difference between orb and ground
    float deltaX = orbX - groundSegment.getMedianX ();
    float deltaY = orbY - groundSegment.getMedianY ();


    // Precalculate trig values
    float cosine = cos(groundSegment.getRot ());
    float sine = sin(groundSegment.getRot ());


    // Rotate ground and velocity to allow orthogonal collision calculations 
    float groundXTemp = cosine * deltaX + sine * deltaY;
    float groundYTemp = cosine * deltaY - sine * deltaX;
    float velocityXTemp = cosine * velocity.x + sine * velocity.y;
    float velocityYTemp = cosine * velocity.y - sine * velocity.x;


    // Ground collision - check for surface collision and also that orb is within 
    // left/rights bounds of ground segment 
    if (groundYTemp > -orbRadius && orbX > groundSegment.getX1() && orbX < groundSegment.getX2 () ) {
      // keep orb from going into ground
      groundYTemp = -orbRadius;

      // bounce and slow down orb
      velocityYTemp *= -1.0;
      velocityYTemp *= damping;

      //keep track of how many times the orb has hit the ground
      hitGround ++;
    }//end if


    // Reset ground, velocity and orb
    deltaX = cosine * groundXTemp - sine * groundYTemp;
    deltaY = cosine * groundYTemp + sine * groundXTemp;
    velocity.x = cosine * velocityXTemp - sine * velocityYTemp;
    velocity.y = cosine * velocityYTemp + sine * velocityXTemp;
    orbX = groundSegment.getMedianX () + deltaX;
    orbY = groundSegment.getMedianY () + deltaY;
  }//end checkGroundCollision
}//end class

//Player is subclass of Sprites and must inherit/overload abstract methods of the superclass. Class is for the player (monster) that eats orbs, position based on mouse movements

class Player extends Sprites {
  
  
  /* Variables */
  private PImage mouthOpen = loadImage ("mouthOpen.png");
  private float playerPosX;
  private float playerPosY;
  
  

  /* constructor */
  Player () {
    playerPosX = 0;
    playerPosY = 0;
    //eating = false;
  }//end constructor



  /* Methods */
  //overload display method from Sprites
  void display () {
    imageMode (CENTER);

    //dreaw png at playerPosX (0 then mouseX) and playerPosY (0 then mouseY)
    image (mouthOpen, playerPosX, playerPosY);
  }//end display



  //overload getX method from Sprites
  float getX() {
    return playerPosX;
  }//end getX



  //overlaod getY method from Sprites
  float getY() {
    return playerPosY;
  }//end getY



  //overlaod update method from Sprites
  void update (float currentX, float currentY) {
    playerPosX = currentX;
    playerPosY = currentY;
  }//end update



  // A function that returns true or false based on whether the player eats an orb
  boolean intersect (Orb o) {
    // Calculate distance center point of player and that of orb
    float distance = dist(playerPosX, playerPosY, o.getX(), o.getY()); 

    // Compare distance to sum of radii
    if (distance < mouthOpen.width/2 + o.getOrbRadius() || distance < mouthOpen.height + o.getOrbRadius()) { 
      return true;
    } //end if
    else {
      return false;
    }//end else
    
  }//end intersect
  
  
}//end Player class

//Abstract class Sprites is super class for player and orb, it's abstract methods must be inherited/overloaded by any subclasses

abstract class Sprites {


  // Every subclass is required to implement these methods on their own.

  abstract void display (); // will be used to update displayed representation of sprites
    
  abstract float getX (); // will be used to retrieve x pos of sprites
  
  abstract float getY (); // will be used to retrieve y pos of sprites
}//end class

/*
Timer class, associated with orb release and creation
*/



class Timer {
 
  /* Variables */
  private int savedTime; // When Timer started
  private int totalTime; // How long Timer should last
  
  
  
  /* Constructor */
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }//end constructor
  
  
  /* Methods */
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }//end start
  
  
  // The function isFinished() returns true if "totalTime" has passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed (total passed time - time since last timer start)
    int passedTime = millis() - savedTime; 
    
    if (passedTime > totalTime) {
      return true;
    } //end if
    else {
      return false;
    }//end else
  }//end isFinished
  
}//end Timer


