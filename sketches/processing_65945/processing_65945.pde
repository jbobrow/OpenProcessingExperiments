
//J3: Jenny Xu, Jenny Liu, Jolina Lam
//UCSC COSMOS 2012 
//Finished 8/2/12

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;//loading songs
AudioPlayer song;
AudioPlayer menuSong;
AudioPlayer ATTACK;
AudioPlayer defeat;
AudioPlayer teleport;
AudioPlayer winSong;
AudioPlayer bossSong;
AudioPlayer bossSong2;



int [] spiritsHave = new int[100];//array for spirits collected
int spiritNumber = 0;//how many you have
RoomArtist room = new RoomArtist();//draw the rooms
int level = 0;//level is zero
Person hero = new Person();//new hero 
boolean goRight = false;// go right boolean
boolean goLeft = false;//go left boolean
boolean faceRight = false;// go right boolean
boolean faceLeft = false;//go left boolean
boolean touchingBall = false;//if touching forcefield
boolean rectBall = false;//rectangle and ball collision
boolean spiritFollow = false;//if spirit follows  you
boolean bullet = false;//if bullet can be fired
boolean bulletFire = false;//if bullet can be fired
boolean spiritHit = false;//if bullet injures Spirit
boolean hitSpirit = false;//if Spirit HP is 0
boolean falling = false;//if player is falling
boolean changedY = false;//if can move spirit off stage
boolean tut1 = false;//tutorial booleans
boolean tut2 = false;
boolean tut3 = false;
boolean tut4 = false;
boolean tut5 = false;
boolean addedSpirit = false;//if can add spirit behind you
int spiritsGot = 0;//how many spirits you have
int lives = 3;//lives you have
boolean notPressing = false;//if not pressing a key
int time = 0;//time passed
float gonosHealth = 700;//health of Gonos
int deduction = 0;//deduction for dying during Gonos level

boolean level1 = false;//if completed level
boolean level1Start = false;//if completed level
boolean level2 = false;//if completed level
boolean level2Start = false;// if started level
boolean level3 = false;//if completed level
boolean level3Start = false;// if started level
boolean level4 = false;//if completed level
boolean level4Start = false;// if started level
boolean level5 = false;//if completed level
boolean level5Start = false;// if started level
boolean level6 = false;//if completed level
boolean level6Start = false;// if started level
boolean gameStart = false;//if pressed start button
boolean beginGame = false;//if the game has begun
boolean levelSelect = false;//if level select page
boolean loseScreen = false;//if lose screen 
boolean winScreen = false;//if win screen display
boolean fireGone = false;//if fire is gone on level 4
boolean bridgeUp = true;// if bridge is up or down on level 4


boolean touchingDoor = false;//if touching ending door
boolean init = false;
float ball_x, ball_y;
int heroW, heroH;
int damage;
boolean berryGet = false;
boolean obstacleGone = false;
boolean ultima1 = false;
boolean ultima1Got = false;
boolean ultima2 = false;
boolean ultima2Got = false;
boolean onPlatform = false;
int rooms = 1;
int spiritSize = 40;
int speed = 5;
int savetimer;
int berrys = 1;
int buttons = 1;
int bowls = 1;
int startingSpirit = 1;
int deadWay;

//for different modes
int mode = 0;
float boss1mode = 0;
float boss2mode = 0;
float boss2regen = 0;
float boss3mode = 0;
float boss3health = 0;


//button codes
int rectX = 0;      // Position of square button
int rectY;
int rectSize = 200;     // Diameter of rect
int rectHeight = 100;
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;
boolean rectOver2 = false;
boolean rectOver3 = false;
boolean rectOver4 = false;
boolean rectOver5 = false;
boolean creditsShow = false;
boolean storyShow = false;
boolean bonusHeart1 = false;
boolean bonusHeart2 = false;
boolean level4Boss = false;
boolean gotAx = false;
boolean axeUsed = false;
boolean youWon =  false;
boolean bridge = false;
boolean doorOpen = false;
boolean songPlay = false;
boolean song2Play = false;
boolean songPlays = false;
int moveX = 0;
int moveY = 490;


float bulletX, bulletY;//the bulletX and bulletY 
int platform = 1;//what platform player is on
int currentSpirit = 1;//what spirit you are currently fighting
int scaleAmount = 1;
int ultimaCollect= 0;//how many ultima you have

float x = 200;// x that is added to forcefield x
//float numberSpirits = 1;
Spirit spirit1 = new Spirit();//spirit1 is a spirit
Spirit spirit2 = new Spirit();//spirit2 is a spirit
Spirit spirit3 = new Spirit();//spirit3 is a spirit
Spirit boss1 = new Spirit();//spirit3 is a spirit
Spirit boss2 = new Spirit();//spirit3 is a spirit
Bullet bullet1 = new Bullet();//bullets
RectBall rectball = new RectBall();//new collision classes
RectRect rectrect = new RectRect();//rectange and rectange collision
Button startBut = new Button();
Button creditBut = new Button();
Button backBut = new Button();
Button quitBut = new Button();
Button storyBut = new Button();
PFont font;
PImage img;
PImage img2;
PImage hearts;
PImage unicat;
PImage unicats;
PImage level1s;
PImage strawberry;
PImage bear;
PImage rock;
PImage forest1;
PImage forest2;
PImage forest3;
PImage bulletPic;
PImage waterfall;
PImage waterfall2;
PImage waterfall3;
PImage ultimaUnicat;
PImage ultimaUnicat2;
PImage ultimaUnicatb;
int bgmove = -600;
float gonosX = 490;
float gonosY = 300;
boolean canMove = true;
boolean railGuards = false;
boolean button = false;


int numFrames = 3;  // The number of frames in the animation
int frame = 0;
PImage[] walk = new PImage[numFrames];
PImage[] walk2 = new PImage[numFrames];
int numFrames2 = 8;
int frame2 = 0;
PImage[] victory = new PImage[numFrames2];
PImage fall;
PImage fall2;
PImage attack;
PImage attack2;
PImage monster;
PImage endDoor;
PImage forcefield;
PImage bowl;
PImage lost;
PImage lost2;
PImage greenPortal;
PImage greenPortal2;
PImage cyanPortal;
PImage cyanPortal2;
PImage orangePortal;
PImage orangePortal2;
PImage pinkPortal;
PImage pinkPortal2;
PImage sidePortal;
PImage sidePortal2;
PImage side2Portal;
PImage side2Portal2;
PImage lever;
PImage sky;
PImage forest;
PImage sunset;
PImage levelselect;
PImage cave;
PImage fire;
PImage fire2;
PImage cave1;
PImage cave2;
PImage cave3;
PImage cave4;
PImage cave5;
PImage river;
PImage snake;
PImage snake2;
PImage snakeflip;
PImage mountain1;
PImage mountain2;
PImage mountain3;
PImage mountain4;
PImage mountain5;
PImage mountain6;
PImage evilForcefield;
PImage pickaxe;
PImage cracked;
PImage skybg1;
PImage skybg2;
PImage skybg3;
PImage skybg4;
PImage bossbg;
PImage bossGonos;
PImage bossGonos2;
PImage bossGonosf;
PImage bossGonos2f;
PImage youWin;



void setup()
{
  //frameRate(30);
  //frameRate(60);
  size (650, 500);
  minim = new Minim(this);
  song = minim.loadFile("SlippingIntoSilence.mp3");
  menuSong = minim.loadFile("nothing.mp3");
  ATTACK = minim.loadFile("Flame Arrow.mp3");
  defeat = minim.loadFile("sadSong.mp3");
  teleport = minim.loadFile("Shooting Star.mp3");
  winSong = minim.loadFile("SlippingIntoSilence.mp3");
  bossSong = minim.loadFile("bossSong.mp3");
  bossSong2 = minim.loadFile("bossSong.mp3");
  menuSong.loop();
  font = loadFont("Consolas-16.vlw");//load fonts
  img = loadImage("awakensign.png");// load awaken sign
  img2 = loadImage("story.png");// load awaken sign
  hearts = loadImage("heart.png");
  unicat = loadImage("unicats.png");
  unicats = loadImage("unicat3.png");
  level1s = loadImage("level1.png");
  strawberry = loadImage("Berry.png");
  bear = loadImage("Bear.png");
  rock = loadImage("Rock.png");
  forest1 = loadImage("Forest Room One.png");
  forest2 = loadImage("Forest Room Two.png");
  forest3 = loadImage("Forest Room Three.png");
  bulletPic = loadImage("Bullet2.png");
  waterfall = loadImage("waterfall.png");
  waterfall2 = loadImage("waterfall2.png");
  waterfall3 = loadImage("waterfall3.png");
  ultimaUnicat = loadImage("ultima1.png");
  ultimaUnicat2 = loadImage("ultima1s.png");
  ultimaUnicatb = loadImage("ultima1b.png");
  walk[0]  = loadImage("Sprite Walk 1.png");
  walk[1]  = loadImage("Sprite Walk 2.png");
  walk[2]  = loadImage("Sprite Walk 3.png");
  walk2[0]  = loadImage("Sprite Walk 1 Flip.png");
  walk2[1]  = loadImage("Sprite Walk 2 Flip.png");
  walk2[2]  = loadImage("Sprite Walk 3 Flip.png");
  victory[0]  = loadImage("Victory Dance 1T.png");
  victory[1]  = loadImage("Victory Dance 2T.png");
  victory[2]  = loadImage("Victory Dance 3T.png");
  victory[3]  = loadImage("Victory Dance 4T.png");
  victory[4]  = loadImage("Victory Dance 5T.png");
  victory[5]  = loadImage("Victory Dance 6T.png");
  victory[6]  = loadImage("Victory Dance 7T.png");
  victory[7]  = loadImage("Victory Dance 8T.png");
  
  fall  = loadImage("Sprite Fall.png");
  fall2 = loadImage("Sprite Fall Flip.png");
  attack  = loadImage("Sprite Attack.png");
  attack2  = loadImage("Sprite Attack Flip.png");
  monster = loadImage("Monster Edit.png");
  endDoor = loadImage("Door.png");
  forcefield = loadImage("Forcefield.png");
  bowl = loadImage("bowl.png");
  lost = loadImage("deadhelten.png");
  lost2 = loadImage("deadhelten2.png");
  greenPortal = loadImage("Green Portal.png");
  greenPortal2 = loadImage("Green Portal2.png");
  cyanPortal = loadImage("Cyan Portal.png");
  cyanPortal2 = loadImage("Cyan Portal2.png");
  orangePortal = loadImage("Orange Portal.png");
  orangePortal2 = loadImage("Orange Portal2.png");
  pinkPortal = loadImage("Pink Portal.png");
  pinkPortal2 = loadImage("Pink Portal2.png");
  lever = loadImage("lever.png");
  sky = loadImage("sky.png");
  forest = loadImage("forest.png");
  sunset = loadImage("sunset.png");
  levelselect = loadImage("levelselect.png");
  cave = loadImage("Cave Door.png");
  fire = loadImage("Fire1.png");
  fire2 = loadImage("Fire2.png");
  cave1 = loadImage("Cave Background 1.png");
  cave2 = loadImage("Cave Background 2.png");
  cave3 = loadImage("Cave Background 3.png");
  cave4 = loadImage("Cave Background 4.png");
  cave5 = loadImage("Cave Background 5.png");
  river = loadImage("river.png");
  snake = loadImage("ultima2snake.png");
  snake2 = loadImage("ultima2snake2.png");
  snakeflip = loadImage("ultima2snakeflip.png");
  mountain1 = loadImage("Mountain Background1.png");
  mountain2 = loadImage("Mountain Background2.png");
  mountain3 = loadImage("Mountain Background3.png");
  mountain4 = loadImage("Mountain Background4.png");
  mountain5 = loadImage("Mountain Background5.png");
  mountain6 = loadImage("Mountain Background6.png");
  evilForcefield = loadImage("Evil Forcefield.png");
  sidePortal = loadImage("Sideways portal.png");
  sidePortal2 = loadImage("Sideways portal2.png");
  side2Portal = loadImage("Sideways portal Down.png");
  side2Portal2 = loadImage("Sideways portal2 Down.png");
  pickaxe = loadImage("pickaxe.png");
  cracked = loadImage("cracked.png");
  skybg1 = loadImage("Sky Background 1.png");
  skybg2 = loadImage("Sky Background 2a.png");
  skybg3 = loadImage("Sky Background 3.png");
  skybg4 = loadImage("Sky Background.png");
  bossbg = loadImage("Final Boss Background.png");
  bossGonos = loadImage("gonos.png");
  bossGonos2 = loadImage("gonos2.png");
  bossGonosf = loadImage("gonosf.png");
  bossGonos2f = loadImage("gonos2f.png");
  youWin = loadImage("youwinscreen.png");
  // imageMode(CENTER);
  falling = false;
  faceRight = true;
}

void draw()
{
  if (lives <= 0 && level != 32) {
    loseScreen = true;
    deadWay = int(random(1, 3));
    gameStart = false;
    levelSelect = false;
    beginGame = false;
    lives = 3;
    song.pause();
    song.rewind();
    defeat.loop();
  }
  else if (lives <= 0 && level == 32) {
    loseScreen = true;
    deadWay = int(random(1, 3));
    gameStart = false;
    levelSelect = false;
    beginGame = false;
    lives = 3;
    song.pause();
    song.rewind();
    bossSong2.pause();
    bossSong2.rewind();
    defeat.loop();
  }
  if (winScreen) {
    background(youWin);
    //text("YOU WON!", 200, 300);
    fill(255,0,0);
    textFont(font, 30);
    if (frameCount%12 == 0) {
      frame2 = (frame2+1) % numFrames2;  // Use % to cycle through frames
    }
    imageMode(CENTER);
    image(victory[frame2], (120), (400), 140,140);
    imageMode(CORNER);
    text("" + spiritsGot, 290, 160);
    text("" + time, 280, 220);
    text("" + lives, 250, 280);
    int timeTook = 5000 - time;
    if(timeTook <= 0){
      timeTook = 0;
    }
    int finalscore = (lives * 1000) + timeTook + (spiritsGot * 100) - deduction;
    text("" + finalscore, 300, 310);
    if(youWon == false){
      song.pause();
      song.rewind();
      bossSong2.pause();
      bossSong2.rewind();
      winSong.loop();
      youWon = true;
    }
    
    if (mousePressed) {
      winSong.pause();
      winSong.rewind();
      bossSong2.pause();
      bossSong2.rewind();
      menuSong.loop();
      loseScreen = false;
      songPlay = false;
      song2Play = false;
      
         mode = 0;
        boss1mode = 0;
        boss2mode = 0;
        boss2regen = 0;
        boss3mode = 0;
        boss3health = 0;
        songPlays = false;
    moveX = 0;
     moveY = 490;

      platform = 1;//what platform player is on
      currentSpirit = 1;//what spirit you are currently fighting
      scaleAmount = 1;
      ultimaCollect= 0;//how many ultima you have
      touchingDoor = false;
      init = false;

      damage = 10;
      berryGet = false;
      creditsShow = false;
      winScreen = false;

      obstacleGone = false;
      ultima1 = false;
      ultima1Got = false;
      rooms = 1;
      spiritSize = 50;
      level = 1;
      level1 = false;//if completed level
      level1Start = false;//if completed level
      level2 = false;//if completed level
      level2Start = false;// if started level
      level3 = false;//if completed level
      level3Start = false;// if started level
      level4 = false;//if completed level
      level4Start = false;// if started level
      level5 = false;//if completed level
      level5Start = false;// if started level
      level6 = false;//if completed level
      level6Start = false;// if started level
      goRight = false;// go right boolean
      goLeft = false;//go left boolean
      faceRight = false;// go right boolean
      faceLeft = false;//go left boolean
      touchingBall = false;//if touching forcefield
      rectBall = false;//rectangle and ball collision
      spiritFollow = false;//if spirit follows  you
      bullet = false;//if bullet can be fired
      bulletFire = false;//if bullet can be fired
      spiritHit = false;//if bullet injures Spirit
      hitSpirit = false;//if Spirit HP is 0
      falling = false;//if player is falling
      berryGet = false;
      obstacleGone = false;
      gotAx = false;
      ultima1 = false;
      ultima1Got = false;
      
      rooms = 1;
      spiritSize = 40;
      changedY = false;
      tut1 = false;
      tut2 = false;
      tut3 = false;
      tut4 = false;
      tut5 = false;
      addedSpirit = false;
      onPlatform = false;
      bridgeUp = true;
       bridge = false;
       button = false;
       doorOpen = false;
      spiritsGot = 0;
      heroW = 32;
      heroH = 54;
      lives = 3;
      berrys = 1;
      buttons = 1;
      
      bowls = 1;

      bullet1.bulletDist = 0;
      bullet1.bulletSpeed = 10;
      startingSpirit = 1;
      time = 0;
      fireGone = false;
      doorShow = false;
      bonusHeart1 = false;
      bonusHeart2 = false;
      level4Boss = false;
      axeUsed = false;
      int bgmove = -600;
      gonosHealth = 700;
      deduction = 0;
      gonosX = 490;
      gonosY = 300;
      canMove = true;
      railGuards = false;
      
    }
  }

if (loseScreen) {
  background(0);

  if (deadWay == 1) {
    image(lost, 0, 0);
  } 
  else {
    image(lost2, 0, 0);
  }
  fill(255, 0, 0);
  textFont(font, 35);
  text("" + spiritsGot, 330, 363);
  text("" + time, 300, 405);
  fill(255);
  if (mousePressed && level != 32) {
    
    loseScreen = false;

    platform = 1;//what platform player is on
    currentSpirit = 1;//what spirit you are currently fighting
    scaleAmount = 1;
    ultimaCollect= 0;//how many ultima you have
    touchingDoor = false;
    init = false;
    songPlay = false;
      song2Play = false;
      songPlays = false;
    moveX = 0;
     moveY = 490;

    damage = 10;
    berryGet = false;
    creditsShow = false;
    winScreen = false;
    deduction = 0;
    obstacleGone = false;
    ultima1 = false;
    ultima1Got = false;
    rooms = 1;
    spiritSize = 50;
    bridge = false;
    button = false;
    level = 1;
    level1 = false;//if completed level
    level1Start = false;//if completed level
    level2 = false;//if completed level
    level2Start = false;// if started level
    level3 = false;//if completed level
    level3Start = false;// if started level
    level4 = false;//if completed level
    level4Start = false;// if started level
    level5 = false;//if completed level
    level5Start = false;// if started level
    level6 = false;//if completed level
    level6Start = false;// if started level
    goRight = false;// go right boolean
    goLeft = false;//go left boolean
    faceRight = false;// go right boolean
    faceLeft = false;//go left boolean
    touchingBall = false;//if touching forcefield
    rectBall = false;//rectangle and ball collision
    spiritFollow = false;//if spirit follows  you
    bullet = false;//if bullet can be fired
    bulletFire = false;//if bullet can be fired
    spiritHit = false;//if bullet injures Spirit
    hitSpirit = false;//if Spirit HP is 0
    falling = false;//if player is falling
    berryGet = false;
    obstacleGone = false;
    gotAx = false;
    ultima1 = false;
    ultima1Got = false;
    rooms = 1;
    spiritSize = 40;
    changedY = false;
    tut1 = false;
    tut2 = false;
    tut3 = false;
    tut4 = false;
    tut5 = false;
    addedSpirit = false;
    onPlatform = false;
    bridgeUp = true;
    doorOpen = false;
    spiritsGot = 0;
    
             mode = 0;
        boss1mode = 0;
        boss2mode = 0;
        boss2regen = 0;
        boss3mode = 0;
        boss3health = 0;
    heroW = 32;
    heroH = 54;
    lives = 3;
    berrys = 1;
    buttons = 1;
    bowls = 1;
    bullet1.bulletDist = 0;
    bullet1.bulletSpeed = 10;
    startingSpirit = 1;
    time = 0;
    fireGone = false;
    doorShow = false;
    bonusHeart1 = false;
    bonusHeart2 = false;
    level4Boss = false;
    axeUsed = false;
    int bgmove = -600;
    gonosHealth = 700;
    gonosX = 490;
    gonosY = 300;
    canMove = true;
    railGuards = false;
    defeat.pause();
    defeat.rewind();
    menuSong.loop();
  }
  if (mousePressed && level == 32) {
    
    if (beginGame == false) {
      
     
       gonosHealth = boss3health;
       deduction += 100;
       songPlay = false;
      song2Play = false;
      println("gonos :  " + gonosHealth);
      songPlays = false;
    moveX = 0;
     moveY = 490;
    level6Start = true;
    level = 32;
    lives = 4 - mode;
     
    damage = 10;
    defeat.pause();
    defeat.rewind();
    bossSong2.loop();
  
    init = false;
    falling = false;
    //ball_x = 350;
    // heroH = 30;
    //heroW = 20;
    ball_x = 100;
    ball_y = 10;
    // ball_y = 410;
    beginGame = true;
  }
  setupLevels();
    loseScreen = false;

    damage = 10;
    creditsShow = false;
    winScreen = false;
    gameStart = true;
    beginGame = true;
    
    spiritFollow = false;//if spirit follows  you
    bullet = false;//if bullet can be fired
    bulletFire = false;//if bullet can be fired
    spiritHit = false;//if bullet injures Spirit
    hitSpirit = false;//if Spirit HP is 0
    falling = false;//if player is falling
 
    addedSpirit = false;
    onPlatform = false;
    
    bullet1.bulletDist = 0;
    bullet1.bulletSpeed = 10;
    startingSpirit = 3;
    //level = 33;
    canMove = true;
    railGuards = false;
  }
}

//println(lives);
if (gameStart == false) {
  if (creditsShow == false && loseScreen == false && winScreen == false) {
    background(0);
    image(sky, 0, -50);
    image(img, 120, 20);
    ball_x += 1;//right character
    if (frameCount%8 == 0) {
      frame = (frame+1) % numFrames;  // Use % to cycle through frames
    }
    if (frame != 1) {
      image(walk[frame], (ball_x), (260), 64, 108);
    } 
    else if (frame == 1) {
      image(walk[1], ball_x, 260, 48, 108);
    }

    if (ball_x > 660) {
      ball_x = -50;
    }
    beginGame = false;
    fill(255);
    startButton();
    creditsButton();
    quitButton();
    storyButton();
  }
} 

else if (gameStart) {
  levelSelect = true;
  creditsShow = false;
  background(levelselect);
  // fill(255);

  //text("Level Select! \n Press 1 for easy mode, \n 2 for normal mode, \n and 3 for hardcore mode.", 50,50);
}        
//println(ball_y);
if (levelSelect && keyPressed && key == '3') {
  if (beginGame == false) {
    level1Start = true;
    youWon = false;
    level = 1;
    lives = 1;
     mode = 3;
     boss1mode = 4.8;
     boss2mode = 4.6;
     boss2regen = 2.2;
     boss3mode = 195;
     boss3health = 800;
     gonosHealth = boss3health;
    
    
    ball_x = 10;
    ball_y = 410;
    beginGame = true;
    menuSong.pause();
    song.loop();
  }
  setupLevels();
}
if (levelSelect && keyPressed && key == '2') {
  if (beginGame == false) {
    level1Start = true;
    youWon = false;
    level = 1;
    lives = 3;
    //damage = 30;
    ball_x = 10;
    ball_y = 410;
     mode = 2;
     boss1mode = 4.6;
     boss2mode = 4.5;
      boss2regen = 1.8;
     boss3mode = 180;
     boss3health = 700;
     gonosHealth = boss3health;
    beginGame = true;
    menuSong.pause();
    song.loop();
  }
  setupLevels();
}
if (levelSelect && keyPressed && key == '1') {
  if (beginGame == false) {
    level1Start = true;
    youWon = false;
    level = 1;
    lives = 3;
     mode = 1;
     boss1mode = 3.9;
     boss2mode = 3;
      boss2regen = 1.2;
     boss3mode = 165;
     boss3health = 600;
     gonosHealth = boss3health;
    ball_x = 10;
    ball_y = 410;
    beginGame = true;
    menuSong.pause();
    song.loop();
  }
  setupLevels();
}
if (beginGame) {
  setupLevels();
}
if (creditsShow) {
  background(forest);
  if (frameCount%15 == 0) {
    scaleAmount = int(random(5) + 45);
  }
  textFont(font, scaleAmount);

  fill(255);
  text("\t Credits \n Team J3: \n Jenny Liu \n Jenny Xu \n Jolina Lam", 50, 100);
  textFont(font,30);
  text("\t Music Credits \n Newgrounds.com \n SoundBible.com", 320, 100);
  backButton();
}
if (storyShow) {
  creditsShow = false;
  background(sunset);

  textFont(font, 55);
  fill(255);
  text("\t Story: ", 170, 50);
  image(img2, 110, 40);
  backButton();
}
}
void setupLevels() {
  room.create(level);
  hero.movement();

  hero.colliding();
  level = hero.nextRoom(level);
  hero.fixFalling();
  hero.falling();
  hero.monsterCollision();
  if (bullet) {
    bullet1.draw();// draw bullet when SPACE key is pressed

    //bullet1.bulletSpeed = 10;
  }
  stroke(255);
  fill(55, 182, 233);
  rect(546, 5, 100, 20);
  fill(255);

  //savetimer = millis();
  text("Time: " + time, 550, 20);
  if (frameCount%60 == 0) {
    time += 1;
  }
  hero.show();
  switch(lives) {
  case 1:
    image(hearts, ball_x, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    break;
  case 2:
    image(hearts, ball_x - 10, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 30, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    break;
  case 3:
    image(hearts, ball_x - 20, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 10, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 40, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    break;
  case 4:
    image(hearts, ball_x - 35, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x - 5, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 25, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 55, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    break;
   case 5:
    image(hearts, ball_x - 50, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x - 20, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 10, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 40, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    image(hearts, ball_x + 70, ball_y - 30, heroW/2 + 5, heroW/2 + 5);
    break; 
  }
}
void startButton() {
  startBut.draw();
  startBut.button = 1;
  startBut.update(mouseX, mouseY);
}
void creditsButton() {
  creditBut.draw();
  creditBut.button = 2;
  creditBut.update(mouseX, mouseY);
}
void backButton() {
  backBut.draw();
  backBut.button = 3;
  backBut.update(mouseX, mouseY);
}
void quitButton() {
  quitBut.draw();
  quitBut.button = 4;
  quitBut.update(mouseX, mouseY);
}
void storyButton() {
  storyBut.draw();
  storyBut.button = 5;
  storyBut.update(mouseX, mouseY);
}
void mousePressed()
{

  if (rectOver) {
    gameStart = true;
    rectOver2 = false;
    rectOver3 = false;
    strokeWeight(1);
    // println("GASL");
  }
  if (rectOver2) {
    creditsShow = true;
    rectOver = false;
    rectOver3 = false;
    strokeWeight(1);

    // println("GASL");
  }
  if (rectOver3) {

    rectOver2 = false;
    rectOver = false;
    strokeWeight(1);
    creditsShow = false;
    storyShow =false;

    // println("GASL");
  }
  if (rectOver4) {

    exit();

    // println("GASL");
  }
  if (rectOver5) {
    creditsShow = false;
    storyShow = true;
    rectOver3 = false;
    strokeWeight(1);
  }
}



void keyPressed() {

  if (key == CODED) {
    if (keyCode == RIGHT) {
      notPressing = false;
      //if you press right key then go right
      if (bulletFire == false) {//if bullet isn't firing
        goRight = true;
        faceRight= true;//face right
        faceLeft =false;//don't face left
      }
    } 
    else if (keyCode == LEFT) {//if left key pressed
      if (bulletFire == false) {
        notPressing = false;
        goLeft = true;//goLeft and face left
        faceLeft = true;
        faceRight=  false;
      }
    } 
    if (level == 1) {
      if (keyCode == UP && (rectball.rectBall(ball_x, ball_y, heroW, heroH, 600, 420, 70))) {
        teleport.play();
        teleport.rewind();
        platform = 2;//if you are on the first platform and you press UP
        ball_x = 50;//move to platform2
        ball_y = 240;
        tut4 = true;
        delay(100);
      }
      else if (keyCode == UP && (rectball.rectBall(ball_x, ball_y, heroW, heroH, 50, 260, 70))) {

        teleport.play();
        teleport.rewind();
        platform = 1;//if on platform 2 and touch portal move to platform1
        ball_x = 600;
        ball_y = 410;
        tut4 = true;
        delay(100);
      } 
      else if (keyCode == UP && (rectball.rectBall(ball_x, ball_y, heroW, heroH, 520, 260, 70))) {
        teleport.play();
        teleport.rewind();
        platform = 3;//if on platform 2 and touch portal move to platform3
        ball_x = 570;
        ball_y = 90;
        tut4 = true;
        delay(100);
      } 
      else if (keyCode == UP && (rectball.rectBall(ball_x, ball_y, heroW, heroH, 600, 80, 70))) {
        teleport.play();
        teleport.rewind();
        platform = 2;//if on platform 3 and touch portal move to platform2
        ball_x = 500;
        ball_y = 240;
        tut4 = true;
        delay(100);
      } 
      else if (keyCode == UP && (rectrect.rectCollide(int(ball_x), int(ball_y), heroW, heroH, 250, 10, 70, 100))) {

        touchingDoor = true;
      }
    }
  }

  if (bulletFire == true && bullet == true) {
    if (key == ' ') {
      bullet = false;//bullet disappears
      // println("FALSE");
    }
  }
}


void keyReleased() {
  notPressing = true;
  if (key == CODED) {
    if (keyCode == RIGHT) {
      goRight = false;
    } 
    else if (keyCode == LEFT) {
      goLeft = false;

      // image(walk2[1],(ball_x), (ball_y), heroW, heroH);
    }
  }
  if (bulletFire == false && bullet == false) {
    if (key == ' ') {
      ATTACK.play();
      ATTACK.rewind();

      bullet1.x = 30;//initializing first bullet
      bullet1.y = 20;
      bullet = true;//shoots bullet
      tut1 = true;

      //println("BUTTTTT");
    }
  }
  if (level2Start == false) {
    if (keyCode == UP && (rectrect.rectCollide(int(ball_x), int(ball_y), heroW, heroH, 250, 10, 70, 100))) {

      touchingDoor = false;
    }
  }
}

void stop()
{
  song.close();
  winSong.close();
  bossSong.close();
  
  bossSong2.close();
  ATTACK.close();
  teleport.close();
  defeat.close();
  minim.stop();
  super.stop();
}


