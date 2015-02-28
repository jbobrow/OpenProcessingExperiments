
int scene; // switch variable
int count; // counts how many games have been played, for tracking high score
int level; // counts level
int playerX; //reads player coordinates to track visit and achieved
int playerY; //reads player coordinates to track visit and achieved
int goalCount; // counts up goals
int movecount; // counts moves
int timer; // counts frames
int time; // counts seconds
int highTime; // best time
int highMove; // lowest move count
int highLevel; // level of lowest move count

// Controls
int w = 482; // width
int h = 480; // height
float s = 1.5; // scale
int frame = 90; // framecount
int goalMax = 10; // number of goals per level
int columns = 24; 
int rows = 22;
color alter = color (0, 175, 30); // object and text color

//Objects
//import ddf.minim.*;
//Minim minim;
//AudioSample sound1;
//AudioSample sound2;
//AudioSample sound3;
//AudioSample sound4;
//AudioSample sound5;
//AudioSample sound6;
Goal[] goal;
Goal g;
Cell[][] board;
Cell cell;
Player player;

void setup() {
  size(482, 480);
  noStroke();
//  minim = new Minim(this);
//  //load sound
//  sound1 = minim.loadSample("goal.mp3"); // goal sound
//  sound2 = minim.loadSample("level.mp3"); // level up sound
//  sound3 = minim.loadSample("move1.mp3"); // vertical move sound
//  sound4 = minim.loadSample("blocked.mp3"); // blocked sound
//  sound5 = minim.loadSample("lose.mp3"); // lose sound
//  sound6 = minim.loadSample("move2.mp3"); // horizontal move sounds
  smooth();
  PFont font;
  font = loadFont("Courier-18.vlw");
  textFont(font, 18);
  frameRate(frame);
  playerX = 10+10;
  playerY = 10+20;
  // Initialize objects:
  // instantiate all goals using an array
  goal = new Goal[goalMax];
  for (int k = 0; k < goalMax; k++) {
    goal[k] = new Goal();
  }
  // instantiate all cells using two arrays by column and row
  board = new Cell[columns][rows];
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Cell(i*20, 20+j*20, 20, false);
    }
  }
  //instantiate player
  player = new Player(playerX, playerY);
}

void draw() {
  background(0);
  switch(scene) {
  case 0 :
    String str = "Use the arrow keys to play. Be careful! There's no going back.";
    fill(alter);
    textAlign(CENTER, CENTER);
    text(str, 10, 10, 470, 470);
    level = 0;
    break;
  case 1 :
    // Level refresh. this is the beginning of the game loop.
    textAlign(LEFT);
    // background alternates based on level
    if (level%2 != 0) {
      background(255);
    }
    else {
      background (0);
    }
    // Record high score
    if (level == 1) {
      highMove = movecount;
      highLevel = 1;
    }
    else if (level > 1) {
      if (movecount < highMove) {
        highMove = movecount;
        highLevel = level;
      }
    }
    // Initialize level
    level++;
    player.x = 10+(20*(level-1));
    player.y = 30+(20*(level-1));
    playerX = player.x;
    playerY = player.y;
    player.column = level-1;
    player.row = level-1;
    goalCount = 0;
    movecount = 0;
    // Reset Goals
    for (int k = 0; k < goalMax; k++) {
      goal[k].reset();
    }

    // Reset Board
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j].visited = false;
      }
    }
    // Close the window by setting the border cells to visited
    for (int i = 0; i < columns; i++) { 
      for (int j = 0; j<level-1; j++) {  
        board[i][j].visited = true;
        board[i][rows-(j+1)].visited = true;
      }
    }
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j<level-1; j++) {
        board[j][i].visited = true;
        board[columns-(j+1)][i].visited = true;
      }
    }

    scene++;
    break;
  case 2 :
    // Game Screen
    // Environment
    if (level%2 != 0) {
      background(255);
    }
    else {
      background (0);
    }
    fill(alter);
    text("MOVES:  " + movecount, 10, 475);
    //    text("time: " + time, 10, 375);
    text("GOALS: " + goalCount + "/" + goalMax, 345, 475);
    text("PRESS SHIFT TO GIVE UP", 120, 16);
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j].trackVisited(playerX, playerY);
        board[i][j].display();
      }
    }  
    goal[goalCount].display();
    goal[goalCount].achievement();
    player.display();
    playerX = player.x;
    playerY = player.y;
    timer++;
    time = timer/frame;
    if (goal[goalCount].achieved == true) {
//      sound1.trigger();
      goalCount++;
//      println("goal:" + goalCount);
      if (goal[goalMax-1].achieved == true) {
//        sound2.trigger();
        scene = 1;
      }
    }
    break;
  case 3 :
    // End Screen
    background(0);
    fill(alter);
    text("Oops.", 30, 180); 
    text("It seems you didn't plan well enough.", 30, 200);
    //    text("Best time: " + highTime, 10, 215);
    text("Last score: " + movecount + ", Level " + level, 30, 220);
    if (highMove == 0) {
      text("Best score: N/A", 30, 240);
    }
    else {
      text("Best score: " + highMove + ", Level " + highLevel, 30, 240);
    }
    break;
  }
}

void keyPressed() {

  if (key == CODED) {
    if (scene == 2) {
      if (keyCode == UP && player.y>30) {
        if (board[player.column][player.row-1].visited != true) {
          //          sound3.trigger();
          player.up();
          movecount++;
        }
        else {
          //          sound4.trigger();
        }
      }
      else if (keyCode == DOWN && player.y<450) {
        if (board[player.column][player.row+1].visited != true) {
          //          sound3.trigger();      
          player.down();
          movecount++;
        }
        else {
          //          sound4.trigger();
        }
      }
      else if (keyCode == LEFT && player.x>10) {
        if (board[player.column-1][player.row].visited != true) {
//          sound6.trigger();
          player.left();
          movecount++;
        }
        else {
//          sound4.trigger();
        }
      }
      else if (keyCode == RIGHT && player.x<470) {
        if (board[player.column+1][player.row].visited != true) {
//          sound6.trigger();
          player.right();
          movecount++;
        }
        else {
//          sound4.trigger();
        }
      }
      else if (keyCode == SHIFT) {
        scene = 3;
//        sound5.trigger();
      }
    }
    else if (scene == 0) {
      background(255, 10, 100);
      scene = 1;
    }
    else if (scene == 3) {
      scene = 0;
    }
    else {
      scene = 0;
    }
  }
}

class Cell {  
  //ints to draw cell
  int x;
  int y;
  int s;
  //cell state
  boolean visited;

  Cell(int xPos, int yPos, int side, boolean cellState) {
    //initial state of Cell is visited = false
    x = xPos;
    y = yPos;
    s = side;
    visited = cellState;
    rectMode(CORNER);
    strokeWeight(2);
    fill(0);
    stroke(255);
  }

  // a means of setting visited to true
  void trackVisited(int playerX, int playerY) {
    if (playerX-10 == x && playerY-10 == y) {
      visited = true;
    }
  }

//  void reset() {
//  }
  void display() {
    if (level%2 != 0) {
      if (visited) {
        stroke(0);
        fill(255);
      }
      if (!visited) {
        stroke(255);
        fill(0);
      }
    }
    else {
      if (visited) {
        stroke(255);
        fill(0);
      }
      if (!visited) {
        stroke(0);
        fill(255);
      }
    }
    rect(x, y, s, s);
  }
}

class Goal {

  int goalXa;
  int goalYa;
  int goalXb;
  int goalYb;
  int goalXc;
  int goalYc;
  int goalSize = 16;
  boolean achieved;
  boolean achieveda;
  boolean achievedb;
  boolean achievedc;

  Goal() {
    goalXa = 10+20*(int)random(level, columns-level);
    goalYa = 10+20*(int)random(level, rows-level);
    goalXb = 10+20*(int)random(level, columns-level);
    goalYb = 10+20*(int)random(level, rows-level);
    goalXc = 10+20*(int)random(level, columns-level);
    goalYc = 10+20*(int)random(level, rows-level);
    achieved = false;
    achieveda = false;
    achievedb = false;
    achievedc = false;
  }

  void display() {
    smooth();
    noStroke();
    fill(alter);
    ellipse(goalXa, goalYa, goalSize, goalSize);
    ellipse(goalXb, goalYb, goalSize, goalSize);
    ellipse(goalXc, goalYc, goalSize, goalSize);
    if (achieved == false) {
      achieveda = false;
      achievedb = false;
      achievedc = false;
    }
  }

  void achievement() {
    if (achieved == false) {
      if (playerX == goalXa && playerY == goalYa) { 
        achieved = true;
        achieveda = true;
      }
      else if (playerX == goalXb && playerY == goalYb) {
        achieved = true;
        achievedb = true;
      }
      else if (playerX == goalXc && playerY == goalYc) {
        achieved = true;
        achievedc = true;
      }
      if (achieveda == true) {
        goalXb = -100;
        goalYb = -100;
        goalXc = -100;
        goalYc = -100;
      }
      else if (achievedb == true) {
        goalXa = -100;
        goalYa = -100;
        goalXc = -100;
        goalYc = -100;
      }
      else if (achievedc == true) {
        goalXb = -100;
        goalYb = -100;
        goalXa = -100;
        goalYa = -100;
      }
    }
  }

  void reset() {
    goalXa = 10+20*(int)random(level, columns-level);
    goalYa = 10+20*(int)random(level, rows-level);
    goalXb = 10+20*(int)random(level, columns-level);
    goalYb = 10+20*(int)random(level, rows-level);
    goalXc = 10+20*(int)random(level, columns-level);
    goalYc = 10+20*(int)random(level, rows-level);
    achieved = false;
  }
}

class Player {
  int x;
  int y;
  int column;
  int row;

  Player(int playerX, int playerY) {
    noStroke();
    x = playerX;
    y = playerY;
    
    // column and row track the location of the player 
    // and correspond to the column and row that call the cells from the array
    // which allows the player to check that a cell it is trying to move into
    // is open
    column = 0;
    row = 0;
  }

  void display() {
    // color switches by level
    if (level%2 != 0){
      fill(0);
    }
    else {
      fill(255);
    }
    ellipse (x, y, 16, 16);
  }

  void up() {
      y-=20;
      row--;
  }
  void down() {
      y+=20;
      row++;
  }
  void left() { 
      x-=20;
      column--;
  }
  void right() {
      x+=20;
      column++;
  }
}



