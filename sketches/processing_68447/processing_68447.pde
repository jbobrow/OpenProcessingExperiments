
//IMPORT MINIM LIBRARY FOR AUDIO
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//DEFINE SOUNDS FOR GAME
Minim minim;
AudioPlayer player;
AudioPlayer bounce;
AudioPlayer explosion;

//CIRCLE VARIABLES
Ball ball;

//BLOCK VARIABLES
ArrayList blockList;
float difficulty;
float resetDifficulty;

//OTHER VARIABLES
int topandbottom;
int count;
int tempScore;
int highScore;
boolean gameRunning;
boolean collision;
PFont bigFont;
PFont smallFont;
boolean start;
int bridgeSelect;

//IMAGES
PImage illustrator;
PImage processing;
PImage html5;
PImage bridge;
PImage title;
PImage retry;
PImage bklyn;
PImage mnhtn;
PImage gwb;
PImage wlmbg;
PImage triboro;
PImage vrrz;
PImage qnsb;

//HIGH SCORES
int bklynScore;
int mnhtnScore;
int gwbScore;
int wlmbgScore;
int triboroScore;
int vrrzScore;
int qnsbScore;

void setup() {
  //VARIOUS SET-UP FUNCTIONS
  size(640, 480, P3D);
  colorMode(HSB, 360);
  
  //SETUP TEXT & FONTS
  bigFont = createFont("Arial", 24);
  textFont(bigFont, 24);
  smallFont = createFont("Arial", 14);
  textFont(smallFont, 14);

  blockList = new ArrayList(); //creates dynamic array for blocks
  ball = new Ball(); //create an instance of class Ball (main ball for game)
  difficulty = 55; //changes how many blocks spawn (higher number=less blocks)
  resetDifficulty = difficulty; //variable used to set difficulty back to initial after player loses

  count = 0; //your running score, displayed in top left
  tempScore = 0; //variable used to display score in retry screen
  highScore = 0; //variable that displays highest score, no matter what bridge
  topandbottom = 32; //height of top and bottom rows of screen
  gameRunning = false; //tests if player has started game
  collision = false; //determines if ball has hit block
  start = true; //determines if first time opening game or just retry

  //SET ALL HIGH SCORES TO 0
  bklynScore = 0;
  mnhtnScore = 0;
  gwbScore = 0;
  wlmbgScore = 0;
  triboroScore = 0;
  vrrzScore = 0;
  qnsbScore = 0;

  //LOAD ALL IMAGES
  illustrator = loadImage("illustrator.gif");
  processing = loadImage("processing.gif");
  html5 = loadImage("html5.gif");
  bridge = loadImage("bklyn.gif");
  title = loadImage("title.gif");
  retry = loadImage("retry.gif");
  bklyn = loadImage("bklyn.gif");
  mnhtn = loadImage("mnhtn.gif");
  gwb = loadImage("gwb.gif");
  wlmbg = loadImage("wlmbg.gif");
  triboro = loadImage("triboro.gif");
  vrrz = loadImage("vrrz.gif");
  qnsb = loadImage("qnsb.gif");

  //INITIALIZE & LOAD SOUND
  minim = new Minim(this);

  player = minim.loadFile("punch.mp3", 512);
  player.play();
  player.loop();

  bounce = minim.loadFile("bounce.wav", 512);
  explosion = minim.loadFile("explosion.wav", 512);
}



void draw() {
  background(0); //Draws background to black every frame
  imageMode(CORNER); //Draw images from corner
  checkBridge(); //check which sprite(bridge) has been selected

  //If the game is in progress, run these functions
  if (gameRunning == true) {
    
    ball.moveBall(); //moves ball every frame 
    ball.collisionBall(); //checks for collision with top and bottom of screen
    ball.displayBall(); //draw the ball

    drawBlocks(); //this function draws randomly generated balls every so many frames (determined by difficulty)

    drawTopBottom(); //draw top and bottom rows of screen.

    //TEXT AT TOP OF SCREEN FOR SCORES
    fill(0, 0, 340);
    textFont(bigFont);
    text("Score:", 10, 60);
    text(count, 85, 60);
    text("High Score:", width-200, 62);
    text(highScore, width-70, 62);
    
    count++; //advance the count/score/timer

    if (difficulty > 10) {
      difficulty -= 0.007; //decreases difficulty, which increases number of blocks spawned
    }
  }  
  
  //IF GAME HASN'T BEEN STARTED
  else {
    if (start==true) { //if first time opening game...

      image(title, 0, 0, 640, 480); //...display title screen
    }  
    //IF PLAYER HAS JUST COLLIDED, DISPLAY RETRY SCREEN
    else {
      image(retry, 0, 0, 640, 480);
      textFont(bigFont);
      text(tempScore, 350, 161);

      textFont(smallFont);
      text(triboroScore, 80, 425);
      text(mnhtnScore, 155, 425);
      text(gwbScore, 230, 425);
      text(qnsbScore, 305, 425);
      text(bklynScore, 380, 425);
      text(vrrzScore, 455, 425);
      text(wlmbgScore, 530, 425);
    }
  }
}




//Draws top and bottom row of blocks
void drawTopBottom() {
  fill(140, 250, 250);
  rect(0, 0, width, topandbottom);
  rect(0, height-topandbottom, width, topandbottom);

  for (float i=0; i<width; i+=32) { //loop through texture 32x32 square to create full columns
    beginShape();
    texture(html5);
    vertex(i, 0, 0, 0);
    vertex(i+topandbottom, 0, 100, 0);
    vertex(i+topandbottom, topandbottom, 100, 100);
    vertex(i, topandbottom, 0, 100);
    endShape();

    beginShape();
    texture(illustrator);
    vertex(i, height-topandbottom, 0, 0);
    vertex(i+topandbottom, height-topandbottom, 100, 0);
    vertex(i+topandbottom, height, 100, 100);
    vertex(i, height, 0, 100);
    endShape();
  }
}


//FUNCTION FOR KEY PRESSES TO CHANGE GRAVITY
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ball.gravity = -.3;
      ball.yVel= -ball.resetyVel; //resets gravity so that ball doesn't speed up forever
    } 
    else if (keyCode == DOWN) {
      ball.gravity = .3;
      ball.yVel= ball.resetyVel;
    }
  }
}

void drawBlocks() {
  int convertDiff = int(difficulty); //changes difficulty to harder one over time
  if (count%convertDiff == 0) { //if the remainder when dividing count by difficulty is 0...
    blockList.add(new Block(int(random(10))));//...create a new block.
  }

  for (int i = blockList.size()-1; i>=0; i--) { //loop through list of blocks
    Block block = (Block) blockList.get(i);  //check with block we're on
    block.moveBlock(); //move it
    block.displayBlock(); //show it

    if (block.destroyBlock()) { //if block has reached end of scfeen
      blockList.remove(i); //remove it from list
    }


    if (block.checkCollision()) { //if block has collided with ball
      collision = true; //set collision to true
    }
  }

  if (collision == true) { //and if collision is true
   //RESET VARIABLES FOR NEXT GAME
    gameRunning = false;
    ball.circleX = width/2;
    ball.circleY = height/2;
    ball.xVel = 0;
    ball.yVel = 5;
    ball.resetyVel = ball.yVel;
    ball.gravity = .3;
    difficulty = resetDifficulty;
    blockList.clear();

    //SET HIGH SCORES FOR INDIVIDUAL BRIDGES USING SWITCH STATEMENT (GIANT if STATEMENT)
    switch(bridgeSelect) {
    case 0:
      if (count > triboroScore) {
        triboroScore = count;
        tempScore = count;
      }
      break;

    case 1:
      if (count > mnhtnScore) {
        mnhtnScore = count;
        tempScore = count;
      }
      break;

    case 2:
      if (count > gwbScore) {
        gwbScore = count;
        tempScore = count;
      }
      break;

    case 3:
      if (count > qnsbScore) {
        qnsbScore = count;
        tempScore = count;
      }
      break;

    case 4:
      if (count > bklynScore) {
        bklynScore = count;
        tempScore = count;
      }
      break;

    case 5:
      if (count > vrrzScore) {
        vrrzScore = count;
        tempScore = count;
      }
      break;

    case 6:
      if (count > wlmbgScore) {
        wlmbgScore = count;
        tempScore = count;
      }
      break;
    }
    
    //SET OVERALL HIGH SCRORE
    if (count > highScore) {
      highScore = count;
    }
    
    tempScore = count;  //used to display score on retry screen
    count = 0; //reset count to 0
    collision = false; //set collision back to false
  }
}

//THIS FUNCTION LOOPS THROUGH LOCATIONS, CHECKING TO SEE WHICH BRIDGE HAS BEEN SELECTED.
void checkBridge() {
  if (mousePressed == true) {
    for (int i=0;i<7;i++) {
      if (dist(mouseX, mouseY, i*75+95, 380) < 30) {
        bridgeSelect = i;
        gameRunning = true;
        start = false;
      }
    }
  }
}


//CLASS FOR RANDOMLY SPAWNING BLOCKS
class Block {
  color c;
  float xPos;
  float yPos;
  float h;

  Block(int tempRandom) {
    c = color(40, random(200, 270), random(200, 270));
    //POSITIONS OF BLOCKS ARE FIXED, EXCEPT FOR HEIGHT, WHICH IS RANDOMLY ASSIGNED WITHIN CERTAIN PARAMETERS
    xPos = width;
    h = random(topandbottom+20, height/2-topandbottom);
    if (tempRandom > 5) {
      yPos = topandbottom;
    }
    if (tempRandom <= 5) {
      yPos = height-h-topandbottom;
    }
  }

  void displayBlock() {
    for (float i=yPos; i<yPos+h; i+=32) { //loop through texture 32x32 square to create full columns
      beginShape();
      texture(processing);
      vertex(xPos, i, 0, 0);
      vertex(xPos+topandbottom, i, 100, 0);
      vertex(xPos+topandbottom, i+topandbottom, 100, 100);
      vertex(xPos, i+topandbottom, 0, 100);
      endShape();
    }
    //rect(xPos, yPos, topandbottom, h);
  }

  void moveBlock() {
    xPos-=3; //move block 3 pixels over every frame
  }

  //THIS FUNCTION CHECKS TO SEE IF BALL HAS FALLEN INSIDE BLOCK
  boolean checkCollision() {
    if (ball.circleX + ball.circleSize/2 >= xPos && ball.circleX + ball.circleSize/2 <= xPos+topandbottom && ball.circleY + ball.circleSize/2 >= yPos && ball.circleY + ball.circleSize/2 <= yPos+h) {
      explosion.play(); //play sound
      explosion.rewind(); //rewind sound for use again.
      return true; //set collision to true in order to reset variables, display retry screenn, etc.
    }
    if (ball.circleX - ball.circleSize/2 >= xPos && ball.circleX - ball.circleSize/2 <= xPos+topandbottom && ball.circleY - ball.circleSize/2 >= yPos && ball.circleY-ball.circleSize/2 <= yPos+h) {
      explosion.play(); //same as above
      explosion.rewind();
      return true;
    }

    else {
      return false; //it didn't collide? give it a false and move on.
    }
  }

  boolean destroyBlock() {
    if (xPos <= -topandbottom) { //if x position of block has reached 0 minus width, destroy it.
      return true;
    }  
    else {
      return false;
    }
  }
}

//CLASS FOR BALL
class Ball {

  //DEFINE ALL VARIABLES
  float circleX;
  float circleY;
  float xVel;
  float yVel;
  float gravity;
  float circleSize;
  float resetyVel;

  //INITIALIZE ALL VARIABLES. THEY DON'T CHANGE, SO THEY ARE HARD CODED HERE.
  Ball() {
    circleX = width/2;
    circleY = height/2;
    xVel = 0;
    yVel = 0;
    resetyVel = yVel;
    gravity = .3;
    circleSize = 60;
  }

  void displayBall() {
    noStroke();
    imageMode(CENTER);

    //SWITCH STATEMENT TO DETERMINE WHICH BRIDGE HAS BEEN SELECTED. DISPLAY THAT BRIDGE.
    switch(bridgeSelect) {
    case 0:
      image(triboro, circleX, circleY, circleSize, circleSize);
      break;

    case 1:
      image(mnhtn, circleX, circleY, circleSize, circleSize);
      break;

    case 2:
      image(gwb, circleX, circleY, circleSize, circleSize);
      break;

    case 3:
      image(qnsb, circleX, circleY, circleSize, circleSize);
      break;

    case 4:
      image(bklyn, circleX, circleY, circleSize, circleSize);
      break;

    case 5:
      image(vrrz, circleX, circleY, circleSize, circleSize);
      break;

    case 6:
      image(wlmbg, circleX, circleY, circleSize, circleSize);
      break;
    }
  }

  void moveBall() {
    yVel = yVel + gravity; // Add gravity to the y velocity.
    // If the velocity is positive: makes it bigger (falling down)
    // If it's negative: makes it smaller (slowing down at top)
    circleX = circleX + xVel; // We increment the circle's x position by the x velocity
    circleY = circleY + yVel; // Same with the y position and y velocity
  }

  void collisionBall() {
    if ((circleX > width-(circleSize/2+topandbottom)) || (circleX < 0+(circleSize/2+topandbottom))) { // We're checking to see if it's about to fly off the left or right
      xVel = xVel * (-1); // And here's where we reverse it.
    }

    if (circleY > height-circleSize || circleY < 0 + circleSize) { // Same idea with the y position.
      yVel = yVel * (-0.85); // And here's where we reverse the y. We use something greater than -1 to dampen
      bounce.play();
      bounce.rewind();
    }

    if (circleY > height-topandbottom*2) { // Prevents it from falling off the bottom of the screen
      circleY = height-topandbottom*2; // Resets it at height if it's about to fall past height
    }

    if (circleY < 0+topandbottom*2) { // Prevents it from falling off the bottom of the screen
      circleY = 0+topandbottom*2; // Resets it at height if it's about to fall past height
    }
  }
}

//NEEDED TO STOP AUDIO WHEN EXITING PROGRAM
void stop() {
  player.close();
  minim.stop();

  super.stop();
}


