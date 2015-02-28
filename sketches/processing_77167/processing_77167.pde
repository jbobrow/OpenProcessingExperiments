
//NOTE: currently this game can be played with a
//potentiometer and a pushbutton connected to the
//computer through Arduino, OR it can be played
//with keyboard controls. Since I'm posting this on
//OpenProcessing where people are unlikely to have
//the requisite Arduino setup on hand, I've commented
//out the Ardunio-specific code and enabled the keyboard
//commands. Everything is commented so you can see what
//does what. Look for the --> to indicate Arduino code.
//If you want to play with a connected Arduino,
//uncomment that code. Applies on this tab and the 'you' tab.

//-->import processing.serial.*; //Load the library to read
//information from the serial port. In this case we will
//load data from an Arduino. See the "arduino_code" tab.

PFont font; //Declare a font.
//-->Serial myPort; //Declare a serial port.

int [] copiedValues = new int[2]; //Make an array to store
//the values we get from the Arduino. This is necessary so
//we can use the data in Processing.

//The following code declares instances of four objects.
you meYou;
youBullet myBullet;
alienScum myAlienScum;
scumBullet itsBullet;

//Will use the following four booleans to control
//whether movement and shooting are possible.
boolean goLeft = false;
boolean goRight = false;
boolean shoot = false;
boolean scumAttack = true;

//Variables to control health, level and movement.
int youHealth;
int scumHealth;
int gameState;
float mappedValue;

void setup() {
  //Initialize each of the variables reading the
  //output from the Arduino.
  copiedValues[0] = 0;
  copiedValues[1] = 1; //'1' for the pushbutton
  //means the button isn't pressed.

  //println(Serial.list()); //Uncomment this line
  //to see a list of the serial ports and determine
  //which one the Arduino is plugged into. We need
  //that to know which port number to put in the
  //brackets in the next line of code.
  
  //-->myPort = new Serial(this, Serial.list()[4], 9600);
  //The above opens the serial port, communicating at
  //the same rate as we set in the code for Arduino.
  
  //-->myPort.bufferUntil('\n'); //I don't totally get this,
  //but I think from the way Francisco explained it that
  //we're using the line break character to separate out
  //each reading from Arduino into discrete chunks so we
  //can use it effectively in Processing. This code says
  //don't make a new serial event until the line break.

  gameState = 0; //Set the game to the title screen.
  youHealth = 1; //Only one health for you.
  scumHealth = 3; //The enemy gets three health. How
  //is that fair?
  size(600, 500);
  smooth();
  fill(255);
  stroke(255);
  strokeWeight(2);
  meYou = new you(50, 25); //Width and height.
  myBullet = new youBullet();
  myAlienScum = new alienScum(100, 25); //Width and height.
  itsBullet = new scumBullet();
  font = loadFont("font.vlw");
  textAlign(CENTER);
}

void draw() {
  //OK. The potentiometer outputs from 0-1023 (at least
  //with the 100 ohms resistor I'm using). We want to use
  //the output to control horizontal movement. But the width
  //of the sketch is not necessarily 1023. So we scale the
  //output proportionate to the width of the sketch using map.
  //We don't want movement off the screen, so we account for
  //the object's width in the mapping.
  mappedValue = map(copiedValues[0], 0, 1023, 0, width-meYou.wide);

/*-->
  if (copiedValues[1] == 0) { //If player pressed the button
    if (gameState == 0) { //If it's the title screen
      gameState = 1; //Move to the game play screen.
    }
    else {
      shoot = true; //Otherwise enable shooting.
    }
  }
  else {
    shoot = false; //Otherwise disable shooting.
  }
  */
  if (gameState == 0) { //If it's the title screen
    background(0);
    textFont(font, 48);
    text("Arduino Invader", width/2, height/3);
    textFont(font, 24);
    text("An Arduino Production\nby Matt Griffis", width/2, 2*(height/3));
    textFont(font, 16);
    text("Spin the dial to move. Press the button to fire.\n[Fire] to begin.", width/2, height-(height/6));
  }
  if (gameState == 1) { //If it's the game play screen
    background(0);
    meYou.display();
    meYou.update();
    myBullet.display();
    myBullet.update(meYou.xPos, meYou.yPos, myAlienScum.xPos, myAlienScum.yPos);
    //Above we pass the ever-changing values of the character and
    //enemy object's positions into the update function for the bullet.
    myAlienScum.display();
    myAlienScum.update();
    itsBullet.display();
    itsBullet.update(myAlienScum.xPos, myAlienScum.yPos, meYou.xPos, meYou.yPos);
    //We do the same thing for the enemy's bullet as we did for our bullet.
    if (youHealth <= 0) { //If you reach zero health
      gameState = 2; //Load the game over screen.
    }
    if (scumHealth <= 0) { //If the enemy reaches zero health
      gameState = 3; //Load the game won screen.
    }
  }
  if (gameState == 2) { //Game over screen.
    fill(0, 0, 255);
    textFont(font, 64);
    text("YOU LOSE.", width/2, height/3);
    textFont(font, 48);
    text("Nice one. The Earth is lost.", width/2, 3*(height/5));
    textFont(font, 48);
    text("[R] to try again.", width/2, height-(height/6));
    noFill();
  }
  if (gameState == 3) { //Game won screen.
    background(0);
    fill(0, 0, 255);
    textFont(font, 64);
    text("YOU WIN!", width/2, height/3);
    textFont(font, 48);
    text("Alright! The Earth is saved.", width/2, 3*(height/5));
    textFont(font, 48);
    text("[R] to relive your glory.", width/2, height-(height/6));
    noFill();
  }
}

//NOTE: the following keyPressed and keyReleased events are relevant
//only if you're playing the game without an Arduino hooked up. In that
//case you can comment out the serial-port-related code and play the
//game using keyboard controls.

//We use key-triggered booleans to enable and disable movement,
//rather than putting the key presses directly into if statements
//updating the position of the object. This makes movement smoother
//and allows Processing to recognize multiple button presses at once.
//Once again I am indebted to Ramiro Corbetta for suggesting this method.
void keyPressed() {
  if (keyCode==LEFT) {
    goLeft = true;
  }
  if (keyCode==RIGHT) {
    goRight = true;
  }
  if (key==' ') { //Space bar.
    shoot = true;
  }

  if (keyCode==ENTER || keyCode==RETURN) {
    if (gameState == 0) { //If it's the title screen
      gameState = 1; //Move to the game play screen.
    }
  }
  if (key=='r' || key=='R') {
    setup(); //Restart the game.
    
    //NOTE: this doesn't work with the Arduino hooked up for some
    //reason. That seems to be the case for all of us in the class
    //who attempted to use a restart command, so I suspect it has
    //to do with Processing's communication with the Arduino unit.
  }
}

void keyReleased() {
  if (keyCode==LEFT) {
    goLeft = false;
  }
  if (keyCode==RIGHT) {
    goRight = false;
  }
  if (key==' ') {
    shoot = false;
  }
}

//I copied the following code and commentary straight from
//Francisco's example. Thanks, Francisco. The only revisions
//I made were to edit the code to handle two sensors instead
//of three (and I commented out the 'fancy info' print command).

/*-->
void serialEvent (Serial myPort) {

  String inString = myPort.readStringUntil('\n');// get the
  //ASCII string, read until we encounter a new line character
  //  println(inString); // print the whole incoming message

  // We do three things here,
  // We split the incoming string when it finds a "," 
  // Copies each splitted string into an array
  // And we convert the string to an int
  int myValueString[] = int(split(inString, ",")); 
  //println(myValueString.length);

  if (myValueString.length>1) { //if the array is larger than two

    //print the info in a fancy way
    //print(" one :"   + myValueString[0]);
    //print(" two :"   + myValueString[1]);
    //println();

    //now copy those values into our array, so it can be used in the draw()
    for (int i = 0; i<copiedValues.length ;i++) {
      copiedValues[i] = myValueString[i];
    }
  }
}
*/

