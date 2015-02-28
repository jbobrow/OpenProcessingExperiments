
// TERM PROJECT FOR 15-112
// JOLYN SANDFORD, jsandfor
// Section B
// PARASOL MUSHROOM

//write up - design documents, comparison, other similar programs
//separate document - comparison to TK Inter
/*******************************************************************/

//This calls the different portions of the game as seen with the switch function in draw()
int GAMEMODE = 0;

//This deals with the scoring system (gathering flowers, mostly)
int score = 0; //the actual score
int oldScore = 0; //the thing that checks if another flower has been collected
int addFlowerPoint = 75; //the point value of flowers

boolean tweeted = false;

//these lines are for sound (bgm, sfx, etc.)
import ddf.minim.*; //the module(?) for sounds
Minim minim;
AudioPlayer introMusic, bgMusic, bgNoises; //background music
AudioSample jumpSound, slam, ding; //sound effects

//declare images, names are largely self-explanatory
PImage lytcha, bg1, credits, instructions, menuButton, menuMouse, lastScene;
PImage soundOff, soundOn, resetButton, parasolMushroom, skipIntroButton;
PImage[] platformImages = new PImage[4];
PImage[] menu = new PImage[7];
PImage[] emmySprite = new PImage[24];
PImage[] cutsceneOne = new PImage[11];
PImage[] flowers = new PImage[3];

//declare font
PFont font;

//used to track the camera and background position
float cameraOffsetX;
float backgroundCamera;

//initiate the classes created in the other tabs
Emmy player = new Emmy();
Level levelPlaying = new Level();
Keyboard buttins = new Keyboard();

//these are for keeping track of play time and time scores
int startTime, currentTime, gameTime, timeScore, rawTimeScore;
int defaultTime = 60;
boolean startTheGame = false;

//these are the gravity variables - parasolGravity kicks in when you've got downward
//velocity and the parasol
float gravity = 0.7;
float parasolGravity = 0.17;

//self-explanatory really
void setup() {
  //set up the size and background and stuff
  size(800, 600);
  background(0);
  
  loginTwitter();

  //import all the sounds
  minim = new Minim(this);
  int bufferSize = 1024;
  introMusic = minim.loadFile("introoutro.mp3", bufferSize);
  bgMusic = minim.loadFile("bgmusic.mp3", bufferSize);
  bgNoises = minim.loadFile("BGnoises.mp3", bufferSize);
  jumpSound = minim.loadSample("hup.mp3", bufferSize);
  slam = minim.loadSample("close.mp3", bufferSize);
  ding = minim.loadSample("ding.mp3", bufferSize);

  //import the font
  font = loadFont("SegoePrint-Bold-25.vlw");

  //import all the images
  lytcha = loadImage ("lytcha.png");
  bg1 = loadImage ("bg1.png");
  parasolMushroom = loadImage ("Parasol.png");
  credits = loadImage ("Credits.png");
  instructions = loadImage ("instructions.png");
  menuButton = loadImage ("menuButton.png");
  menuMouse = loadImage ("menuMouseOver.png");
  soundOff = loadImage ("soundoffbutton.png");
  soundOn = loadImage ("soundonbutton.png");
  resetButton = loadImage ("resetbutton.png");
  skipIntroButton = loadImage ("skipIntro.png");
  lastScene = loadImage ("lastScene.png");
  //these images are arrays, it makes it easier to load a lot of them
  for (int i = 0; i <= 6; i++) {
    menu[i] = loadImage ("menu"+i+".png");
  }
  for (int i = 0; i <= 3; i++) {
    platformImages[i] = loadImage ("platform"+(i+1)+".png");
  }
  for (int i = 0; i <= 23; i++) {
    if (i <= 11) {
      emmySprite[i] = loadImage ("EmmyNoP"+i+".png");
    }
    else {
      emmySprite[i] = loadImage ("EmmyWithP"+(i-12)+".png");
    }
  }
  for (int i = 0; i <= 10; i++) {
    cutsceneOne[i] = loadImage ("opensequence"+(i+1)+".png");
  }
  for (int i = 0; i <= 2; i ++) {
    flowers[i] = loadImage ("flower"+i+".png");
  }

  //initialize Camera
  cameraOffsetX = 0.0;

  //frameRate controls how many times draw() is called per second
  frameRate(24);

  //starts off all the variables needed in the classes called
  levelPlaying.reload();
}


//where all the calling takes place
void draw() {
  //switch deals with the GAMEMODE so that Draw, which loops, can call
  //one thing at a time.
  switch(GAMEMODE) {
  case 0:
    startup();
    break;
  case 1:
    menu();
    break;
  case 2:
    instructions();
    break;
  case 3:
    credits();
    break;
  case 4:
    play();
    break;
  case 5:
    firstCutscene();
    skipIntro(545, 555);
    break;
  case 6:
    if (startTheGame == false) {
      currentTime = startTime = millis()/1000;
      startTheGame = true;
    }
    playGame();
    break;
  case 7:
    playGame();
    break;
  case 8:
    playGame();
    break;
  case 9:
    playGame();
    break;
  case 10:
    lastCutscene();
    break;
  case 11:
    credits();
    break;
  }
}

//lets us call each level more succinctly in the switch function
void playGame() {
  pushMatrix(); //this enables the camera movement
  translate(-cameraOffsetX, 0.0); //translates the camera movement
  cameraPosition();
  //maps the background so it scrolls slower than the camera
  backgroundCamera = map(cameraOffsetX, 0.0, 3100.0, 0.0, 2000.0);
  image(bg1, backgroundCamera, 0);
  //renders all the level and player stuff
  levelPlaying.render();
  player.input();
  player.move();
  player.draw();
  popMatrix(); //ends the translation
  //manages the score - if the player gathers another flower, add it to the score
  if (player.flowerPoints > oldScore) {
    score += addFlowerPoint;
    oldScore = player.flowerPoints;
  }
  currentTime = millis() / 1000; //turns milliseconds into seconds
  gameTime = currentTime - startTime;
  //shows the score
  textAlign(LEFT);
  outlinedText(""+score, 22.0, 30.0);
  interfaceButtons(20, 40);
}

//calls the key input code, code from Platformer example
void keyPressed(KeyEvent evt) {
  buttins.pressKey(evt.getKeyCode());
}
void keyReleased(KeyEvent evt) {
  buttins.releaseKey(evt.getKeyCode());
}

//ends all the music and noises when you close the window
void stop() {
  introMusic.close();
  bgMusic.close();
  jumpSound.close();
  slam.close();
  bgNoises.close();
  ding.close();

  minim.stop();

  super.stop();
}

