
/**
 @author Chris Ying and Iyal Suresh
 */

import ddf.minim.*;
import java.awt.geom.Point2D;

static final int WIDTH = 500;
static final int HEIGHT = 500;
boolean DEBUG = false;
short state;
//Road Stats
final static float ROAD_LENGTH = 0.9;
final static float ROAD_DENSITY = 0.15;
final static float PERCENT_ROAD = 0.3;
final static int BLOCKS_PER_SCREEN = 4;
static int blockScale = WIDTH/BLOCKS_PER_SCREEN;
//Population Stats
final int NUM_ZOMBIES = 50;
final int NUM_HUMANS = 200;
//Being stats
final float BEING_RADIUS = blockScale/12f;
final float BEING_OFFSET = 1.0*BEING_RADIUS/blockScale;
//Human stats
final float HUMAN_SPEED = 1.0;
//Zombie Stats
final float ZOMBIE_SPEED = 0.9;
//Player Stats
boolean isLeft, isRight, isUp, isDown, sprint;
final float PLAYER_SPEED = 1.0;
final float LIGHT_LENGTH = 230;
final float LIGHT_ANGLE = PI/16;
//Bar Stats
final int BAR_HEIGHT = 75;
float sprintBar;
float fearBar;
//Data Arrays
boolean[][] map = new boolean[100][100];
byte[][] buildingMap = new byte[100][100];
ArrayList<Point2D.Float> roadList = new ArrayList<Point2D.Float>();
int[] next = new int[2];
Being[] beings; 
Player player;
StatusBar bar;
int goalX, goalY, startX, startY;
Button[] menuButtons = new Button[3];
Button play, help, credits;
//Sounds
Minim minim;
AudioPlayer menuSound, gameSound, gameOver, gameWin;
//Fonts
PFont font;
//Images
PImage[] buildings = new PImage[6];
PImage[] buildingsk = new PImage[6];
PImage logo, i2, playerIMG, zombieIMG, humanIMG, roadIMG, roadIMGk, flashlight, brain, story;
PGraphics prebuffer;
//Game Stats
float distanceRan, sprintTime, fearless, ticker;
int cities;
final int difficultyScale = 30;
boolean konami, godMode;
String presses = "@@@@@@@@@@";

void setup() {
  ticker = 0;
  smooth();
  cursor(CROSS);
  randomSeed(System.nanoTime());
  if (cities==0) {
    size(500, 575);
    play = new Button(200, 350, 100, 30, " PLAY! ");
    help = new Button(200, 400, 100, 30, " HELP? ");
    credits = new Button(200, 450, 100, 30, "CREDIT");
    initMedia();
    menuButtons[0] = play;
    menuButtons[1] = help;
    menuButtons[2] = credits;
  }
  beings = new Being[NUM_ZOMBIES+cities*difficultyScale*3 + NUM_HUMANS];
  generateMap();
  createGoals();
  populate();
  state = 1;
  player = new Player(startX + 0.5, startY + 0.5);
  bar = new StatusBar();
  sprintBar = 1.0;
  fearBar = 0.0;
}


void draw() {
  //println(frameRate);

  if (konami) {
    ticker+=1/frameRate;
    //println("konami");
  }
  switch (state) {
  case 1:
    gameWin.pause();
    if (!menuSound.isPlaying())
      menuSound.loop();
    startScreen();
    for (Button b : menuButtons) {
      b.draw();
      if (mousePressed)
        b.checkButton();
    }
    break;
  case 2 :
    gameWin.pause();
    menuSound.pause();
    if (!gameSound.isPlaying())
      gameSound.loop();
    background(32);
    if (DEBUG) {
      background(255);
      drawMap2();
    }
    else {
      prebuffer.beginDraw();
      prebuffer.imageMode(CORNER);
      drawMap();
    }
    prebuffer.imageMode(CENTER);
    imageMode(CENTER);
    player.update();
    for (Being b:beings) {
      if (b != null)  {
      b.update(); 
      if (inScreen(b.getX(), b.getY()))
        b.draw();
      }
    }
    prebuffer.endDraw();
    if (!DEBUG)
      player.drawLight();
    eatHumans();
    bar.draw();
    if (fearBar >= 1.0)
      state = 4;
    if ((int)player.getX() == goalX && (int)player.getY() == goalY)
      state = 3;
    break;
  case 3 :
    gameSound.pause();
    gameWin.play();
    winScreen();
    break;
  case 4:
    gameSound.pause();
    gameOver.play();
    loseScreen();
    break;
  case 5:
    helpScreen();
    break;
  case 6:
    creditScreen();
    break;
  }
}

void initMedia() {
  logo = loadImage("asylumlogo.png");
  i2 = loadImage("i2.png");
  i2.resize(117, 84);
  roadIMG = loadImage("Road.png");
  roadIMG.resize(blockScale, blockScale);
  roadIMGk = loadImage("Roadk.png");
  roadIMGk.resize(blockScale, blockScale);
  playerIMG = loadImage("Player.png");
  playerIMG.resize((int)(blockScale/6f*(700/625.0)), (int)(blockScale/6f));
  zombieIMG = loadImage("Zombie.png");
  zombieIMG.resize((int)(blockScale/6f*(725/500.0)), (int)(blockScale/6f));
  humanIMG = loadImage("Human.png");
  humanIMG.resize((int)(blockScale/6f*(725/500.0)), (int)(blockScale/6f));
  flashlight = loadImage("flashlightMask.png");
  brain = loadImage("LoseBrain2.png");
  brain.resize(500, 0);
  story = loadImage("theStory.png");
  prebuffer = createGraphics(500, 500, P2D);
  prebuffer.smooth();
  for (int i = 1;i<=6;i++) {
    buildings[i-1] = loadImage("Building"+i+"l.png"); 
    buildings[i-1].resize(blockScale, blockScale);
    buildingsk[i-1] = loadImage("Building"+i+"k.png"); 
    buildingsk[i-1].resize(blockScale, blockScale);
  }
  minim = new Minim(this);
  font = loadFont("Chalkduster-64.vlw");
  menuSound = minim.loadFile("asylummenu.mp3");
  gameSound = minim.loadFile("asylumgame.mp3");
  gameOver = minim.loadFile("asylumlose.mp3");
  gameWin = minim.loadFile("asylumwin.mp3");
}

void drawMap() {
  prebuffer.stroke(20);
  prebuffer.fill(20);
  for (int row = (int)player.getY()-BLOCKS_PER_SCREEN; row < (int)player.getY()+BLOCKS_PER_SCREEN; row++) {
    for (int col = (int)player.getX()-BLOCKS_PER_SCREEN; col < (int)player.getX()+BLOCKS_PER_SCREEN; col++) {
      if (!konami) {
        if (row>=0&&row<map.length&&col>=0&&col<map[0].length&&!map[row][col]) {
          prebuffer.image(buildings[buildingMap[row][col]%6], WIDTH/2-(player.getX()-col)*blockScale, HEIGHT/2-(player.getY()-row)*blockScale);
        }
        else {
          prebuffer.image(roadIMG, WIDTH/2-(player.getX()-col)*blockScale, HEIGHT/2-(player.getY()-row)*blockScale);
        }
      }
      else {
        //roadIMGk.resize(0, (blockScale+30*sin(ticker)));
        //for (int i =0;i<6;i++) {
        //buildingsk[i].resize(0, (blockScale+30*sin(ticker)));
        //}
        prebuffer.pushMatrix();
        prebuffer.scale(1.0+.2*noise((2+fearBar)*ticker));
        if (row>=0&&row<map.length&&col>=0&&col<map[0].length&&!map[row][col]) {
          prebuffer.image(buildingsk[buildingMap[row][col]%6], WIDTH/2-(player.getX()-col)*blockScale, HEIGHT/2-(player.getY()-row)*blockScale);
        }
        else {
          prebuffer.image(roadIMGk, WIDTH/2-(player.getX()-col)*blockScale, HEIGHT/2-(player.getY()-row)*blockScale);
        }
        prebuffer.popMatrix();
      }
    }
  }
  prebuffer.fill(255, 100, 100, 80);
  prebuffer.rect(WIDTH/2-(player.getX()-startX)*blockScale, HEIGHT/2-(player.getY()-startY)*blockScale, blockScale, blockScale);
  prebuffer.fill(100, 255, 100, 80);
  prebuffer.rect(WIDTH/2-(player.getX()-goalX)*blockScale, HEIGHT/2-(player.getY()-goalY)*blockScale, blockScale, blockScale);
}

void drawMap2() {
  fill(200);
  for (int row = 0; row < map.length; row++) {
    for (int col = 0; col < map[0].length; col++) {
      if (!map[row][col]) {
        rect(col*(WIDTH/map[0].length), row*(HEIGHT/map.length), (WIDTH/map[0].length), (HEIGHT/map.length));
      }
    }
  }
  fill(255, 0, 0);
  rect(goalX*WIDTH/map[0].length, goalY*HEIGHT/map.length, (WIDTH/map[0].length), (HEIGHT/map.length));
}

void generateMap() {
  int temp=0;
  next[0] = map.length/2;
  next[1] = map[0].length/2;
  do {
    //Resets Array
    for (int row = 0; row < map.length; row++) {
      for (int col = 0; col < map[0].length; col++) {
        map[row][col]=false;
      }
    }
    roadList = new ArrayList<Point2D.Float>();
    next[0]=int(random(0, map.length));
    next[1]=int(random(0, map[0].length));
    makeRoad(next[0], next[1], (int)random(0, 4), true);
  } while (notBlack ());
  for (int row = 0; row < map.length; row++) {
    for (int col = 0; col < map[0].length; col++) {
      buildingMap[row][col] = (byte)random(1, 19);
    }
  }
}

void makeRoad(int row, int col, int direction, boolean split) {
  if (!map[row][col] && (row > 4 && row < map.length - 5 && col > 4 && col < map[0].length - 5)) {
    map[row][col] = true;
    roadList.add(new Point2D.Float(col, row));
    if (random(0, 1) < ROAD_LENGTH) {
      switch (direction) {
      case 0:
        makeRoad(row+1, col, 0, true);
        break;
      case 1:
        makeRoad(row, col+1, 1, true);
        break;
      case 2:
        makeRoad(row-1, col, 2, true);
        break;
      case 3:
        makeRoad(row, col-1, 3, true);
        break;
      default:
        println("aha!");
      }
    }
    if (split) {
      if (direction == 0 || direction == 2) {
        if (random(0, 1) < ROAD_DENSITY) {
          makeRoad(row, col + 1, 1, false);
        }

        if (random(0, 1) < ROAD_DENSITY) {
          makeRoad(row, col - 1, 3, false);
        }
      }
      if (direction == 1 || direction == 3) {
        if (random(0, 1) < ROAD_DENSITY) {
          makeRoad(row + 1, col, 0, false);
        }

        if (random(0, 1) < ROAD_DENSITY) {
          makeRoad(row - 1, col, 2, false);
        }
      }
    }
  }
}

void createGoals() {
  ArrayList<Point2D.Float> temp = (ArrayList<Point2D.Float>)roadList.clone();
  for (int i = temp.size()-1;i>=0;i--) {
    if (!(temp.get(i).x<map[0].length/10)) 
      temp.remove(i);
  }
  int index = (int)random(0, temp.size());
  startX = (int)temp.get(index).x;
  startY = (int)temp.get(index).y;

  temp = (ArrayList<Point2D.Float>)roadList.clone();
  for (int i = temp.size()-1;i>=0;i--) {
    if (!(temp.get(i).x>map[0].length*.9)) 
      temp.remove(i);
  }
  index = (int)random(0, temp.size());
  goalX = (int)temp.get(index).x;
  goalY = (int)temp.get(index).y;
}

void populate() {
  for (int i =0;i<NUM_ZOMBIES+difficultyScale*cities;i++) {
    int row;
    int col;
    do {
      int index = (int)random(0, roadList.size());
      row = (int)roadList.get(index).y;
      col = (int)roadList.get(index).x;
    }
    while (row == startY && col == startX);
    beings[i] = new Zombie(random(col+BEING_OFFSET, col+1-BEING_OFFSET), random(row+BEING_OFFSET, row+1-BEING_OFFSET));
  }

  for (int i =0;i<NUM_HUMANS+2*difficultyScale*cities;i++) {
    int index = (int)random(0, roadList.size());
    int row = (int)roadList.get(index).y;
    int col = (int)roadList.get(index).x;
    beings[i+NUM_ZOMBIES] = new Human(random(col+BEING_OFFSET, col+1-BEING_OFFSET), random(row+BEING_OFFSET, row+1-BEING_OFFSET));
  }
}

boolean notBlack() {
  int amount = (int)(map.length*map[0].length*PERCENT_ROAD);
  int count = 0;
  for (int row = 0; row < map.length; row++) {
    for (int col = 0; col < map[0].length; col++) {
      if (map[row][col])
        count++;
    }
  }
  return(count<amount);
}

void keyPressed() {

  if (keyCode == ESC)
    key = 0;

  switch (key) {
  case 'a' : 
  case 'A' :
    isLeft = true;
    break;
  case 'd' : 
  case 'D' :
    isRight = true;
    break;
  case 'w' : 
  case 'W' :
    isUp = true;
    break;
  case 's' : 
  case 'S' :
    isDown = true;
    break;
  case ' ' :
    if (state == 2)
      DEBUG = true;
    break;
  case CODED :
    if (keyCode == SHIFT)
      sprint = true;
    break;
  }
}

void keyReleased() {

  switch (key) {
  case 'a' : 
  case 'A':
    presses = presses+'a';
    isLeft = false;
    break;
  case 'd' : 
  case 'D':
    presses = presses + "@";
    isRight = false;
    break;
  case 'w' : 
  case 'W':
    presses = presses + "@";
    isUp = false;
    break;
  case 's' : 
  case 'S':
    presses = presses + "@";
    isDown = false;
    break;
  case 'b':
  case 'B':
    presses = presses + 'b';
    break;
  case ' ' :
    presses = presses + "@";
    if (state == 2 || state == 3)
      DEBUG = false;
    if (state == 3) {
      cities++;
      setup();
      state = 2;
    }
    if (state == 4) {
      setup();
      resetStats();
    }
    if (state == 5 || state == 6)
      state = 1;
    break;
  case CODED :
    if (keyCode == SHIFT) {
      presses = presses + "@";
      sprint = false;
    }
    if (keyCode  == UP)
      presses = presses + 'u';
    if (keyCode  == DOWN)
      presses = presses + 'd';
    if (keyCode  == LEFT)
      presses = presses + 'l';
    if (keyCode  == RIGHT)
      presses = presses + 'r';
    break;
  case 'g' :
  case 'G' :
    godMode = !godMode;
    presses = presses + '@'; 
    break;
  default: 
    presses = presses + "@";
  }
  presses = presses.substring(1);
  //println(presses);
  if (presses.equals("uuddlrlrba"))
    konami = true;
}

void startScreen() {
  background(80);
  image(logo, 120, 100);
  textFont(font, 18);
  text("by", WIDTH/2 - 60, HEIGHT/2 + 20);
  image(i2, 220, 220);
  fill(0);
  textFont(font, 24);
}

void helpScreen() {
  background(80);
  fill(200, 0, 0);
  textFont(font, 48);
  text("HELP", WIDTH/2 - 60, HEIGHT/2 - 150);
  fill(200);
  textFont(font, 18);
  text("[W][A][S][D] to move", WIDTH/2 - 110, HEIGHT/2 - 60);
  text("[SHIFT] to sprint", WIDTH/2 - 90, HEIGHT/2 - 30);
  text("[SPACE] for map", WIDTH/2 - 90, HEIGHT/2 - 0);
  text("[MOUSE] to move flashlight", WIDTH/2 - 135, HEIGHT/2 + 30);
  //text("Avoid zombies, follow the arrow", WIDTH/2 - 170, HEIGHT/2 + 140);
  image(story, 0, 325);

  fill(0);
  textFont(font, 24);
  text("Press [SPACE] to return to menu...", WIDTH/2 - 240, HEIGHT/2 + 280);
}

void creditScreen() {
  background(80);
  fill(200, 0, 0);
  textFont(font, 48);
  text("CREDITS", WIDTH/2 - 120, HEIGHT/2 - 150);
  fill(200);
  textFont(font, 18);
  text("Irrational2 Team", WIDTH/2 - 85, HEIGHT/2 - 60);
  text("Graphical Artist", WIDTH/2 - 80, HEIGHT/2);
  text("Audio Synthesizer", WIDTH/2 - 90, HEIGHT/2 + 45);
  text("External Attributions", WIDTH/2 - 105, HEIGHT/2 + 90);
  textFont(font, 12);
  text("Chris Ying", WIDTH/2 - 35, HEIGHT/2 - 45);
  text("Iyal Suresh", WIDTH/2 - 37, HEIGHT/2 - 30);
  text("Iyal Suresh", WIDTH/2 - 37, HEIGHT/2 + 15);
  text("Chris Ying", WIDTH/2 - 35, HEIGHT/2 + 60);
  text("acekasbo, clubsound, digifishmusic, ERH,", WIDTH/2 - 140, HEIGHT/2 + 105);
  text("jus, nicStage, roscoetoon from freesound.org", WIDTH/2 - 150, HEIGHT/2 + 120);
  text("\"La Battala\" by Dani Lucas", WIDTH/2 - 90, HEIGHT/2 + 135);
  fill(0);
  textFont(font, 24);
  text("Press [SPACE] to return to menu...", WIDTH/2 - 240, HEIGHT/2 + 280);
}

void winScreen() {
  background(80);
  textFont(font, 48);
  fill(200, 0, 0);
  text("YOU", WIDTH/2 - 60, HEIGHT/2 - 50);
  text("ESCAPED", WIDTH/2 - 115, HEIGHT/2);
  fill(0);
  textFont(font, 24);
  text("for now...", WIDTH/2 - 60, HEIGHT/2 + 110);
  text("Press [SPACE] to continue...", WIDTH/2 - 180, HEIGHT/2 + 280);
}

void loseScreen() {
  background(80);
  imageMode(CENTER);
  image(brain, WIDTH/2, HEIGHT/2+125);
  imageMode(CORNER);
  textFont(font, 56);
  fill(200, 0, 0);
  text("YOU HAVE", WIDTH/2 - 160, HEIGHT/2 - 80);
  text("DIED OF FEAR", WIDTH/2 - 230, HEIGHT/2 - 30);
  fill(200);
  textFont(font, 18);
  text("Cities Survived: " + cities, WIDTH/2 - 90, HEIGHT/2 + 50);
  text("Distance Traveled: " + (int)(distanceRan*10) + " meters", WIDTH/2 - 150, HEIGHT/2 + 100);
  text("Time Sprinted: " + (int)sprintTime + " seconds", WIDTH/2 - 120, HEIGHT/2 + 150);
  text("Fearless: " + (int)fearless + " seconds", WIDTH/2 - 100, HEIGHT/2 + 200);
  fill(0);
  textFont(font, 24);
  text("Press [SPACE] to retry...", WIDTH/2 - 150, HEIGHT/2 + 280);
}

boolean inScreen(float x, float y) {
  if (DEBUG)
    return true;
  return(dist(x, y, player.getX(), player.getY())<BLOCKS_PER_SCREEN);
}

void eatHumans() {
  for (int i = 0; i<beings.length;i++) {
    if (beings[i]==null)
      continue;
    Being one = beings[i];
    for (int j = i+1;j<beings.length;j++) {
      if (beings[j]==null)
        continue;
      Being two = beings[j];
      if (dist(one.getX(), one.getY(), two.getX(), two.getY())<BEING_OFFSET*2) {
        if (one instanceof Human && two instanceof Zombie) {
          beings[i] = new Zombie(one.getX(), one.getY());
        }
        else  if (two instanceof Human && one instanceof Zombie) {
          beings[j] = new Zombie(two.getX(), two.getY());
        }
      }
    }
  }
}

void resetStats() {
  distanceRan = 0;
  sprintTime = 0;
  fearless = 0;
  cities = 0;
}

