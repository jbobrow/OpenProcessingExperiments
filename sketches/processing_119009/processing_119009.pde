
//Ash King 300252037

/**
 *RunTime takes user input and updates the system
 */

import java.util.HashSet;
float sizeX = 700;
float sizeY = 700;

boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;

CloseBrace c;
OpenBrace o;
ArrowX arrowX; //the arrows that move left and right
ArrowY arrowY; //the arrows that move up and down

System system;

boolean gameOn = false;
int end = 0; //0=not over | 1=won  |2=lost

//booleans for the different screens
boolean startScreen = true;
boolean exception = false;
boolean tutorial = false;
int tutScreen = 0;//the current tutorial frame
int numFrames = 2;//number of tutorial frames

//Screen PImages
PImage start;
PImage except;
PImage won;
PImage lost;
PImage tut0;
PImage tut1;
PImage tut2;

//Bug PImages
PImage runtime;
PImage nullpointer;
PImage memory;
PImage classcast;
PFont font; 

void setup() {
  size(700, 800);
  background(0);
  smooth();
  system = new System();
  arrowX = new ArrowX(sizeX/2, sizeY);
  arrowY = new ArrowY(sizeY/2, sizeX);
  rectMode(CORNERS);
  font = loadFont("CourierNewPS-BoldMT-48.vlw");
  textFont(font);
  //initialise PImages
  start = loadImage("start.png");
  except= loadImage("except.png");
  won= loadImage("won.png");
  lost= loadImage("lost.png");
  tut0= loadImage("tut0.png");
  tut1= loadImage("tut1.png");
  tut2= loadImage("tut2.png");

  runtime= loadImage("RunTime.png");
  nullpointer= loadImage("NullPointer.png");
  memory=loadImage("OutOfMemory.png");
  classcast=loadImage("ClassCast.png");
}

void draw() {
  if (gameOn) {
    drawGame();
  }
  else {
    if (startScreen) {
      drawStart();
    }
    else if (tutorial) {
      drawTut();
    }
    else if (exception) {
      drawExcep();
    }
    else if (end!=0) {
      drawEnd();
    }
  }
}

//==============================================================================
//   VARIOUS DRAW METHODS
//==============================================================================

void drawGame() {
  background(0);
  //draw the background
  //draw the nodes
  //draw the bugs
  if (frameCount%3==0)system.updateSystem();
  system.drawSystem();
  //draw the upgrades
  //draw the braces
  if (o!=null) {
    noFill();
    strokeWeight(5);
    stroke(200);
    rect(o.x, o.y, arrowX.x, arrowY.y);
    o.drawBrace();
  }
  if (c!=null)c.drawBrace();

  //draw the arrows
  arrowX.drawArrow();
  arrowY.drawArrow();

  rectMode(CORNERS);
  //draw the console
  fill(150);
  rect(0, 700, 700, 800);
  fill(30);
  rect(0, 710, 700, 800);
  fill(255);
  textSize(25);
  text("CONSOLE:", 5, 730);
  text(system.console, 15, 770);

  //move code
  if (up)arrowY.moveUp();
  if (down) arrowY.moveDown();
  if (left)arrowX.moveLeft();
  if (right)arrowX.moveRight();
}

void drawTut() {
  switch(tutScreen) {
  case 0: 
    background(tut0);
    break; 
  case 1: 
    background(tut1);
    break;
  case 2: 
    background(tut2);
    break;
  }
}

void drawStart() {
  background(start);
}

void drawEnd() {
  if (end == 1) {
    background(won);
    textSize(30);
    text(system.getScore(), 280, 260);
  }
  else if (end==2) {
    background(lost);
    textSize(30);
    text(system.getScore(), 280, 260);
  }
}

void drawExcep() {
  background(except);
}

//==============================================================================
//    USER INPUT METHODS
//==============================================================================

void keyPressed() {
  if (gameOn) {
    if (key == ' ') {
      if (o==null) {
        o = new OpenBrace(arrowX.x, arrowY.y);
      }
      else {
        c = new CloseBrace(arrowX.x, arrowY.y);
        system.checkTrap(o.close(c));
        o = null;
        c = null;
      }
    }
    else if (key==CODED) {
      if (keyCode== UP) {
        up = true;
      }
      else if (keyCode == DOWN) {
        down = true;
      }
      if (keyCode == LEFT) {
        left = true;
      }
      else if (keyCode == RIGHT) {
        right = true;
      }
    }
  }
  else if (tutorial) {
    if (key == ' ') {
      if (tutScreen<numFrames) {
        tutScreen++;
      }
      else {
        tutorial = false;
        tutScreen = 0; 
        startScreen = true;
      }
    }
  }
  else if (exception) {
    if (key == ' ') {
      exception = false;
      startScreen = true;
    }
  }
  else if (end!=0) {
    if (key==' ') {
      end=0;
      startScreen = true;
      system = new System();
      arrowX.x = 350;
      arrowY.y = 350;
    }
  }
}

void keyReleased() {
  if (key==CODED) {
    if (keyCode== UP) {
      up = false;
    }
    else if (keyCode == DOWN) {
      down = false;
    }
    if (keyCode == LEFT) {
      left = false;
    }
    else if (keyCode == RIGHT) {
      right = false;
    }
  }
}

void mousePressed() {
  //the only time mouse input is listened to is selecting options on the start screen
  if (startScreen) {
    if (mouseY>270&&mouseY<390) {
      startScreen = false;
      gameOn = true;
    }
    else if (mouseY>450&&mouseY<565) {
      startScreen = false;
      tutorial = true;
      tutScreen = 0;
    }
    else if (mouseY>625&&mouseY<745) {
      startScreen = false;
      exception = true;
    }
  }
}

//Ash King 300252037
interface Arrow {

  void drawArrow();
}

//Ash King 300252037
/**
 *The Arrows that move left and right. These arrows face down and up
 */

class ArrowX implements Arrow {

  float x;
  float ht;
  PImage top;
  PImage bottom;

  ArrowX(float x, float ht) {
    this.x = x;
    this.ht =ht;
  }

  void moveLeft() {
    if (this.x-5>0)this.x -=5;
  }
  void moveRight() {
    if (this.x+5<700)this.x +=5;
  }

  void drawArrow() {
    fill(255, 0, 0);
    noStroke();
    triangle(x, 40, x-20, 0, x+20, 0);
    triangle(x, ht-40, x-20, ht, x+20, ht);
  }
}

//Ash King 300252037
/**
 *The arrows that move up and down (These arrows face right and left)
 *                              >       <
 */

class ArrowY implements Arrow {
  float y;
  float wd;
  PImage left;
  PImage right;
  ArrowY(float y, float wd) {
    this.y = y;
    this.wd = wd;
  }

  void moveUp() {
    if (this.y-5>0)this.y -=5;
  }
  void moveDown() {
    if (this.y+5<700)this.y +=5;
  }

  void drawArrow() {
    fill(255, 0, 0);
    noStroke();

    triangle(40, y, 0, y-20, 0, y+20);
    triangle(wd-40, y, wd, y-20, wd, y+20);
  }
}

//Ash King 300252037
interface Brace {
  void drawBrace();
}

//Ash King 300252037
/**
 *ClassCast exceptions are thrown when the system tries to debug an area with more than one kind of exception in it
 */

class ClassCast extends Exception {
  ClassCast(float x, float y) {
   this.xPos = x;
   this.yPos = y;
   this.wd = 30;
    dir = (int)random(0, 3);
    turnCount = 60;
  }

  void drawBug() {

    fill(20, 200, 180);
   // ellipse(xPos, yPos, 25, 25);
    image(classcast, xPos-wd,yPos-wd);
    if (turnCount ==0) {
      this.turn();
      turnCount = reset;
    }
    turnCount--;
  }
}

//Ash King 300252037
class CloseBrace implements Brace {
  float x;
  float y;

  CloseBrace(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void drawBrace() {
    fill(255);
    noStroke();
    ellipse(x, y, 10, 10);
  }
}

//Ash King 300252037
/**
 *The aim of the game is to get all 80 of the CodeBits to compile
 */

class CodeBit {
  float x, y;
  boolean compiled;
  CodeBit(float x, float y) {
    this.x=x;
    this.y=y;
    this.compiled  = false;
  }

  void drawCode() {
    rectMode(CENTER);
    fill(50, 150, 50, 150);
    rect(x, y, 70, 30);
    rectMode(CORNERS);
  }

  //returns true if given point is on this CodeBit
  boolean on(float x1, float y1) {
    if (x1>this.x-40&&x1<this.x+40&&y1>this.y-20&&y1<this.y+20) {
      return true;
    }
    else { 
      return false;
    }
  }
}

//Ash King 300252037
abstract class Exception {
  float xPos, yPos, wd;
  int reset = 300;
  int turnCount = 300;

  //0-left,
  //1-up
  //2-right
  //3-down
  int dir;

  boolean dead =false;

  void walk() {
    switch(dir) {
    case 0: 
      if (xPos-2<50)turn();
      else xPos-=2;
      break;
    case 1:
      if (yPos-2<50)turn(); 
      else yPos-=2;
      break;
    case 2: 
      if (xPos+2>600)turn();
      else xPos+=2;
      break;
    case 3: 
      if (yPos+2>600)turn();
      else yPos+=2;
      break;
    }
  }

  void drawBug() {
  }

  void turn() {
    dir = (int)random(0, 3);
  }

  void dead() {
    dead = true;
  }
}

//Ash King 300252037
/**
 *Null Pointer exceptions are thrown when you attempt to debug an area that has no bugs in it
 */

class NullPointer extends Exception {

  NullPointer(float x, float y) {
    xPos = x;
    yPos = y;
    wd = 20;
    dir = (int)random(0, 3);
    turnCount = 120;
  }

  void drawBug() {

    fill(100);
    //  ellipse(xPos, yPos, 15, 15);
    image(nullpointer, xPos-wd, yPos-wd);
    if (turnCount ==0) {
      this.turn();
      turnCount = reset;
    }
    turnCount--;
  }
}

//Ash King 300252037
class OpenBrace implements Brace {
  float x;
  float y;
  OpenBrace(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void drawBrace() {
    fill(255);
    noStroke();
    ellipse(x, y, 10, 10);
  }

  Trap close(CloseBrace c) {
    rectMode(CORNERS);
    return new Trap(x, y, c.x, c.y);
  }
}

//Ash King 300252037
/**
 *OutOfMemory exceptions are thrown when you try and debug too many exceptions at once
 */
class OutOfMemory extends Exception {

  OutOfMemory(float x, float y) {
    this.xPos =x;
    this.yPos = y;
    this.wd = 30;
    dir = (int)random(0, 3);
    turnCount = 300;
  }

  void drawBug() {

    if (dead)fill(0);
    else fill(180, 30, 200);
    //ellipse(xPos, yPos, 50, 50);
    image(memory, xPos-wd, yPos-wd);
    if (turnCount ==0) {
      this.turn();
      turnCount = reset;
    }
    turnCount--;
  }
}

//Ash King 300252037
/**
 *Runtime Exceptions are thrown during the running of the game
 */
class RunTimeX extends Exception {
  //constructor
  RunTimeX(float x, float y) {
    this.xPos = x;
    this.yPos = y;
    this.wd = 15;
    dir = (int)random(0, 3);
    turnCount = 240;
  }

  void drawBug() {

    if (dead)fill(0);
    else fill(30, 100, 200);
    // ellipse(xPos, yPos, 30, 30);
    image(runtime, xPos-wd, yPos-wd);
    if (turnCount ==0) {
      this.turn();
      turnCount = reset;
    }
    turnCount--;
  }
}

//Ash King 300252037
/**
 *Throws, updates and draws the exceptions
 *Compiles the CodeBits
 */

class System {
  String console;
  ArrayList<Exception> bugs;

  ArrayList<CodeBit> bits;
  int doneBits = 0;
  float totalArea=0;
  float totalBugs = 0;

  int reset = 400;
  int runCount = 400; //countdown to create new bug
  int codeCount = 60; //countdown to compile new CodeBit

  System() {
    bugs = new ArrayList<Exception>();
    bits = new ArrayList<CodeBit>();
    bugs.add(new RunTimeX(400, 400));
    console = "System ONLINE";
    loadBits();
  }

  void updateSystem() {
    for (Exception e: bugs) {
      e.walk();
    }
    for (Exception e: bugs) {
      for (CodeBit c: bits) {
        if (c.compiled) {
          if (c.on(e.xPos, e.yPos)) {
            c.compiled=false;
            doneBits--;
          }
        }
      }
    }
    boolean allCompiled=true;
    for (CodeBit c: bits) {
      if (!c.compiled) {
        allCompiled = false;
        break;
      }
    }
    if (allCompiled) {
      gameOn=false;
      end=1;
    }
    if (doneBits==0||bugs.size()>15) {
      gameOn=false;
      end=2;
    }
  }

  void drawSystem() {
    for (CodeBit c: bits) {
      if (c.compiled)c.drawCode();
    }
    for (Exception e: bugs) {
      e.drawBug();
    }
    if (runCount==0) {
      //check bugs size
      bugs.add(new RunTimeX(random(50, 650), random(50, 650)));
      console = "THROW new RunTimeException line: "+arrowY.y+";";
      reset-=4;
      runCount=reset;
    }
    if (codeCount ==0) {
      boolean done = false;
      while (!done) {
        int check = (int)random(0, bits.size());
        if (bits.get(check).compiled==false) {
          bits.get(check).compiled=true;
          done=true;
          doneBits++;
        }
      }
      codeCount=60;
    }

    runCount--;
    codeCount--;
  }

  void loadBits() {
    for (int i = 0; i<9;++i) {
      for (int j = 0; j<11;++j) {
        bits.add(new CodeBit(35+i*90, 30+j*70));
      }
    }
    bits.get(0).compiled=true;
    doneBits=1;
  }

  void checkTrap(Trap t) {
    ArrayList<Exception> newBugs = new ArrayList<Exception>();
    ArrayList<Exception> deadBugs = new ArrayList<Exception>();
    int bugCount = 0;
    for (Exception e: bugs) {
      if (t.in(e.xPos, e.yPos)) {
        e.dead = true;
        deadBugs.add(e);
        bugCount++;
        totalBugs++;
      }
      else {
        newBugs.add(e);
      }
    }
    //check for different bugs!
    HashSet<Integer> check = new HashSet<Integer>();
    for (Exception e: deadBugs) {
      if (e instanceof RunTimeX)check.add(0);
      else if (e instanceof OutOfMemory)check.add(1);
      else if (e instanceof NullPointer)check.add(2);
      else if (e instanceof ClassCast)check.add(3);
    }
    //this is to prevent concurrentModification exceptions when removing 'dead' bugs
    //check bugs size
    bugs = newBugs;
    if (bugCount>3||t.trapSize()>40000) {
      bugs.add(new OutOfMemory(random(50, 650), random(50, 650)));
      console = "THROW new OutOfMemoryException line: "+arrowY.y+";";
    }
    if (bugCount==0) {
      bugs.add(new NullPointer(random(50, 650), random(50, 650)));
      console = "THROW new NullPointerException line: "+arrowY.y+";";
    }
    if (check.size()>1) {
      bugs.add(new ClassCast(random(50, 650), random(50, 650)));
      console = "THROW new ClassCastException line: "+arrowY.y+";";
    }
    totalArea+=t.trapSize();
  }

 String getScore() {
    if (totalArea==0||totalBugs==0)return "0";
    return nf((totalBugs/totalArea)*10000000, 5, 3); 
}
}

//Ash King 300252037
class Trap {
  float x1, y1, x2, y2;
  Trap(float x1, float y1, float x2, float y2) {
    this.x1= min(x1, x2);
    this.y1= min(y1, y2);
    this.x2= max(x1, x2);
    this.y2= max(y1, y2);
  }

  boolean in(float x, float y) {
    if (x>x1&&x<x2&&y>y1&&y<y2) {
      return true;
    }
    else {
      return false;
    }
  }

  float trapSize() {
    float wd = x2-x1;
    float ht = y2-y1;
    return wd*ht;
  }
}



