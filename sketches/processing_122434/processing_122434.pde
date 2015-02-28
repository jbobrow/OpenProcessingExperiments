

/* Tyler McDaniel
 CSCI 182
 Homework 5: Game
 10.23.2013
 2D Flying/Fighting Game
 */


//OBJECT ARRAYLISTS
//ArrayList rounds = new ArrayList();
//ArrayList ammos = new ArrayList();
ArrayList<Toon> players;
ArrayList<Platform> platforms;
ArrayList<Trap> traps;


//FONT/TXT GLOBAL VARIABLES
PFont bit;
PFont bitsm;
String winner;
String loser;


//TIME/TIMING/CONTROL GLOBAL VARIABLES
int t;
int deathtime;
int screen = 1;


//PHYS VARIABLES
int bubble = 50;
float manuv = .95;
float thrust = 1.05;
float resist = .25;
float grav =.50;

//IMAGE ARRAYS
PImage[] robotup;
PImage[] robotdown;
PImage[] robothurt;
PImage[] robotdie;
PImage[] roboteffecta;

//PImage[] robotshoot;
//PImage[] robotshootL;

//IMAGE VARIABLES
PImage platform;
PImage acidbarrier;
PImage robots;
PImage robotsdead;

//CLASSES

//PLAYER CLASS
class Toon {

  //CLASS VARIABLES

  float XPos;
  float YPos;
  float xSpd;
  float ySpd;
  int damageImm;
  int isLanded;
  int isGoing;
  int isFacing;
  int isThrusting;
  int isHit;
  int isDead;
  int hitDelay;
  int damage;
  int isSludged;
  //int isBoosted;
  //int isShielded;
  int trapImmunity;

  /* int isShootingL;
   // int isShooting;
   // int cooldown;
   // int ammunition; */

  //Player constructor
  //Creates a player centered on cX, cY.
  //Works by making an object of class Toon.
  //Used by declaring an object and initializing in setup.
  //Parameters are cX, cY, which determine where the object is created.
  Toon (float cX, float cY) {

    //CLASS DATA

    XPos=cX;
    YPos=cY;
    xSpd = 0;
    ySpd = 0;
    isLanded = 0;
    isGoing = 0;
    // isFacing = 1;
    isThrusting = 0;
    isHit = 0;
    isDead = 0;
    damage = 0;
    damageImm=0;
    hitDelay = 0;
    isSludged = 0;
    // isShielded = 0;
    // isBoosted = 0;
    trapImmunity = 0;
    //  isFacing = 1;
    // isShootingL = 0;
    // isShooting= 0;
    // cooldown = 0;
    // ammunition = 0;
  }

  //Character animation function
  //Invoked by object.charAnimator(); within draw
  //Displays images at character x, y positions using t (frameCount%4)
  //No parameters, no return value(s)

  void charAnimator() {
    if (damage>= 20) {
      image(robotdie[t], XPos, YPos);
    }
    else {

      if (isHit == 0 && isThrusting == 1) {
        image(robotup[t], XPos, YPos);
      }
      else if (isHit == 0) {
        image(robotdown[t], XPos, YPos);
      }
      else if (isHit == 1) {
        image(robothurt[t], XPos, YPos);
      }

      if (isSludged == 1) {
        tint(255, 100); 
        image(roboteffecta[t], XPos, YPos-26);
        noTint();
      }
    }
  }

  //Character movement function
  //Uses character status variables to appropriately position players
  //Invoked by object.charPosition(); in draw 
  //No parameters/return value(s)

  void charPosition() {

    if (isThrusting == 1 && ySpd <= 10) {
      ySpd += thrust;
    }
    else if (isThrusting == 0 && ySpd >= -5 && isLanded <= 0) {
      ySpd -= grav;
    }
    YPos -= ySpd;

    if (YPos <= 31) {
      YPos = 33;
      isThrusting = 0;
      ySpd = -.25;
    }
    if (YPos >= 475) {
      YPos = 475;
      ySpd = -.25;
    }

    if (isGoing == 1 && xSpd <= 10) {
      xSpd += manuv;
    }
    else if (isGoing == 2 && xSpd >= -10) {
      xSpd -= manuv;
    }
    else if (isGoing == 0 && xSpd > 0) {
      xSpd -= resist;
    }
    else if (isGoing == 0 && xSpd < 0) {
      xSpd += resist;
    }
    XPos += xSpd;
    if (XPos < 15) {
      XPos = 785;
    }
    if (XPos > 785) {
      XPos = 15;
    }
  }
}

//END OF CLASS


//PLATFORM CLASS


class Platform {

  //CLASS VARIABLES
  float pXl;
  float pXr;
  float pYu;
  float pYd;

  //Platform constructor.
  //Creates a platform that holds players with upper left at pX1, pY1.
  //Works by making an object of class Platform.
  //Used by declaring an object and initializing in setup.
  //Parameters are pX1, pX2, pY1, pY2 - upper left at X1, Y1, 
  //lower right at X2, Y2.
  Platform (float pX1, float pX2, float pY1, float pY2) {
    pXl = pX1;
    pXr = pX2;
    pYu = pY1;
    pYd = pY2;
  }
}

//TRAP CLASS

class Trap {

  //CLASS VARIABLES
  float tXl;
  float tXr;
  float tYu;
  float tYd;
  int tType;

  //Trap constructor.
  //Creates a trap to harm players with upper left at TrX1, TrX2.
  //Works by making an object of class Trap.
  //Used by declaring an object and initializing in setup.
  //Loc parameters are TrX1, TrX2, TrY1, TrY2 - upper left at X1, Y1, 
  //lower right at X2, Y2.
  //TrT (trap type) parameter is not part of game yet

  Trap (float TrX1, float TrX2, float TrY1, float TrY2, int TrT) {
    tXl = TrX1;
    tXr = TrX2;
    tYu = TrY1;
    tYd = TrY2;
    tType = TrT;
  }
}


//PLACEHOLDER - RND AND MODIFIER CLASSES


//Keyboard interaction function
//Works by checking to see which keys players have pressed most recently
//keyCode keys for P1, ASCII keys for P2
//used by invoking charControl(); in draw
//no parameters, no return value, sets player variables for other funcs
void charControl() {
  if (keyPressed && keyCode == RIGHT) {
    // P1.isFacing = 1;
    P1.isGoing = 1;
  }

  else if (keyPressed && keyCode == LEFT) {
    // P1.isFacing = 2;
    P1.isGoing = 2;
  }

  else if (keyPressed && keyCode == UP && P1.isHit == 0) {
    P1.isThrusting = 1;
  }

  else {
    P1.isThrusting = 0;
    P1.isGoing = 0;
  }

  if (keyPressed && key == 'd') {
    // P2.isFacing = 1;
    P2.isGoing = 1;
  }  

  else if (keyPressed && key == 'a') {
    // P2.isFacing = 2;
    P2.isGoing = 2;
  }

  else if (keyPressed && key == 'w' && P2.isHit == 0) {
    P2.isThrusting = 1;
  }
  else {
    P2.isThrusting = 0;
    P2.isGoing = 0;
  }
}


//Image loader - loads images and fonts at beginning of game
//Works by setting image/font variables/arrays
//Used by invoking once within setup
//No parameters, no return vals

void loadImages() {
  bit = loadFont("bitwise-48.vlw");
  bitsm = loadFont("bitwise-18.vlw");
  robots = loadImage("robots.png");
  platform = loadImage("platform.png");
  acidbarrier = loadImage("acidbarrier.png");
  robotsdead = loadImage("robotsloser.png");


  robotup = new PImage [4];
  robotdown = new PImage [4];
  robothurt = new PImage [4];
  robotdie = new PImage [4];
  roboteffecta = new PImage [4];
  // robotshootL = new PImage [4];
  // robotshoot = new PImage [4];

  for (int i=0; i <robotup.length; i++) {
    robotup[i] = loadImage("data/robotup" + i + ".png");
  }
  for (int j=0; j <robotdown.length; j++) {
    robotdown[j] = loadImage("data/robotdown" + j + ".png");
  } 
  for (int k=0; k <robothurt.length; k++) {
    robothurt[k] = loadImage("data/robothurt" + k + ".png");
  } 
  for (int n=0; n <robotdie.length; n++) {
    robotdie[n] = loadImage("data/robotdie" + n + ".png");
  } 
  for (int o=0; o <roboteffecta.length; o++) {
    roboteffecta[o] = loadImage("data/roboteffecta" + o + ".png");
  } 
  /*  for (int l=0; l <robotshoot.length; l++) {
   robotshoot[l] = loadImage("robotshoot" + l + ".png");
   }
   / for (int m=0; m <robotshootL.length; m++) {
   robotshootL[m] = loadImage("robotshootL" + m + ".png");
   }
   */
  //robotup0 = loadImage("robotup0.png");
}

//Object drawing function.
//Draws non-player objects in the game, eventually will draw rounds
//Works by displaying images at object positions from arraylists
//Used by invoked objDisplay(); in draw
//No parameters or return values.

void objDisplay() {
  for (int i = 0; i < platforms.size(); i++) {
    Platform p = platforms.get(i);
    imageMode(CORNER);
    image(platform, p.pXl, p.pYu);
  }
  imageMode(CENTER);
  image(acidbarrier, 300, 564);
  image(acidbarrier, 535, 564);
}

//Character status function
//Checks distances between objects and sets variables for dmg/effect
//animation.  Also adds damage/death for game progession.
//Works by using distance formula for players or simple location
//comparisons in the case of non-player objects.
//No parameters/return value(s).
void charStatus() {

  float dx = P1.XPos - P2.XPos;
  float dy = P1.YPos - P2.YPos;
  float d = sqrt((dx*dx)+(dy*dy));

  if (d < bubble)
  {
    if (P2.YPos >= P1.YPos && P2.damageImm <= 0 && P1.damageImm <= 0) {
      P2.damage += 5;
      P2.isHit = 1;
      P2.xSpd *= -1.5;
      P2.ySpd *= -1.5;
      P1.xSpd *= -1;
      P1.ySpd *= -1;
      P2.hitDelay=6;
      P2.damageImm = 25;
      P1.damageImm = 25;
    }
    else if (P1.YPos > P2.YPos && P2.damageImm <= 0 && P1.damageImm <= 0 ) {
      P1.damage += 5;
      P1.isHit = 1;
      P1.xSpd *= -1.5;
      P1.ySpd *= -1.5;
      P2.xSpd *= -1;
      P2.ySpd *= -1;
      P1.hitDelay=6;
      P2.damageImm = 25;
      P1.damageImm = 25;
    }
  }

  for (int i = 0; i < platforms.size(); i++) {
    Platform p = platforms.get(i);
    if (P1.XPos > p.pXl && P1.XPos < p.pXr && P1.YPos+26 < p.pYd-15 && P1.YPos+26 > p.pYd-22 && P1.isThrusting == 0) {

      P1.ySpd = 0;
      P1.isLanded = 2;
    }
    if (P2.XPos > p.pXl && P2.XPos < p.pXr && P2.YPos+26 < p.pYd-15 && P2.YPos+26 > p.pYd-22 && P2.isThrusting == 0) {

      P2.ySpd = 0;
      P2.isLanded = 2;
    }
  }



  for (int j = 0; j < traps.size(); j++) {
    Trap t = (Trap) traps.get(j);
    if (P1.XPos > t.tXl-20 && P1.YPos > t.tYu-20 && P1.XPos < t.tXr + 20 && P1.YPos < t.tYd +20 && P1.trapImmunity <= 0) {
      if (t.tType == 1) {
        P1.isSludged = 1;
        P1.trapImmunity = 24;
        P1.damage += 8;
        P1.xSpd *= .5;
      }
    }

    if (P2.XPos > t.tXl-20 && P2.YPos > t.tYu-20 && P2.XPos < t.tXr + 20 && P2.YPos < t.tYd+20 && P2.trapImmunity <= 0) {
      if (t.tType == 1) {
        P2.isSludged = 1;
        P2.trapImmunity = 24;
        P2.damage += 8;
        P2.xSpd *=.5;
      }
    }
  }

  P1.trapImmunity--;
  P2.trapImmunity--;

  P2.damageImm--;
  P1.damageImm--;

  P2.isLanded--;
  P1.isLanded--;

  P1.hitDelay--;
  P2.hitDelay--;

  if (P2.hitDelay <= 0) {
    P2.isHit = 0;
  }
  if (P1.hitDelay <= 0) {
    P1.isHit = 0;
  }
  if (P2.trapImmunity <= 0) {
    P2.isSludged = 0;
  }
  if (P1.trapImmunity <= 0) {
    P1.isSludged = 0;
  }

  if (P2.damage >= 20) {
    P2.isDead = 1;
    winner = "Player 1";
    loser = "Player 2";
    frameRate(8);
    deathtime++;
  }

  if (P1.damage >= 20) {
    P1.isDead = 1;
    winner = "Player 2";
    loser = "Player 1";
    frameRate(8);
    deathtime++;
  }
}
//Check function to see if anyone has won yet
//Works by referencing the deathtime function from the status func.
//Used by invoking gameCheck(); in draw.
//No parameter or return, but will move to end screen when invoked.
void gameCheck() {
  if (deathtime >= 24) {
    screen = 4;
  }
}

//AUDIOP LIBRARY
import ddf.minim.*;

//OBJECT DECLARATION
Minim minim;
AudioPlayer theme;
Toon P1;
Toon P2;
Platform Pl1;
Platform Pl2;
Trap Tr1;



//Setup function
//Sets size, bg, etc., loads images, music, and fonts
//Creates new objects and adds them to arraylists.
//Works automatically
void setup() {
  size(800, 600);
  background(0, 0, 0);
  frameRate(12);
  imageMode(CENTER);
  textAlign(CENTER);
  loadImages();

  minim = new Minim(this);
  theme = minim.loadFile("mm.mp3");
  Tr1 = new Trap(305, 422.5, 405, height, 1);
  Pl1 = new Platform(15, 195, 100, 180);
  Pl2 = new Platform (605, 785, 100, 180);
  P1 = new Toon(75, 120);
  P2 = new Toon(725, 120);

  traps = new ArrayList<Trap>();
  traps.add(new Trap(305, 422.5, 405, height, 1));
  platforms = new ArrayList<Platform>();
  platforms.add(Pl1);
  platforms.add(Pl2);
  players = new ArrayList<Toon>();
  players.add(P1);
  players.add(P2);
}


//Draw function
//Switch determines which screen the game is on, and displays appropriately.
//Works automatically.

void draw() {
  switch(screen) {
    //START SCREEN
  case 1:
    theme.play();
    background(0, 0, 0);
    textFont(bit);
    fill (255, 0, 0);
    image(robots, width/2, height/2-20);
    text("KILLER ROBOTS IN SPACE", width/2, height/8+40);
    textFont(bitsm);
    fill(255, 255, 255);
    text("For 2 Players", width/2, height/2-20);
    text("Press any key for instructions", width/4, height-40);
    if (keyPressed) {
      screen = 2;
    }

    break;

  case 2:
    //INSTR SCREEN
    background(0, 0, 0);
    textFont(bit);
    fill(255, 0, 0);
    image(robots, width/2, height/2-20);
    text("P1-RED ROBOT", width/4-20, height/4);
    fill(0, 255, 0);
    text("P2-GREEN ROBOT", width/2+width/4, height/4);
    textFont(bitsm);
    fill(255, 255, 255);

    text("TAP UP = THRUST", width/4-20, height/4 + 40);
    text("TAP RIGHT = MANEUVER RIGHT", width/4-20, height/4 + 60);
    text("TAP LEFT = MANEUVER LEFT", width/4-20, height/4 + 80);
    text("TAP W = THRUST", width/2+width/4+20, height/4 + 40);
    text("TAP D = MANEUVER RIGHT", width/2+ width/4 +20, height/4 + 60);
    text("TAP A = MANEUVER LEFT", width/2+ width/4 + 20, height/4 + 80);

    text("Your objective is to destroy the other robot.", width/2, height-60); 
    text("Inflict damage by colliding with your opponent from above, OR by dunking them in the ACID PIT!", width/2, height-40);
    text("Press any key to begin", width/2, height-20);

    if (keyPressed) {
      screen = 3;
      theme.rewind();
    }

    break;

  case 3:
    //GAME SCREEN
    theme.play();
    t = frameCount%4;

    background(0, 0, 0);
    noStroke();
    fill(255, 255, 255);
    ellipse (680, 500, 5+random(1, 5), 5+random(1, 5));
    ellipse (260, 250, 5+random(1, 5), 5+random(1, 5));
    ellipse (580, 40, 5+random(1, 5), 5+random(1, 5));
    ellipse (400, 320, 5+random(1, 5), 5+random(1, 5));

    stroke(249, 247, 210);
    strokeWeight(4);
    fill(254, 252, 215);
    rect(-25, 525, width+50, 100, 55);
    triangle(45, 510, 38, 470, 52, 470);
    rect(39, 510, 12, 20);
    rect(39, 470, 11, 45);
    fill(0, 0, 0);
    ellipse(45, 470, 20, 10);
    noFill();
    bezier(35, 525, 40, 510, 38, 495, 35, 470);
    bezier(55, 525, 50, 510, 52, 495, 55, 470);

    fill(254, 252, 215);
    noStroke();
    ellipse(165, 545, 65, 65);

    pushMatrix();
    translate(450, -15);
    ellipse(165, 545, 65, 65);
    popMatrix();
    stroke(249, 247, 210);
    strokeWeight(4);

    pushMatrix();
    translate(60, 20);
    triangle(45, 510, 38, 470, 52, 470);
    rect(39, 510, 12, 20);
    rect(39, 470, 11, 45);
    fill(0, 0, 0);
    ellipse(45, 470, 20, 10);
    noFill();
    bezier(35, 525, 40, 510, 38, 495, 35, 470);
    bezier(55, 525, 50, 510, 52, 495, 55, 470);
    popMatrix();

    fill(254, 252, 215); 
    pushMatrix();
    translate(85, 5);
    triangle(45, 510, 38, 470, 52, 470);
    rect(39, 510, 12, 20);
    rect(39, 470, 11, 45);
    fill(0, 0, 0);
    ellipse(45, 470, 20, 10);
    noFill();
    bezier(35, 525, 40, 510, 38, 495, 35, 470);
    bezier(55, 525, 50, 510, 52, 495, 55, 470);
    popMatrix();

    fill(254, 252, 215); 
    pushMatrix();
    translate(215, 25);
    triangle(45, 510, 38, 470, 52, 470);
    rect(39, 510, 12, 20);
    rect(39, 470, 11, 45);
    fill(0, 0, 0);
    ellipse(45, 470, 20, 10);
    noFill();
    bezier(35, 525, 40, 510, 38, 495, 35, 470);
    bezier(55, 525, 50, 510, 52, 495, 55, 470);
    popMatrix();

    fill(254, 252, 215); //moon color
    pushMatrix();
    translate(615, 0);
    triangle(45, 510, 38, 470, 52, 470);
    rect(39, 510, 12, 20);
    rect(39, 470, 11, 45);
    fill(0, 0, 0);
    ellipse(45, 470, 20, 10);
    noFill();
    bezier(35, 525, 40, 510, 38, 495, 35, 470);
    bezier(55, 525, 50, 510, 52, 495, 55, 470);
    popMatrix();


    fill(168, 187, 25);
    noStroke();
    strokeWeight(0);
    rect(305, 524, 235, 100);
    stroke(255, 255, 255);
    strokeWeight(.5);
    for (int bub = 0; bub <=35; bub++) {
      ellipse((int) random (320, 525), (int) random (405, 565), 15, 15);
    }
    for (int bubsurf = 0; bubsurf <=50; bubsurf++) {
      ellipse((int) random (315, 525), 524+(int)random(1, 5), 20, 10);
    }

    fill(0, 0, 0);
    for (int d3 = 0; d3 <= 20; d3++) {
      ellipse(4*d3+20, 30, 4, 12);
    }


    for (int d4 = 0; d4 <= 20; d4++) {
      ellipse(770-d4*4, 30, 4, 12);
    }



    fill(255, 0, 0, 150);
    text("DAMAGE", 60, 18);
    for (int d1 = 0; d1 <P1.damage; d1++) {
      ellipse(20+d1*4, 30, 4, 12);
    }


    fill(0, 255, 0, 150);
    text("DAMAGE", 730, 18);
    for (int d2 = 0; d2 <P2.damage; d2++) {
      ellipse(770-d2*4, 30, 4, 12);
    }




    P1.charPosition();
    P2.charPosition();
    charControl();
    charStatus();
    P1.charAnimator();
    fill(255, 0, 0, 15*t);
    stroke(255, 0, 0, 5*t);
    rectMode(CENTER);
    rect(P1.XPos, P1.YPos-26, 80, 82);
    P2.charAnimator();
    fill(0, 255, 0, 10*t);
    stroke(0, 255, 0, 5*t);
    rect(P2.XPos, P2.YPos-26, 80, 82);
    rectMode(CORNER);
    objDisplay();
    gameCheck();


    break;

  case 4:
    //END SCREEN
    deathtime = 0;
    P1.damage = 0;
    P2.damage = 0;
    background(0, 0, 0);
    textFont(bit);
    image(robots, width/4, height/2);
    image(robotsdead, width-width/4, height-height/2);
    fill(255, 0, 0);
    text(loser + " is SCRAP!", width-width/4-20, height-height/4);
    text(winner + " is the WINNER!", width/4+50, height/2); 

    fill(255, 255, 255);
    text("Press any key to play again", width/2, height-40);
    if (keyPressed) {
      screen = 1;
    }
  }
}

//Defines stop function for proper minim function.
void stop()
{
  theme.close();
  minim.stop();

  super.stop();
}



/*
 
 Projectiles
 
 Pickups
 
 SFX
 */



