
/*
  "Attack of the Blobs"
  Created by Owen Denvir
 */


import krister.Ess.*;      //Imports the Ess Library to apply to the patch 
AudioChannel menuChannel;  // Menu music channel
AudioChannel fireChannel;  // Blaster fire channel
AudioChannel fireTripleChannel;  // Blaster powerup channel
AudioChannel synthChannel;  // Synth channel
AudioChannel powerUpChannel;  // Powerup channel
AudioChannel blobChannel;  // Blob sounds channel
AudioChannel gameOverChannel;  // Game Over sound channel
AudioChannel lifeLostChannel;  // Ship explode sound channel
AudioChannel alienBoomChannel;  // Ship explode sound channel
AudioChannel wallGrowthChannel;  // Growing wall sound channel
AudioChannel powerUpMoveChannel;  // Power up moving sound channel
AudioChannel newLevelChannel;  // Level progression sound channel
AudioChannel jetsChannel;  // Jets sound channel


////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//    Pre-game startup screen
//
// Menu options
boolean startScreen = true;  // Display start menu from beginning
boolean instructions = false;  // Instructions option on home screen
boolean highScoreTable = false;  // View high score (home screen)

// Startup titles
float attackX = 0;  // Title part 1 initial X position
float ofTheY = 0;  // Title part 2 initial Y position
float blobsX = 1200;  // Title part 3 inital X position

// Mock ship
float mockShipX = 450;  // Startup screen ship X (which will hover)
float mockShipY = 440;  // Startup screen ship Y (which will hover)
boolean moveRight = true;  // Alternate between right and left movement
boolean moveDown = true;  // Alternate between upward and downward movement

// Mock aliens
float mockAlienX = 310;  // Startup screen alien X (which will circle the ship)
float mockAlienY = 340;  // Startup screen alien Y (which will circle the ship)
boolean moveAlienRight = true;  // Alternate between right and left movement
boolean moveAlienDown = false;  // Alternate between upward and downward movement

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//    In-game spaceship control
//
// Ship position
float shipX= 500;  // Inital X Position
float shipY= 700;  // Initial Y Position

// Jets position and size
float speed = 0;  // Mouse speed
float diameter = 0;  // Jets size
boolean drawJets = false;  // Only draw jets when mouse has moved

// Blaster variables
ArrayList blasterBullets;  // ArrayList to contain each bullet
boolean fire = false;
// Shot floating points
float blasterX = 0;  // X Position
float blasterY = 0;  // Y Position

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
// Power up
boolean triplePowerUp = false;  // Three blaster shots power up
boolean powerMessage = false;  // Only display message once per power up
float powerX = 1100;  // Initial power up x position
float powerY = 50;  // Initial power up y position

// Colour changing (invincibility)
int seconds;  // Time keeper
int secPrev;  // For counting
int count = 6;  // Colour changer

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//    Target
//
// Alien variables
ArrayList targets;  // ArrayList to contain each target
boolean appear = false;
int oneBangTime = 0;
int oneBangDead = 0;
// Target floating points
float targetX = 1000;  // X Position
float targetY = 0;  // Y Position
float radius = 80;

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//    Background
//
// Space dust
ArrayList dustCloud;  // ArrayList to contain each grain of dust
boolean newDust = false;
float dustYPos = 10;  // Random position for each new dust particle

// Font load
PFont appleCasual;
PFont teenspirit;
PFont arialBoldItalicMT;

// Explosions and scoring
float bulletTotalX = 1200;
float targetTotalX = 200;
float bulletTotalY = 100;
float targetTotalY = 200;
boolean collision = false;  // Whether or not explosion takes place
float explosionTarget = 0;  // Contact of blaster with alien
float explosionDead = 100;  // Contact of ship with alien
boolean invincible = false;  // Short invincibility time following life lost
String[] feedback = {
  "No good!", "Oh dear...", "You can do better!", "Mediocre at best...", 
  "Blobs rule!", "Try harder!", "...really?"};  // Array of end messages
float endMessage;  // Pull a random number from the array of messages

// Scoring
byte score = 0;  // Begin with no score
byte highScore;  // Holds saved high score
int prevHighScore;  // Comparing high scores upon game over
byte[] recordScoreSave;  // Highest score saved as a .dat file

// Text for entering name on high score
int nameX = 180;  // Letters' inital X position
int nameY = 370;  // Letters' Y position
int nameLimit = 0;  // Limit to number of characters in name (no more than 8)
boolean highScoreNaming = false;  // High score scene (name entering)
boolean newHighScore = false;  // For Game Over (separate to high score scene)
PImage highScorePic;  // Picture of name

// Level progression
int lives = 3;  // Begin with 3 lives
int level = 1;  // Begin on level 1
int oneBangLevel = 0;  // Ensure level only ever rises by 1 each time

// Game over setup
float obstruction = 0;  // Grows larger with each alien hitting the left of the screen
boolean alive = true;  // Life lost
boolean gameOver = false;
int alienWall = 0;  // Mass of aliens swarm the screen on game over
int loaded = 0;  // Stop the wall from obscuring the screen at the beginning of the game
boolean mouseBegun = false;  // If the mouse has moved on restart, end the ship animation
boolean firstTarget = true;  // If the first target has arrived, allow the obstruction to build


////////////////////////////////////////////////////////////////////////////////
// Patch finished, cleaning up Ess

public void stop() {
  Ess.stop();          //Stop the audio
  super.stop();
}


