
 Created by: Judy Cheung
 Nov 20, 2012
 judy_cheung@sfu.ca 
 
 */

import ddf.minim.*;

Game g;
Menu m;
Sound s;
Minim minim;
int stage;

int w, h, dots;
//width of the screen
//height of the screen
//and max number of dots (like 6 x 5 as 6);

boolean mouseP;
//stage:
//0: menu
//1: game

void setup() {
  mouseP = false;
  w = 1000; //width of screen
  h = 700; //height of screen
  dots = 6; //5 x 6 dots

  size(w, h);
  m = new Menu(w, h);
  minim = new Minim(this);
  s = new Sound(minim);
  g = new Game(w, h, 2, dots, s);
  stage = 0;
}

void draw() { //drawing of the whole structure
  background(0);
  drawStage();
}

void drawStage() {  //drawing the stage
  switch(stage) {  //either the menu or the actual game
  case 0:
    m.draw();
    break;
  case 1:
    g.draw();
    break;
  }
}

void resetGame() { //reset and start the game  
  g.reset();
  g.startGame();
}

void stopGame() {  //reset and stop the game
  g.reset();
  g.stopGame();
}

void changeStage(int s) {   //stage changing between game and menu
  stage = s;
  switch(stage) {
  case 0:
    stopGame();
    break;
  case 1:
    resetGame();
    break;
  }
}

void checkMouse() {  //checking mouse on the stage when clicking the options
  switch(stage) {
  case 0:  //in menu

    //setting for 2 players in the menu, vs player
    if (mouseX > (w-250) && mouseY > (h-250) && mouseX < (w-50) && mouseY < (h - 200)) {
      changeStage(1); 
      g.setPlayers(2);
    }

    //setting for 1 player (vs AI)
    if (mouseX > (w-250) && mouseY > (h-250 + 51) && mouseX < (w-50) && mouseY < (h - 200 + 51)) {
      changeStage(1); 
      g.setPlayers(1);
    }
    break;
  case 1:

    if (!g.getSeq()) {

      //go back to menu
      if (mouseX > (w-(w / dots)) && mouseY > (h-(h/dots)) && mouseX < (w) && mouseY < (h)) {
        resetGame();
        changeStage(0);
      } 

      //reset the game
      if (mouseX > (0) && mouseY > (h-(h/dots)) && mouseX < (w/dots) && mouseY < (h)) {
        resetGame();
      }
    }
    break;
  }
}


void mousePressed() { //check for mouse click event

  checkMouse();
}

void  keyPressed () {  //reset function using key pressed

    println(key);
  switch(stage) {
  case 0:
    break;
  case 1:
    switch(key) {
    case 'r':
      resetGame();
      break;
    case 'e':
      resetGame();
      changeStage(0);
      break;
    }
    break;
  }
}


void stop() { //whole game stop

    s.close();
  super.stop();
}


class Block {  // declare backgrounds class Block
  int w, h;
  int gridNumber;
  int gridW;
  int gridH;
  int backgroundMatrix[][];
  int backgroundMatrixDirect[][];
  int backgroundMatrixSpeed[][];
  int backgroundCounter;
  int timer;
  int type;

  Block(int w, int h, int s, int kind, int timer) {
    this.w = w;
    this.h = h;
    this.gridNumber = s; //s as square is assigned to grid numaber
    this.gridW = w / s;
    this.gridH = h / s;

    this.type = kind;
    this.timer = timer;
    //0 = no change
    //1 = over time
    //2 = random over time

    backgroundMatrix = new int[s][s];// background information, array array s is square 1 and 2
    backgroundMatrixDirect = new int[s][s]; //array value of s (squares) to dim or increase color change
    backgroundMatrixSpeed = new int[s][s];   

    backgroundCounter = 0;
    randomBackground(); //random changing background grid
  } 

  void randomBackground() {
    //random all the values
    for (int i = 0; i < this.gridNumber; i++) {
      for (int j = 0; j < this.gridNumber; j++) {
        backgroundMatrix[i][j] = (int) random(30, 100); //random color changing between 30 and 100
        backgroundMatrixDirect[i][j] = (int) random(2);
        backgroundMatrixSpeed[i][j] = (int) random(1, 5);
      }
    }
  }


  void updateBackgroundMatrix(int i, int j) {
    //changing the color slightly through time
    if (backgroundMatrixDirect[i][j] == 0) {
      backgroundMatrix[i][j] += backgroundMatrixSpeed[i][j];
      if (backgroundMatrix[i][j] >= 245) {
        //checking if the color is over, decrease the lightness 
        backgroundMatrixDirect[i][j] = 1;
        backgroundMatrixSpeed[i][j] = (int) random(1, 5);
      }
    } 
    else {
      backgroundMatrix[i][j] -= backgroundMatrixSpeed[i][j];
      if (backgroundMatrix[i][j] <= 10) {
        //checking if the color is over, increase the lightness 
        backgroundMatrixDirect[i][j] = 0;
        backgroundMatrixSpeed[i][j] = (int) random(1, 5);
      }
    }
  }

  void updateBackgroundMatrix() {
    //update background
    for (int i = 0; i < this.gridNumber; i++) {
      for (int j = 0; j < this.gridNumber; j++) {
        updateBackgroundMatrix(i, j);
      }
    }
  }

  void drawBackground() {
    //draw background
    backgroundCounter++;
    for (int i = 0; i < this.gridNumber; i++) {
      for (int j = 0; j < this.gridNumber; j++) {
        noStroke();
        fill(backgroundMatrix[i][j]);
        rect(i * this.gridW, j * this.gridH, this.gridW, this.gridH);
        if (backgroundCounter > this.timer) {
          
          if (this.type == 1) {
            updateBackgroundMatrix();  //change lightness
           
          } 
          else if (this.type == 2) {
            randomBackground();
           
          }
          backgroundCounter = 0;
        }
      }
    }
  }


  void draw() {
    drawBackground();
  }
}


Field draws out the neutral dots and the paths of two players
 */
 
class Field extends Grid {  //inheriting Super Class object, Field 
 
  int gridValue[][];
  int c; //as color for neutral dots
  int cd; //increasing or decreasing of the adding to neutral dots and make it flash
  int p; //as player

  int colorTimer;

  color p1; //color for player 1 and 2
  color p2;

    Field(int s, int w, int h, color[] colorset) { //Initialize Overloading constructor 
    super(s, s, w, h); //Super to pass the argument of w and h
    gridValue = new int[s][s];
    c = 255;
    cd = 1;
    colorTimer = 0;

    p1 = colorset[0];
    p2 = colorset[1];

    reset();
  }

  void printAll() { //printAll to debug the Field grid
    //debug the grid
    println("Current Grid::");
    for (int j = 0; j < h; j++) {
      for (int i = 0; i < w; i++) {
        print(gridValue[i][j]);
      }
      println();
    }
    println();
  }

  void reset() {
    //reseting, setting all to 0
    //player 1 initial dots to 1
    //player 2 initial dots to 2
    //corner dots to 9
    //use 8 as unavailable

    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        gridValue[i][j] = 0;
        if (i % 2 == 1 && j % 2 == 0) {  //Use modulo to keep the parameter 
          gridValue[i][j] = 1;
        }
        if (i % 2 == 0 && j % 2 == 1) {
          gridValue[i][j] = 2;
        }
        if ((i == 0 && j == 0) || (i == 0 && j == (h-1)) || (i == (w-1) && j == (h-1)) || (i == (w - 1) && j == 0) ) {
          gridValue[i][j] = 9;
        }
      }
    }
  }

  void setValue(int i, int j, int p) {  //setting the grid value
    gridValue[i][j] = p;
  }

  int checkValue(int i, int j) {  //return to check the value
    return gridValue[i][j];
  }

  int[][] getAll() {  //returning all the grid value
  
    return gridValue;
  }

  void resetPlayer() { //reseting the last neutral dots to click 
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        if (gridValue[i][j] == 8) {
          gridValue[i][j] = 0;
        }
      }
    }
  }

  void setPlayer(int p) {  
   
    this.p = p;
    if (p == 1) {
      //player 1 will set the first column and last column to be unavailable
      for (int i = 0; i < h; i++) {
        if (gridValue[0][i] == 0) {
          gridValue[0][i] = 8;
        }
        if (gridValue[w-1][i] == 0) {
          gridValue[w-1][i] = 8;
        }
      }
    } 
    else {      
      //player 2 will set the first row and last row to be unavailable
      for (int i = 0; i < w; i++) {
        if (gridValue[i][0] == 0) {
          gridValue[i][0] = 8;
        }
        if (gridValue[i][h-1] == 0) {
          gridValue[i][h-1] = 8;
        }
      }
    }
  }


  int[] setMove(int x, int y, int player) {
    //set the move according to the mouse position for player
    int i = (x - (sw/2)) / (sw);
    int j = (y - (sh/2)) / (sh);
    //mouse position according to the grid

    int[] move = {
      i, j
    };
    this.setValue(i, j, player);
    //set the value of the position to player
    return move;
  }

  boolean checkGridMove(int i, int j, int player) { //checking the grid move is available or not
    println("pos: [" + i + ", " + j + "]");
    println("player: " + player);
    boolean v = validMove(i, j, player);
    return v;
  }

  boolean checkMove(int x, int y, int player) { //check the mouse move is available or not
    int i = (x - (sw/2)) / (sw);
    int j = (y - (sh/2)) / (sh);
    println("pos: [" + i + ", " + j + "]");
    println("player: " + player);
    boolean v = validMove(i, j, player);
    return v;
  }

  boolean validMove(int i, int j, int v) {  //check if the move is valid or not
    boolean result = false;
    if (i < w && j < h) {
      if (i != 0 && i != (w - 1)) {
        if (gridValue[i-1][j] == v && gridValue[i+1][j] == v) {//if previous and next row is same value, valid
          
          result = true;
        }
      }
      if (j != 0 && j != (h - 1)) {
        if (gridValue[i][j-1] == v && gridValue[i][j+1] == v) { //if previous and next column is same value, valid
        
          result = true;
        }
      }
      if (i == w || j == h || gridValue[i][j] != 0) { //if click on the last col and row that are outside 
       
        result = false; //or if occupied, not valid
      }
    }

    return result;
  }

  void changingColor() {  //flashing the color of the neutral dots according to time
  
    if (colorTimer ++ > 0) {
      colorTimer = 0;
      if (cd == 1) {
        c -= 20;
      } 
      else {
        c += 20;
      }
      if (c > 255) {
        c = 255;
        cd = 1;
      }
      if (c <= 100) {
        c = 100;
        cd = 0;
      }
    }
  }

  color getColor(int player) {  //get the color of player

    if (player == 1) {
      return p1;
    }
    else 
      if (player == 2) {
      return p2;
    } 
    else {
      return 0;
    }
  }

  void drawHorizontal(int i, int j, int v) {     //draw horizontal paths, if available
  
    if (i != 0 && i != (w - 1)) {
      if (gridValue[i-1][j] == v && gridValue[i+1][j] == v) {  //draw horizontal;
        
        int x1 = (i - 1) * sw;
        int y1 = (j) * sh;
        int x2 = (i + 1) * sw;
        int y2 = (j) * sh;

        stroke(getColor(v));  //get the color of player
       
        line(x1, y1, x2, y2);   //draw the line (path)
      
      }
    }
  }

  void drawVertical(int i, int j, int v) {  //draw vertical path, if available
   
    if (j != 0 && j != (h - 1)) {
      if (gridValue[i][j-1] == v && gridValue[i][j+1] == v) {    //draw vertical;
      
        int x1 = (i) * sw;
        int y1 = (j - 1) * sh;
        int x2 = (i) * sw;
        int y2 = (j + 1) * sh;

        stroke(getColor(v)); //get the color fo player
        
        line(x1, y1, x2, y2);   //draw the line (path)
      
      }
    }
  }

  void drawLine(int i, int j) {   //draw lines
   
    int value = gridValue[i][j];  //one of the either lines
    drawHorizontal(i, j, value);
    drawVertical(i, j, value);
  }

  void drawAbsoluteLine(int i, int j) {
    pushMatrix(); //Apply push matrix function
    translate(x, y); //Apply translate to transform
    drawLine(i, j);
    popMatrix();
  }

  void fillColor() {
    fill(c, c, c); //fill neutral dots color
    stroke(c, c, c);//stroke neutral dots color
    changingColor();
  }

  void fillShape(int i, int j) {
    //called from superclass's draw function
    if (gridValue[i][j] != 0) {
      //if value is not 0
      if (gridValue[i][j] == 1 || gridValue[i][j] == 2) {
        //if player 1 or 2, draw lines if it is valid
        drawLine(i, j);
      }
      return;
    }

    if ((i % 2 == 0 && j % 2 == 0) ||(i % 2 == 1 && j % 2 == 1)) {  //if neutral dots
      fill(c, c, c);  //fill white
      noStroke();
      ellipse((i * sw), (j * sh), 10, 10);   //draw the neutral dots (white)
     
    }
  }

  int checkAvailableMove() {  //checking available moves
   int availableMove = 0;
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        if (gridValue[i][j] == 0) {
          if ((i % 2 == 0 && j % 2 == 0) ||(i % 2 == 1 && j % 2 == 1)) {  //counting
           
            availableMove++;  //returning available move couting
          }
        }
      }
    }
   
    return availableMove;  //if there is any path available to draw, draw here
  }

  void draw() { //if there is anything need to draw, draw in here
    super.draw();
   
  }
  
  //Game is the whole structure of the game that links to all components 

class Game {
  int w, h;
  int gameCounter;
  int gridNumber;
  int gridW;
  int gridH;
  int player;
  int players;
  int[] score;
  int[] moves;
  int winner;
  int sequenceCount;
  int[][] movelist;
  Pos[][] moveSteps;  //list of every move the players made

  PrintWriter output; 
  int timer;

  int[] lastMove; //using the last move, the Robot will determine the next move


    boolean mousep; //mouse Press
  boolean over;  
  boolean ends;  //game over or not

  Sound sound;

  Grid fpg;  //initialize 1st player's dot
  Grid spg;   //initialize 2st player's dots


  Field wg;  //the field and the white grid dot

  Block bg; //background blocks, can do different color animation

  color r; //color red
  color b;   //color blue
  color black;  //black dot

  Game(int w, int h, int players, int s, Sound sound) {  //setting game using width, height players and dots
    this.gameCounter = 0;

    s = s * 2;  //Assign s *2 is the size of the game such as 3 *2 = 6
    this.w = w;
    this.h = h;
    this.players = players;
    this.gridNumber = s;
    this.gridW = w / s;
    this.gridH = h / s;
    this.score = new int[2];
    this.moves = new int[2];
    this.sound = sound;
    this.lastMove = new int[2];


    r = color (#8A0808); // two color for the players 
    b = color (#008000); 
    black = color(0, 0, 0); //background dots


    fpg = new FirstGrid(s/2 -1, s/2, this.gridW, this.gridH, black);  //black dots for 1st player
    spg = new SecondGrid(s/2, s/2 - 1, this.gridW, this.gridH, black);  //black dots for 2nd Player
    fpg.setXY(this.gridW, this.gridH);
    spg.setXY(this.gridW, this.gridH);  

    color[] colorset = new color[2];   //the red and blue dots as the default position
    colorset[0] = r;
    colorset[0] = r;
    colorset[1] = b;

    wg = new Field(s -1, this.gridW, this.gridH, colorset); //the color set that pass to the Field
    wg.setXY(this.gridW, this.gridH);

    bg = new Block(w, h, s, 2, 300); //reference background block
   
    reset();
  } 

  void setPlayers(int number) {  //set the number of players, 2: 2 players, 1: 1 player vs Robot
    players = number;
  }

  void reset() {  //reset game to initial values

    movelist = new int[2][0];
    moveSteps = new Pos[2][0];//move steps for 2 players
    score[0] = 0;
    score[1] = 0;
    over = false;

    player = 0;
    winner = 0;
    mousep = false;

    ends = false;
    wg.reset();
  }

 /* void setSample() {  //testing samples
    wg.setValue(3, 3, 2);  
    wg.setValue(2, 2, 1);
    wg.setValue(3, 1, 1);
  }*/

  void startGame() { //start the game, set the first player, player the sound
    this.gameCounter++;
    sound.close();
    wg.setPlayer(1); //click on white grid as player 1
    player = 1;
    sound.playBackground(); 
  }

  void stopGame() {  //stop the game, stop the sound

    reset();
    sound.close();
  }

  void drawGrid() {  //drawing all the grids, the black dots (player 1 and 2), strokes (paths) and neutral dots
    
    strokeWeight(2);
    wg.draw(); //draw white grid
    strokeWeight(1);
    fpg.draw();  //draw 1st player
    spg.draw(); //draw 2nd player
  }

  void drawBackground() {  //drawing backgrounds 
    bg.draw();
  }

  void changePlayer() {   //player changes

    if (player == 1) {
      player = 2;
    } 
    else {
      player = 1;
    }

    wg.resetPlayer();  //reset available move for the next player
    wg.setPlayer(player);
  }

  boolean checkMove(int x, int y) {  //checking if move is valid
    boolean result = wg.checkMove(x, y, player);

    if (result) {  //if the result is true, continue to play
      lastMove = wg.setMove(x, y, player); //
      Pos m = new Pos(lastMove[0], lastMove[1]); //reference position class and check for last move of poistion x and y
      moveSteps[player-1] = (Pos[])append(moveSteps[player-1], m); //add a new move to the last step
    }
    return result;
  }

  void printScore() {   //printing in the console
    println("Score: " + score[0] + " x " + score[1]);
  }

  void checkAvailableMove() {
    //check how many move left
    //if 0 move left, change to next player
    //if both players has no move left, end the game

      int a = wg.checkAvailableMove(); //when there are no more white flashing dots, game over
    println("player " + player + " available move: " + a);
    moves[player-1] = a;
    if (a == 0) {
      if (moves[0] == 0 && moves[1] == 0) {
        gameOver();
      } 
      else {
        changePlayer();
        checkAvailableMove();
        aiMove();  // if robot has avialable moves, just keep playing
      }
    }
  }

  float distTwo(int x1, int y1, int x2, int y2) {  // position of one position, x2 and y2 is the following position
    return sqrt(sq(x2-x1) + sq(y2-y1));  //return sq of x and y square root, the different of two points
  }

  void aiMove() {
    //if there is only 1 player and its AI's turn and still have move
    if (players == 1 && player == 2 && wg.checkAvailableMove() > 0) {  //checking the number of available robot moves

      println(lastMove); //do the following moves
      int[][] grid = wg.getAll();  //all the information of grids assigned to grid
      float minValue = 99999;
      float d; //distance of robot
      int tx = -1, ty = -1, tmp;  // set value to minus as temporary x and y position. 
      boolean result;
      
      for (int i = 0; i < (gridNumber - 1);i++) {
        for (int j = 0; j < (gridNumber - 1); j++) { 
         
          if (grid[i][j] == 0) {   //check the moves with player's last move  
            d = distTwo(lastMove[0], lastMove[1], i, j);  // calculate the distance between 2 points 


            if (d <= minValue || d == 2) {  //if the move is closer or at 2 (which is besides it)     

              result = wg.checkGridMove(i, j, player); // check if this move is valid
              if (d == minValue) {
                if (random(0, 2) < 1) {  //random to see whether it's time to give up or continue

                  result = false;
                }
              }

              if (d == 2 && minValue != 99999) {  //if a minimum value is assigned, and the distance is equal 2
                tmp = aiBlocker(i, j); //checking for potential block
                if (tmp == 1) { //robot block
                  result = true;
                } 
                else if (tmp == -1) { //robot does not want to block
                  result = false; //robot does not make the move, robot will move elsewhere
                }
              }

              if (result) {
                tx = i;
                ty = j;
                minValue = d;  //setting the move and the value to compare  
              }
            }
          }
        }
      }
      println("final: ");
      println("x: " + tx + ", y: " + ty);
      wg.setValue(tx, ty, player);  //move for AI

      Pos m = new Pos(tx, ty);  
      moveSteps[player-1] = (Pos[]) append(moveSteps[player-1], m); //add each move to the play list 
      movelist[player-1] = append(movelist[player-1], tx * gridW+ ty * gridH); //also record the move of Robot

      score[player-1]++;   //add 1 score to each move

      changePlayer();  //change player
      checkAvailableMove();  //and check available moves
    }
  }

  int aiBlocker(int i, int j) {  //initialize robot ai Blocker
    int result = 0;  //assigned 0 to interger result
    if (random(0, 3) < 1) {  //random to see if time to give up the move 

      result = -1;
    } 
    //Robot chekcing one of the four  positions with distance 2
    if (i == lastMove[0]) {  
      if (j > lastMove[1]) {
        if (wg.checkValue(i, j-1) != player) {  
          if (random(0, 5) < 2) { //use random to determine whether to give up or continue

            result = 1;
          }
        }
      } 
      else {
        if (wg.checkValue(i, j+1) != player) {
          if (random(0, 5) < 2) {  //use random to determine whether to give up or continue

            result = 1;
          }
        }
      }
    } 
    else if (j == lastMove[1]) {
      if (i > lastMove[0]) {
        if (wg.checkValue(i-1, j) != player) {
          if (random(0, 5) < 2) {

            result = 1;
          }
        }
      } 
      else {
        if (wg.checkValue(i+1, j) != player) {
          if (random(0, 5) < 2) {  //random to see whether to give up or move on
            
            result = 1;
          }
        }
      }
    }
    return result;
  }

  void playEndSequence() {  //replay sound that the player has heard
    if (score[1] > score[0]) {  
      s.playSequenceNote(movelist[1], 1);
    } 
    else {
      s.playSequenceNote(movelist[0], 0); //player 1
    }
  }

  void drawEndSequence() { //draw dark screen for end Sequence
    if (ends) {
      fill(0, 0, 0, 200); //transparent black
      noStroke();
      rect(0, 0, w, h);

      fpg.draw(); //draw 1st player
      spg.draw();  //draw 2nd player
      strokeWeight(2);
      int tempCount = sequenceCount;
      if (sequenceCount >= moveSteps[winner-1].length) {  //if sequence count is greater and equal to the length of moves
        tempCount = moveSteps[winner-1].length - 1;  // retrace the length of the all the move
      }
      for (int i = 0; i <= tempCount; i++) {   //if 0 is assigned to type interger  i, temp count is greater than and equal to i (0)
        Pos p = moveSteps[winner-1][i];
        wg.drawAbsoluteLine(p.getX(), p.getY());//Get values of all the  moves that are stored in Class position
      }
      strokeWeight(1);
      sequenceTimer();
    }
  }

  void sequenceTimer() {
    int currentTimer = millis();

    if ((currentTimer - timer) > 900) { //set timeframe for winning sequence 
      sequenceCount++;

      println("SEQUENCE_COUNT:" + sequenceCount);
      println("STEPS_TOTAL:" + moveSteps[winner-1].length);
      if (sequenceCount <= moveSteps[winner-1].length) {
        if (sequenceCount < moveSteps[winner-1].length) {
          sound.playNote(movelist[winner-1][sequenceCount], winner);
        }
        timer = millis();
      } 
      else {
        ends = false;
        over = true;
      }
    }
  }

  void gameOver() {
    //show score;
    //s.stopBackground();
    //s.close();
    //s.playSequence();
    //now just playing regular sequence
    //playEndSequence();

    if (score[1] > score[0]) {
      winner = 2;
    } 
    else {
      winner = 1;
    }
    sequenceCount = -1;
    ends = true;  //when game over is true;
    writeGame();
    timer = millis();
    //over = true;
  }

  void writeGame() {

    output = createWriter("game" + gameCounter + ".txt");
    output.println("Game " + gameCounter + ": ");
    String name1, name2;
    name1 = "Player 1";

    if (players == 2) {
      output.println("2 Players\n");
      name2 = "Player 2";
    } 
    else {
      output.println("Single Player\n");
      name2 = "Robot   ";
    }

    String w;
    if (score[1] > score[0]) {
      w = name2;
    } 
    else {
      w = name1;
    }

    int len = moveSteps[winner-1].length;
    output.println("Moves:\n");


    for (int i = 0; i < len; i++) {
      output.println("#" + i + ":");
      if (i < moveSteps[0].length) {
        output.println(name1 +"\t" + moveSteps[0][i].getX() +"\t" +  moveSteps[0][i].getY());
      } 
      if (i < moveSteps[1].length) {
        output.println(name2 +"\t" + moveSteps[1][i].getX() +"\t" +  moveSteps[1][i].getY());
      } 
      output.println();
    }

    output.println("Winners: ");
    output.println(w);   

    output.flush(); // Write the remaining data
    output.close(); // Finish the file
  }

  void checkMouseClick() {  //check the player's mouse click

      if (mousePressed) {
      if (!mousep && !ends && !over) {  //only the first press down will be count,

        mousep = true;
        println(mouseX + ", " + mouseY);


        if (checkMove(mouseX, mouseY)) {  //checking the valid move
          //if move has been made, play sound Tick();

          int note = mouseX + mouseY;
          sound.playNote(note, player); //play the note according to where is pressed

          movelist[player-1] = append(movelist[player-1], note);  //add the note value in

          score[player-1]++;  //add the scor

          printScore();   //for debuging, printing score


            changePlayer();
          checkAvailableMove();  //change player, check move and AI's turn
          aiMove();
        }
      }
    } 
    else {
      if (mousep) {
        mousep = false;
      }
    }
  }

  void drawScore() {  //drawing score on left top corner
    textSize(14);
    fill(r);
    text("Player 1: " + score[0], 20, 20);
    fill(b);
    //if only 1 player, the player 2 is computer
    if (players == 1) { 
      text("Robot: " + score[1], 20, 40);
    } 
    else {
      text("Player 2: " + score[1], 20, 40);  //drawing both player's score
    }
  }

  void drawOver() {  //drawing for game over score and winner
    if (over) {
      textAlign(CENTER);
      fill(0, 0, 0, 200);
      noStroke();
      rect(0, 0, w, h);
      textSize(32);
      fill(r);
      text("Player 1: " + score[0], w / 2, h / 2 - 80);
      fill(b);
      if (players == 1) {
        text("Robot: " + score[1], w / 2, h / 2 - 40);
      } 
      else {
        text("Player 2: " + score[1], w / 2, h / 2 - 40);
      }
      //drawing both player's score

      String t = "Player 1 WIN!";
      if (score[1] > score[0]) {
        if (players == 1) {
          t = "Robot WIN!";
        } 
        else {
          t = "Player 2 WIN!";
        }
      }

      textSize(48);   //drawing the winner
      fill(random(30, 200));  //use random to flash the winner's text
      text(t, w / 2, h / 2 + 40);
      textSize(12);
      textAlign(LEFT);
    }
  }

  void drawHelp() {  //drawing for keyboard reset and exit

    noStroke();
    textSize(12);
    fill (0); //fill  text box in black
    rect (w/2 - 200, 0, 400, 15);  //text location and size
    fill(255); //fill white text 
    textAlign(CENTER);
    text("click any center grid to start, press key to reset, press esc to exit", w/2, 12); //draw out text and its location
    textAlign(LEFT);
  }

  void drawExit() {   //draw reset and exit mouse click

    int s = gridNumber;
    fill(40);
    textSize(40);
    noStroke();
    rect(w - (w / s), h - (h / s), (w / s), (h / s));
    rect(0, h - (h / s), (w / s), (h / s));
    fill(255);
    text("E", w - (w / s) + 7, h - (h / s) + 30);
    text("R", 7, h - (h / s) + 30);
    textSize(14);
    strokeWeight(1);
  }

  void checkSong() {
    sound.checkTime();
  }

  boolean getOver() {
    return over;
  }

  boolean getSeq() {
    return ends;
  }

  void draw() {
    drawBackground();
    drawGrid();
    checkMouseClick();
    drawScore();
    drawOver();
    //drawHelp();
    drawExit();
    checkSong();


    drawEndSequence();
  }
}

}

Abstract class Grid is the dot display on the field;
 neutral white dots are in the Field
 */

abstract class Grid { // Initialize abstract class Grid
  Grid() {  // Grid function
  }

  int x, y; //Declare x and y 
  int w, h; //Declare w and h
  int sw, sh;

  Grid (int inputW, int inputH, int sizeW, int sizeH) { //Initialize Grid with value of width and height 
    this.w = inputW; //reference w 
    this.h = inputH; //reference h
    this.sw = sizeW;
    this.sh = sizeH;
  }

  abstract void fillColor();
  abstract void fillShape(int i, int j);

  void draw () { //overloading abstract method
    pushMatrix(); //Apply push matrix function
    translate(x, y); //Apply translate to transform
     
    fillColor();
    
     //Use for loop to incrementing red dots
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        fillShape(i, j);
      }
    }
    popMatrix(); // restore the coordinate system from prior transformation
  }

  int[] xy() {
    int[] xy = new int[2];
    xy[0] = this.x;
    xy[1] = this.y;
    return xy;
  }

  void xy(int x, int y) {  //Reference setXY with value of type integer x and y 
    this.x = x;
    this.y = y;
  }

  void setXY(int x, int y) { //Reference setXY with value of type integer x and y 
    this.x = x; //reference x  
    this.y = y;//refernce y
  }
}

class FirstGrid extends Grid { //Inheriting super class object FirstGrid 
  color c;   //the color will be the color for first player

  FirstGrid(int r, int b, int w, int h, color c) { //Initialize Overloading constructor
    super(r, b, w, h); //Super to pass the argument of w and h
    this.c = c;
  }

  void fillColor() { //fill and stroke color for  1st player dots
    stroke(c); 
    fill(c); 
  }

  void fillShape(int i, int j) {
    ellipse((i * sw * 2) + sw, j * sh * 2, 12, 12);
  }
}

class SecondGrid extends Grid {  //separating out the first and second player incase need to drawing it differently
  color c;   // the color for second player
 
  //inheriting Super Class object, SecondGrid 
  SecondGrid(int r, int b, int w, int h, color c) { //Initialize Overloading constructor 
    super(r, b, w, h); //Super to pass the argument of w and h
    this.c = c;
  }

  void fillColor() { //fill and stroke color dots for player2
    fill(c); 
    stroke(c);
  }


  void fillShape(int i, int j) {
  
    ellipse((i * sw * 2), (j * sh * 2) + sh, 12, 12); 
  }
}

class Menu {
  int w;
  int h;
  int sp; //scroll position;
  int ssp; //second scroll position;
  
  final int fixSp;
  final int fixSsp;
  
  String summary = "City of Light is based on the interactive game “Isomorphism” that engages two intersecting\n" +
    "paths in an exploration of urban navigation, spatial experience and state of being within the\n" + 
    "context of connection, disconnection, mobility and decision-making (staying/leaving).\n\n" +

    "In City of Light, players simultaneously draw their own paths while experiencing a spatial, \n" +
    "fragmented urban soundscape of traffic, cash register and rare natural sound. Players can either contemplate their next move or consider a \n" +
    "strategy to block the other player's path. The game is a broader experiment that explores \n" +
    "“place theories,” in which sounds, signals and interactivity may transpire transformative \n" +
    "effects to users.\n\n" +

    "Links to previously Isomorphism series: \n" +
    "http://www.youtube.com/watch?feature=player_embedded&v=WK-sposLfVw \n" +
    "http://221a.ca/isomorphism-convergence/ \n" +
    "http://www.youtube.com/watch?v=6i1FBItTYk4\n\n";


  String rules ="Game Rules: \n• Player draws a path as if navigating within a city grid, by clicking the flashing light\n" +
    "• Once the path is taken, another player cannot cross over\n" +
    "• Do not rush; contemplate on the spatial sound experience and wait for\n" +
    "the sound signal to complete before drawing another line.\n" +
    "• Player 1 and player 2 take alternating turns\n" +
    "• User has the options to be both players 1 and 2, or to interact with Robot\n" +
    "• When all the flashing lights are clicked, the winner is revealed by repeated\n" +
    "sequence of sounds, along the chosen paths.\n" +
    "• Click R to reset\n" +
    "• Click E to exit\n";

  Menu(int w, int h) {
    this.w = w;
    this.h = h;
    this.fixSp = 250;
    this.fixSsp = this.fixSp + 700;
    this.sp = this.fixSp;
    this.ssp = this.fixSsp;
  }

  void drawRules() { //drawing the screens
    
    textAlign(LEFT);
   // rect(45, sp - 15, 650, 700);
    fill(255);
    text(summary + rules, 45, sp);
    text(summary + rules, 45, ssp);
    //println(sp + "/" + this.fixSp);
    //println(ssp + "/" + this.fixSsp);
    moveRules();
  }

  void moveRules() {
    
    sp -= 2;
    ssp -= 2;
    if(sp < -450) {
     sp = this.fixSsp; 
    }
    if(ssp < -450) {
     ssp = this.fixSsp; 
    }
  }
  
  void drawCover() {  //drawing the screens
   
    fill(0);
    noStroke();
    rect(0, 0, w, 200);
    rect(0, 0, 45, h);
    rect(695, 0, w - 695, h);
    rect(0, 500, w, 200);
    
  }

  void drawScreen() {   //drawing the screens 
    fill(0, 0, 0, 200);
    noStroke();
    rect(0, 0, w, h);
  }
  
  void drawText() {
    textAlign(LEFT);
    textSize(64);
    fill(255);
    text("City of Light", 70, 90);

    fill(255);
    textSize(36);
    rect(w - 250, h - 250, 180, 50);
    rect(w - 250, h -250 + 51, 180, 50);

    fill(0);
    text("vs. Player", w - 250 + 5, h - 250 + 30);
    text("vs. Robot", w - 250 + 5, h - 250 + 30 + 50);
    textSize(14);
  }

  void draw() {
    drawScreen();
    drawRules();
    drawCover();
    drawText();
  }
}

class Pos {
  int x;
  int y;
  Pos(int x, int y) {
    this.x = x;
    this.y = y;
  } 
  void setXY(int x, int y) {
  }

  void setX(int x) {
    this.x = x;
  }

  void setY(int y) {
    this.y = y;
  }

  int getX() {
    return this.x;
  }

  int getY() {
    return this.y;
  }
  
  String toString() {
    return this.x + ", " + this.y; 
  }
}

class Sound {
  Minim minim ;
  AudioSnippet player;
  AudioSnippet bgplayer;
  AudioOutput out;
  String[] files;
  String[] files1;
  String[] files2;


  boolean playn; //playing notes
  boolean plays; //playing sequence
  boolean playns; //playing note sequence
  int timeCounter;
  int timeMax;

  int counter;

  int[] sequenceList;

  int winner;

  Sound(Minim minim) {
    this.minim = minim;
    counter = 0;
    winner = 0;

    out = minim.getLineOut();

    files = new String[3];
    files[0] = "carHorn.wav";
    files[1] = "percolating.wav";
    files[2] = "Running.wav";

    files1 = new String[9];
    files1[0] = "nightingale.wav";
    files1[1] = "trainWhistle.wav";
    files1[2] = "fogHorn.wav";
    files1[3] = "alarm.wav";
    files1[4] = "ParkCity.wav";
    files1[5] = "Engine.wav";
    files1[6] = "robot.wav";
    files1[7] = "seagull.wav";
    files1[8] = "crashAir.wav";


    files2 = new String[8];
    files2[0] = "Accents.wav";
    files2[1] = "Clonk.wav";
    files2[2] = "zen-gong.wav";
    files2[3] = "Cash.wav";
    files2[4] = "Cricket.wav";
    files2[5] = "register.wav";
    files2[6] = "Coin2.wav";
    files2[7] = "Clink.wav";
    
    
    playn = false;
    plays = false;
    playns = false;
    timeCounter = 0;
    timeMax = 0;
  }

  void checkTime() {
    checkNote();
    //checkSequence();
    //checkNext();
  }

  void checkNote() {
    int currentMillis = millis();
    if (playn) {
      if ((currentMillis - timeCounter) > timeMax) {
        player.close();
        playn = false;
      }
    }
  }

  void playNote(int note, int p) {
    int fileLength, song;
    String soundToPlay;
    println(p);
    //p = 0;
    switch(p) {
    case 1:
      fileLength = files1.length;
      song = note % fileLength;
      soundToPlay = files1[song]; // get a background sound file
      break;
    case 2:
      fileLength = files2.length;
      song = note % fileLength;
      soundToPlay = files2[song]; // get a background sound file
      break;
    default:
      
     /* fileLength = files1.length;
       song = counter % fileLength;
       soundToPlay = files1[song]; // get a background sound file
       counter++; */
    
      return; // break;return;
    
    }

    try {

      print(song);
      print("/");
      println(fileLength);
      println(soundToPlay);
      //player.close();
      player = minim.loadSnippet(soundToPlay); // load the current sound file

      println(player.getMetaData().fileName());
      print(note);
      print("/");
      println(player.length());
      player.play(note % player.length()); // play the file
      playn = true;
      timeCounter = millis();
      timeMax = 900;
    } 
    catch (Exception e) {
      println("Cannot load file " + soundToPlay);
      e.printStackTrace();
    }
  }
  
  void checkSequence() {   //play the note for different input from mouse click
    int currentMillis = millis();
    if (plays) {
      if ((currentMillis - timeCounter) > timeMax) {
        println("check sequence");
        player.close();
        counter++;
        playIndividual();  //playNext();   
      }
    }
  }

  void checkNext() {
    int currentMillis = millis();
    if (playns) {
      if ((currentMillis - timeCounter) > timeMax) {
        player.close();
        println("check next");
        playIndividual();
        playns = false;
      }
    }
  }

  void playNext() {
    if (sequenceList.length > 0 && counter < sequenceList.length) {
      println("play next");
      timeCounter = millis();
      playns = true;
      plays = false;
      playn = false;
    }
  }

  void playIndividual() {
    if (sequenceList.length > 0 && counter < sequenceList.length) {
      println("playing end song sequence " + counter);
      playNote(sequenceList[counter], winner);
      playn = false;
    } 
    else {
      plays = false;
    }
  }

  void playSequenceNote(int[] seq, int p) { //play all note at the end of the game as a sequence
    println("playing end song sequence ====");
    winner = p;
    sequenceList = seq;
    println(sequenceList);
    counter = 0;
    plays = true;
    playIndividual();
  }

  void stopBackground() {  //at endgame, stop drawing background
    closeBG();
    closePlayer();
    //minim.stop();
  }

  void closeBG() {
    try {
        bgplayer.close();
    } 
    catch (Exception e) {
    //  println("BG Player closed unproperly");
      e.printStackTrace();
    }
  }

  void closePlayer() {
    try {
      if (player != null && player.isPlaying()) {
        player.close();
      }
    } 
    catch (Exception e) {
    //  println("Player closed unproperly");
      e.printStackTrace();
    }
  }

  void close() {  //closing the music
    closeBG();
    closePlayer();
    minim.stop();
  }

  void playBackground() {
    try {
      String soundToPlay = files[2]; // get background sound file
      bgplayer = minim.loadSnippet(soundToPlay); // load the current sound file
      bgplayer.play(); // play the file
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  void playSequence() {
    String soundToPlay = files[0]; // get a sequence sound file
    player = minim.loadSnippet(soundToPlay); // load the current sound file
    player.play(); // play the file
  }

  void playTick() {
    String soundToPlay = files[1]; // get a tick sound file
    
    
    
    player = minim.loadSnippet(soundToPlay); // load the current sound file
    player.play(); // play the file
  }

  
  void playSound() {  // play a random soundfile and add it to the playorder
    String soundToPlay = files[(int) random(files.length)] ; // get a random sound file
    player = minim.loadSnippet(soundToPlay); // load the current sound file
    player.play(); // play the file
  }
}




