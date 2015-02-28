
//Final Project: 5-1-2013
//By Cynthia Gutierrez
float fps = 25;
PImage bg;
Fish myFish1;
Fish myFish2;
Coin myCoin1;
Coin myCoin2;
Coin myCoin3;
Coin myCoin4;
Coin myCoin5;
Coin myCoin6;
Coin myCoin7;
Coin myCoin8;
Coin myCoin9;
Coin myCoin10;
Coin myCoin11;
Coin myCoin12;
Coin myCoin13;
Coin myCoin14;
PImage heart1;
PImage heart2;
PImage heart3;
PImage heart4;
PImage heart5;
PImage heart6;
PImage heart7;
PShape extraLife;
PImage startMenuBG;
PImage missionComp;
PImage enviro2;
Trash myTrash1;
Player myPlayer;
SmallPlayer myPlayer2;
Gui myGui;
Enemy myEnemy1;
Enemy myEnemy2;
ScrollingBG myMovingBG;
PImage lock2;
PFont font;
PImage lvl1;
PImage lvl2;
PImage lvl3;
PImage lvl4;
PImage world3BG;
PImage world4BG;
color textColor = color(0);
color white = color(255);
//color black = color(0, 0, 0);
color yellow = color(255, 255, 0);
color darkYellow = color(255, 155, 5);//this is actually organge
int lives = 3;
PImage missionMapBG;
PImage instructBG;
PImage guiCoin;
void setup() {
  size(900, 660);
  frameRate(fps);
  smooth();
  myFish1 = new Fish("fishy", 1, 800, 40, 20, 0, 60, 0.0, 0.0, 60, 0.05, 8);
  myFish2 = new Fish("fisher", 1, 800, 40, 140, 20, 60, 0.0, 0.4, 60, 0.05, 7);
  myCoin1 = new Coin("goldcoin", 1, 360, 10, 5);
  myCoin2 = new Coin("goldcoin", 1, 400, 200, 7);

  myCoin3 = new Coin("goldcoin_lil", 1, 145, 400, 5);
  myCoin4 = new Coin("goldcoin_lil", 1, 170, 270, 7);
  myCoin5 = new Coin("goldcoin_lil", 1, 749, 167, 5);
  myCoin6 = new Coin("goldcoin_lil", 1, 580, 390, 7);
  myCoin7 = new Coin("goldcoin_lil", 1, 840, 583, 5);
  myCoin8 = new Coin("goldcoin_lil", 1, 437, 163, 7);

  myCoin9 = new Coin("goldcoin_lil", 1, 124, 380, 5);
  myCoin10 = new Coin("goldcoin_lil", 1, 116, 220, 7);
  myCoin11 = new Coin("goldcoin_lil", 1, 570, 297, 5);
  myCoin12 = new Coin("goldcoin_lil", 1, 535, 449, 7);
  myCoin13 = new Coin("goldcoin_lil", 1, 703, 570, 5);
  myCoin14 = new Coin("goldcoin_lil", 1, 720, 244, 7);

  myEnemy1 = new Enemy("baddy", 8, 100, 100, 5);
  myEnemy2 = new Enemy("baddy", 8, 120, 120, 7);
  heart1 = loadImage("healthBar0000.png");
  heart2 = loadImage("healthBar0001.png");
  heart3 = loadImage("healthBar0002.png");
  heart4 = loadImage("healthBar0003.png");
  heart5 = loadImage("healthBar0004.png");
  heart6 = loadImage("healthBar0005.png");
  heart7 = loadImage("healthBar0006.png");
  extraLife = loadShape("Girl_extraLife2.svg");
  myTrash1 = new Trash("can_plastic", 1, 400, 330, 6);
  myPlayer = new Player("newDolper", 12, 190, 200, 290, 200, 10);
  myPlayer2 = new SmallPlayer("newDolper", 12, 60, 600, 120, 83, 8);
  lock2 = loadImage("lock.png");
  missionMapBG = loadImage("EarthMissionControl.png");
  myGui = new Gui("Boopee-48.vlw", 40, 0, 0, 35, lives);//want our score and level to start at zero
  startMenuBG = loadImage("ChinChiStartMenu.png");
  instructBG = loadImage("instructionsmenu.jpg");
  enviro2 = loadImage("levels.png");
  guiCoin = loadImage("goldcoin_lil0000.png");
  lvl1 = loadImage("lvl1.png");
  lvl2 = loadImage("lvl2.png");
  lvl3 = loadImage("lvl3.png");
  lvl4 = loadImage("lvl4.png");
  myMovingBG = new ScrollingBG("newScrollBG", 1, 900, 0);
  missionComp = loadImage("missionComp.png");
  world3BG = loadImage("coralReefs4.jpg");
  world4BG = loadImage("coralReefs3_3.jpg");
}
void draw() {
  background(70);
  imageMode(CORNER);
  levels();
  println("X = " + mouseX + " , " + "Y = " + mouseY);
}

void levels() {
  if (myGui.level == 0) {
    image(startMenuBG, 0, 0);
    myGui.fontLoader();
    myGui.startMenu();
  }
  if (myGui.level == 1) {
    myMovingBG.display();
    myMovingBG.scroll();
    myFish1.bounce();
    myFish1.moving();
    myFish2.bounce();
    myFish2.moving();
    image(lvl1, 650, 20);
    myPlayer.display();
    myPlayer.keyEvents();
    myPlayer.collide();
    myPlayer.enemyCollision();
    myEnemy1.exist();
    myEnemy1.drift();
    myCoin1.exist();
    myCoin1.drift();
    myCoin2.exist();
    myCoin2.drift();
    //image,x,y,width,height
    shape(extraLife, 232, 10, 61, 50);
    myTrash1.exist();
    myTrash1.drift();
    myGui.score();
    myGui.coins();
    myGui.healthBar();
  }
  if (myGui.level == 2) {
    myGui.missionMap();
  }
  if (myGui.level == 3) {
    image(world3BG, 0, 0);
    //image,x,y,width,height
    shape(extraLife, 232, 10, 61, 50);
    image(lvl3, 650, 20);
    myPlayer2.checkPoint(myPlayer2.xpos + 10, myPlayer2.ypos + 20);
    myPlayer2.display();
    myPlayer2.collide();
    myCoin3.exist();
    myCoin4.exist();
    myCoin5.exist();
    myCoin6.exist();
    myCoin7.exist();
    myCoin8.exist();
    myGui.score();
    myGui.coins();
    myGui.healthBar();
  }
  if (myGui.level == 4) {
    image(world4BG, 0, 0);
    //image,x,y,width,height
    shape(extraLife, 232, 10, 61, 50);
    image(lvl4, 650, 20);
    myPlayer2.checkPoint(myPlayer2.xpos + 10, myPlayer2.ypos + 20);
    myPlayer2.display();
    myPlayer2.collide();
    myCoin9.exist();
    myCoin10.exist();
    myCoin11.exist();
    myCoin12.exist();
    myCoin13.exist();
    myCoin14.exist();
    myGui.score();
    myGui.coins();
    myGui.healthBar();
  }  
  if (myGui.level == 5) {
    image(missionComp, 0, 0);
    myGui.gameOver();
  }
  if (myGui.level == 6) {
    image(instructBG, 0, 0);
    myGui.instructions();
  }
  if (myGui.level == 7) {
    image(missionComp, 0, 0);
    myGui.gameOverWin();
  }
  if (myGui.level == 8) {

    myGui.missionMap();
    image(lock2, 504, 390);
  }
  //this is actually leveltwo
  if (myGui.level == 9) {
    myMovingBG.display();
    myMovingBG.scroll();
    myFish1.bounce();
    myFish1.moving();
    myFish2.bounce();
    myFish2.moving();
    image(lvl2, 650, 20);
    myPlayer.display();
    myPlayer.keyEvents();
    myPlayer.collide();
    myPlayer.enemyCollision();
    myEnemy1.exist();
    myEnemy1.drift();
    myEnemy2.exist();
    myEnemy2.drift();
    myCoin1.exist();
    myCoin1.drift();
    myCoin2.exist();
    myCoin2.drift();
    //image,x,y,width,height
    shape(extraLife, 232, 10, 61, 50);
    myTrash1.exist();
    myTrash1.drift();
    myGui.score();
    myGui.coins();
    myGui.healthBar();
  }
  if (myGui.level == 10) {
    image(missionComp, 0, 0);
    myGui.unlockedMission();
  }
}


