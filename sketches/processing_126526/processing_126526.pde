
/* 
 * "Coin Collecter" Game
 *  IAT Project 2 Fall 2013
 *
 * Collect coins with your pot.  There are four different types of coins:
 * Bronze (10), Silver(50), Gold(100) and FOOL(-100).  
 * Good Luck!
 *
 * Shannon Cuykendall
 * Created October, 2013
 *
 */

// Declare game objects
Rainbow myRainbow;
Pot myPot;
GameTimer myGameTimer;
ScoreBox myScoreBox;
GameInstructions myGameInstructions;
ArrayList<Coin> myCoins; 

//declare global variables
int time; //timer for creating coins
int wait;//how long to wait before creating new coins
int score;//the player's score (added coin values)

//call setup procedure
void setup() {

  //set sketch window size
  size(960,600);

  //set background to sky blue
  background(23, 211, 207); 

  //set framerate
  frameRate(30); 

  //call smooth function
  smooth(); 

  //hide cursor
  noCursor();

  //initialize gloabl variables
  time = millis();
  wait = 1000;

  //create new objects
  myRainbow = new Rainbow();
  myPot = new Pot (65, 600);
  myGameTimer = new GameTimer();
  myScoreBox = new ScoreBox();
  myGameInstructions = new GameInstructions();

  //all coins will be added to the array list as they are created
  //this allows me to update all the coins at once
  myCoins = new ArrayList<Coin>();//polymorphism!!!!
}

//call draw procedure
void draw() {

  //call procedures that generate coins and updates all objects
  coinGenerator();
  updateAll();
}

//create a Collect Coin procedure with a parameter "theCoin"
void collectCoin(Coin theCoin) {

  //define local variables
  float coinX= theCoin.getXPosition(); //the x position of the coin is the current xPosition of a coin(Bronze, Fool, Gold, Silver)
  float coinY = theCoin.getYPosition(); //the y position of the coin is the current yPositionf a coin(Bronze, Fool, Gold, Silver)
  float coinDiameter = theCoin.getDiameter(); //the diameter is the diameter of the coin (Bronze, Fool, Gold, Silver)

  //set boundary for coin collection

  //if the right region of the coin is not past the upper right edge of the pot 
  if (coinX + coinDiameter/3 < mouseX + myPot.getArcWidth()/2 &&

    //and if the left region of the coin is not past the upper left edge of the pot 
  coinX - coinDiameter/3 > mouseX - myPot.getArcWidth()/2&&

    //and the bottom edge of the coin is higher than the bottom of the upper rectangle on top of pot
  //add diameter of coin do that coins disappear once they are fully "inside" the pot 
  coinY - coinDiameter/2 < height-myPot.getArcHeight()/2 + myPot.getArcHeight()/16 + coinDiameter &&

    //and the bottom edge of the coin is lower than the top of the upper rectangle on top of pot  
  //add diameter of coin do that coins disappear once they are fully "inside" the pot
  coinY - coinDiameter/2 > height-myPot.getArcHeight()/2 - myPot.getArcHeight()/16 + coinDiameter ) {

    //remove coin from array list so that it will not be updated and will disappear when collected
    myCoins.remove(theCoin);
    if (myGameTimer.timeRemaining() > 0) {

      //add coin value to the player's score
      score += theCoin.getValue();
    }
  }
}

//create procedure to generate coins 
void coinGenerator() {

  //code inspired by http://stackoverflow.com/questions/12417937/create-a-simple-countdown-in-processing
  //if time is remaining in game then add coins
  if (myGameTimer.timeRemaining() > 0) {

    //and if the elapsed time is greater than how long program waits to generate coins
    if (millis() - time >= wait) {
      myCoins.add(new GoldCoin());
      myCoins.add(new FoolCoin());
      myCoins.add(new BronzeCoin());
      myCoins.add(new SilverCoin());
      time = millis();//set time back to millis to reset timer
    }
  } 

  //if there is no time remaining in the game, display game over
  else {
    myGameInstructions.gameOver();
  }
}

//create procedure to update all objects
void updateAll() {

  //set background to sky blue
  background(23, 211, 207);

  //update GameInstructions and Rainbow objects
  myGameInstructions.update();
  myRainbow.update();

  //run through all coins,  attempt to collect each coin and then update
  for (int numCoins = myCoins.size()-1; numCoins >= 0; numCoins--) { 
    Coin currentCoin= myCoins.get(numCoins);
    collectCoin(currentCoin);
    currentCoin.update();
  }

  //update Pot, GameTimer and ScoreBox objects
  myPot.update();
  myGameTimer.update();
  myScoreBox.update();
}
//create procedure to start game
void startGame() {

  //remove game instructions at start of game
  myGameInstructions.remove();
}

//create procedure to reset game 
void resetGame() {

  //reset timer and set score to zero
  myGameTimer.reset();
  score = 0;
}

//create procedure that will start and reset game
void mouseClicked() {
  resetGame();
  startGame();
}
//present in full screen mode automatically 
//boolean sketchFullScreen() {
  //return true;
//}

/* Class Bronze Coin, extends abstract Class Coin
 *
 * A bronze colored coin that is worth 10 points in game
 *
 * "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//Bronze Coin inherits the attributes of abstract Class Coin
class BronzeCoin extends Coin {
  BronzeCoin() {
   
    //call constructor of Abstract Class Coin 
    super(); 
    
    //set diameter of coin
    diameter = 70; 
    
    //set speed of coin
    speed = 5; 
    
    //set coin color to bronze;
    coinColor = color(106, 67, 4);
    
   //set value to 10 
    value = 10; 
    
    //set label on coin
    label = "10";
  }
}//END CLASS

/* Abstract Class Coin
 *
 * "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//create Abstract Class Coin
abstract class Coin { 
  
  //declare attributes
  float xPosition;//x Position of coin
  float yPosition;//Y Position of coin
  float diameter;//coin diameter
  float speed;//speed coin will move
  color coinColor; //the color of the coin
  float value;//the value of coin (that is added to the score)
  String label;//the label of the coin (what is written on coin)

//Create first constructor with no parameters, set default values for xPosition and yPosition
  Coin() { 
    this(random(0, width), 0); //call overloaded constructor
  }

 //Create second constructor with two parameters 
  Coin(float x, float y) {
    
    //x is assigned to xPosition and y is assigned to yPosition
    this.xPosition = x;
    this.yPosition = y;
  }
  
  //create function to return the value of the coin
  float getValue() { 
    return this.value;
  }
 
 //create function to return the xPosition of the coin
  float getXPosition() {
    return this.xPosition;
  }

  //create function to return the yPosition of the coin
  float getYPosition() {
    return this.yPosition;
  }
  
  //create function to return the diameter of the coin
  float getDiameter() {
    return this.diameter;
  }

 //create method to update coins
  void update() {
    
    //set thickness of outline for every coin
    strokeWeight(2);
    
    //fill coin with the coinColor
    fill(this.coinColor);
    
    //draw coin
    ellipse(this.xPosition, this.yPosition-this.diameter, this.diameter, this.diameter);
    
    //set text to black for label
    fill(0);
    
    //set size of text for label
    textSize(14);
    
    //center the label
    textAlign(CENTER);
    
    //set label to center of coin
    text(this.label, this.xPosition, this.yPosition-this.diameter);
    
    //remove coin when it reaches the bottom of the sketch window
    if(yPosition > height + diameter){
      myCoins.remove(this);
    }else{
      
    //if coin is not at the bottom of hte sketch window 
    //then add the speed to the y posiiton of the coin
    this.yPosition += speed;
    }
    
  }
}//END CLASS

/* Class Fool Coin, extends abstract Class Coin
 *
 * A gold coin that subracts 100 points
 *
 * "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//Fool Coin inherits the attributes of abstract Class Coin
class FoolCoin extends Coin {
  FoolCoin() {
    
    //call constructor of Abstract Class Coin
    super();
    
    //set diameter of coin
    diameter = 45;
    
    //set speed of coin
    speed = 11;
    
    //set color to gold
    coinColor = color(250, 157, 8);
    
    //set value of coin
    value = -100;
    
    //set label of coin
    label = "FOOL";
  }
}//END CLASS
/* Class Game Instructions 
 *
 * Sets the instructional text for the start and end of the game. 
 *
 * "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */
 
 
//create Class Game Instructions
class GameInstructions {
  
  //declare attributes of Game Instructions
  int xPositionHeading; // x position for title of game
  int yPositionHeading; //y position for title of game
  int xPositionText; //x posiiton for body of text
  int yPositionText; //y position for body of text
  String instructionText;//instructional words
  boolean hideText; //will be used to hide text once game starts

 //Create constructor
  GameInstructions() {
    
    //initialize attributes
    this.xPositionHeading = width/2;
    this.yPositionHeading = 0 + height/8;
    this.xPositionText= width/2;
    this.yPositionText = height/2;
    this.instructionText= "Use your pot to collect coins.Your pot moves with the position of the computer mouse and any coins that come in contact with your pot will be collected. Beware of the Fool Coin that subtracts $100 from your pot--it looks similar to the $100 coin.  Click the mouse to start. Good Luck!";
    this.hideText = false; //text will be shown
  }

 //create update method for class that will display text at the start of the game
  void update() {
    
    //if text is shown then display the following:
    if (!this.hideText) {
      
      //black text
      fill(0); 
      
      //centered text
      textAlign(CENTER); 
      
      //set text size
      textSize(48); 
      
      //Game title is positioned at the top of the sketch window in the center
      text("Coin Collector", this.xPositionHeading, this.yPositionHeading); 
      
      //change to smaller text size
      textSize(14); 
      
      //create sub-heading just below title with my name
      text("by Shannon Cuykendall", this.xPositionHeading, this.yPositionHeading + 20);
      
      //change to slightly larger text size
      textSize(18); 
      
      //position instructions in the center of the sketch window, below the heading
      text(this.instructionText, width/4, height/6, this.xPositionText, this.yPositionText); 
    }
  }
  
  
 //create method to remove text from the sketch window
  void remove() {
    this.hideText = true; 
  }
  
  //create method that will give instructions once game has played through once
  void gameOver(){
    
    //if the instructions are hidden display Game Over message.  This is called when the timer is 0.
    if(this.hideText){
      this.instructionText = "Game Over!  Want to try your luck again?  \nClick the mouse the restart!";
      this.hideText = false;
    }
  }
    
}//END CLASS

/* Class Game Timer 
 *
 * A 40 second timer, each round of game lasts 40 seconds
 *
 *  "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//create class GameTimer
class GameTimer {
  
  //declare attributes of GameTimer 
  int startTime;//when timer begins
  int elapsedTime;//how long it's been since "start time"
  int totalTime;//how long timer will run
  
  //Create constructor
  GameTimer() {
    
    //initialize attributes
    this.startTime = millis();//start time is in milliseconds
    this.totalTime= 40000;//total time will be 40 seconds
    this.elapsedTime = this.totalTime; //do that display will start at 0
    
  }
  //Create update method to display timer
  void update() {
    
    //if the elapsed time is less than the total time, update the elapsed time
    if (this.totalTime > this.elapsedTime) {
      
      //elapsed time is difference between current millis and start time
      this.elapsedTime = millis() - this.startTime;
    }
    
    //display seconds at the bottom center of screen
    fill(0);
    textSize(75);
    text(round(this.timeRemaining()/1000), width/2, height-100); //divide by 1000 to display seconds
  }
  
  //create function to return the time remaining
  float timeRemaining() {
    
    //remaining time is how long the timer should run minus how long it has run
    return this.totalTime - this.elapsedTime;
  }
  
  //create method to reset the timer (set back to 40 or "total time")
  void reset(){
    this.startTime = millis(); //set start time to current time
    this.elapsedTime = 0; //elapsed time is 0
  }
}//END CLASS

/* Class Gold Coin extends abstract Class Coin 
 *
 * A gold colored coin that is worth 100 points in game
 *
 *  "Coin Collecter" Game
 *   IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//Gold Coin inherits the attributes of abstract class Coin
class GoldCoin extends Coin {
  GoldCoin() {
    
    //call abstract Class Coin constructor
    super();
    
    //set diameter of coin
    diameter = 45;
    
    //set speed of coin
    speed = 12;
    
    //set color of coin to gold
    coinColor = color(250, 157, 8);
    
    //set value of coin
    value = 100;
    
    //set label of coin
    label = "100";
  }
}//END CLASS
/* Class Pot
 * 
 * The pot( used to collect coins)
 *
 * IAT 800 Project 2
 *  "Coin Collecter" Game
 *
 * Shannon Cuykendall
 * Created October, 2013
 *
 */


//create class Pot
class Pot {

  //declare attributes
  float xPosition;//xPosition of arc used to make pot
  float yPosition;//yPosition of arc used to make pot
  float arcWidth;//width of arc used to make pot
  float arcHeight;//height of arc used to make pot
  float angleStart;//start of the arc angle
  float angleStop;//end of the arc angle

  //create constructor with two parameters, initialize attributes
  Pot(float x, float y) {

    //first parameter x is the xPosition
    xPosition = x;

    //second parameter y is the yPosition
    yPosition = y;

    arcHeight = 200;
    arcWidth = 200;
    angleStart = 0;
    angleStop = PI;
  }

  //create method to updateand draw pot
  void update() {

    //set x position to the x position of the mouse
    xPosition = mouseX;
      
    //set y position to the y position of the mouse
    yPosition = height - arcHeight/2;

    //set thickness of outline
    strokeWeight(5);

    //set color to brown
    fill(77, 14, 11); 

    //create pot using a CHORD arc so that it closes
    arc(xPosition, yPosition, arcWidth, arcHeight, angleStart, angleStop);

    //create rectangle near the top of the pot 
    noFill();
    rect(mouseX-arcWidth/2, height- arcHeight/2, arcWidth, arcHeight/16);
  }
  
  //create function to return the arc width of the pot
  float getArcWidth(){
    return this.arcWidth;
  }
  
  //create a function to return the arc height of the pot
  float getArcHeight(){
    return this.arcHeight;
  }


}//END CLASS

/* Class Rainbow
 * 
 * A rainbow to display as a backdrop for the game
 *
 *  "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//create Class Rainbow
class Rainbow {
  
  //declare attributes
  float xPosition;//x position of arc
  float yPosition; //y position of arc
  float arcWidth; //width of arc
  float arcHeight; //height of arc
  float arcIncrease; //amount of arc displacement
  float arcDivisor; //the value that display window width is divided by to get height and width of arc 
  float angleStart;//angle the arc begins
  float angleStop;//angle arc ends
  
  //an array of the colors of the rainbow
  color rainbowColors[] = { 
    color(255, 0, 0), //red
    color(242, 89, 0), //orange
    color(243, 252, 3), //yellow
    color(42, 121, 0), //green 
    color(0, 0, 255), //blue
    color(111, 0, 255), //indigo
    color(159, 0, 255), //violet
    color(21, 211, 207) //sky color
  };
  
  //create constructor
  Rainbow() {
    
    //initialize attributes
    xPosition = width/1.9;
    yPosition = height;
    arcDivisor = 1.25;
    arcWidth = width/arcDivisor;
    arcHeight = width/arcDivisor;
    arcIncrease = 0.1;
    angleStart = PI;
    angleStop = TWO_PI;
  }
 
  //create update method that will draw rainbow
  void update() {
    
    //set thickness of outline 
    strokeWeight(2);
    
    //outline is black
    stroke(0);
 
   //create loop to draw each arc of rainbow, limit to length of the RainbowColors array
    for (int numberArcs = 0; numberArcs < rainbowColors.length; numberArcs++) {
      
      //fill each arc with color in rainbowColors array
      fill(rainbowColors[numberArcs]); 
      
      //the width and height of the arc increases with each iteration 
      arcWidth = width/(arcDivisor + numberArcs * arcIncrease);
      arcHeight = width/(arcDivisor + numberArcs * arcIncrease);
      
      //draw open arc
      arc(xPosition, yPosition, arcWidth, arcHeight, angleStart, angleStop, OPEN);
    }

  }
}//END CLASS
/* Class Score Box 
 *
 * A box to display the player's score in upper right hand corner of screen
 *
 *  "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//create class ScoreBox
class ScoreBox {
  
  //declare attributes
  int xPosition; //x position ofs score box
  int yPosition; //y position of box
  int boxWidth; //score box width
  int boxHeight; //score box height

  //create constructor
  ScoreBox() {
    
    //initialize attributes
    this.boxWidth = 100;
    this.boxHeight = 100;
    this.xPosition = width-this.boxWidth; //set to far right side of screen, account for box width
    this.yPosition = 0; //set to top of screen
  }
  
  //create update method to display score box
  void update() {
    
    //inside of score box is the same color as the background or sky blue
    fill(21, 211, 207);
    
    //the outline of the box is black
    stroke(0);
    
    //the shape is a square in the top right corner of screen
    rect(this.xPosition, this.yPosition, this.boxWidth, this.boxHeight);
    
    //set the text to black
    fill(0);
    
    //set text size
    textSize(24);
    
    //display score (global variable) in the center of score box
    text(score, this.xPosition + (boxWidth/2), this.yPosition + boxHeight/2);
    
    //set larger text size and display $ to the left of the score
    textSize(30);
    text("$", this.xPosition + (boxWidth/2 - 39), this.yPosition + (boxHeight/2));
  }
}//END CLASS
/* Class Silver Coin, extends abstract Class Coin 
 *
 * A silver colored coin that is worth 50 points in game.
 *
 *  "Coin Collecter" Game
 *  IAT 800 Project 2
 *
 * Shannon Cuykendall
 * Created October, 2013
 */

//Silver Coin inherits the attributes of abstract Class Coin
class SilverCoin extends Coin {
  SilverCoin() {
    
    //call constructor of Abstract Class Coin 
    super();
    
    //set diameter of coin
    diameter = 60;
    
    //set speed of coin
    speed = 10;
    
    //set color to silver
    coinColor = color(113, 112, 109);
    
    //set value of coin
    value = 50;
    
    //set label on coin
    label = "50";
  }

}//END CLASS


