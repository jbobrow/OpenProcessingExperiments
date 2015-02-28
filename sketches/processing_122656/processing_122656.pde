
////////////////////////////////////////////////////////////
//   _______  _______  _______  ______    ___   _______   //
//  |       ||       ||       ||    _ |  |   | |       |  //
//  |_     _||    ___||_     _||   | ||  |   | |  _____|  //
//    |   |  |   |___   |   |  |   |_||_ |   | | |_____   //
//    |   |  |    ___|  |   |  |    __  ||   | |_____  |  //
//    |   |  |   |___   |   |  |   |  | ||   |  _____| |  //
//    |___|  |_______|  |___|  |___|  |_||___| |_______|  //
//                                                        //
////////////////////////////////////////////////////////////

// Coded by Lambert Wang
// Any questions? Ask Lambert! lwang5@wpi.edu
// Controls:
// left/right : movement
//         up : rotation
//   spacebar : Drop Block
//        's' : Store Block
//        'r' : Restart
//        'p' : Pause

float speed;
// starts at 30
float score;
int game;
// Game State
// 0  :  Playing
// 1  :  Game Over
// 2  :  Paused
// 3  :  Menu
float grid;
// Grid color (hue value)

int placeCheck;
// Gives 1 tick before settling a block

PFont gamefont;
// I like Trebuchet MS

int boardx, boardy;
// Dimensions of the board
int[][]  board;
// 0  :  unoccupied
// 1+ :  color

ArrayList<Flashing> clearing;
// A list of lines that are full
int flash;
// Starting framecount for flashing cleared lines


// Block PVectors:
// x and y : Position
//       z : Color Index
ArrayList<PVector> block;
ArrayList<PVector> stored;
ArrayList<PVector> next;
boolean recent;
// Whether or not a block was recently stored
int rot;
// The rotation of the active block

void setup() {
  // Initializing game parameters
  size(768, 512);
  colorMode(HSB);
  frameRate(60);
  smooth();
  
  speed = 30;
  score = 0;
  game = 0;
  grid = 128;
  
  placeCheck = 1;

  gamefont = createFont("Trebuchet MS", 32);
  textFont(gamefont);

  boardx = 10;
  boardy = 20;
  board = new int[int(boardx)][int(boardy)];
  for (int i=0; i<boardx; i++) {
    for (int j=0; j<boardy; j++) {
      board[i][j] = 0;
    }
  }

  clearing = new ArrayList<Flashing>();
  flash = 0;

  block = new ArrayList<PVector>();
  stored = new ArrayList<PVector>();
  next = new ArrayList<PVector>();
  recent = false;
  rot = 1;
}

void draw() {
  background(0);
  // The order of these commands are VERY important
  // If the game is playing, apply gravity to blocks, draw blocks, then clear blocks
  if (next.size() == 0) newBlock();
  if (game == 0) {
    if (clearing.size() == 0) {
      if (frameCount%int(speed) == 0) {
        if (block.size() == 0) {
          newBlock();
          recent = false;
          // resets recent if a block is placed
          checkEnd();
        }
        else blockFall();
      }
    }
  }
  if (game < 3) { 
    drawBlocks(); 
    scoreText();
  }
  if (game == 0) guillotine();
  if (game == 1) gameEnd();
  if (game == 2) pauseText();
}

void keyPressed() {
  if (block.size() == 4 && game == 0 && block.get(0).y > 1) {
    if (key == CODED)
      switch(keyCode) {
      case LEFT:
        blockLeft();
        break;
      case RIGHT:
        blockRight();
        break;
      case DOWN:
        blockFall();
        break;
      case UP:
        blockRot();
        break;
      }
    if (key == ' ') for (int i = -1; i < boardy; i++) blockFall();
    // Makes the active block fall instantly
    if ((key == 's' || key == 'S') && recent == false) blockStore();
  }
  if (key == 'r' || key == 'R') restart();
  if (key == 'p' || key == 'P') pause();
}

// COMMENTS END HERE
// Direct all complaints to Lambert! joe.biden@us.gov
void drawBlocks() {
  strokeWeight(2);
  stroke(grid, 128, 128);
  for (int i=0; i<boardx; i++)
    for (int j=int(boardy-1); j>1; j--) {
      colorSwitch(board[i][j]);
      rect(128+i*24, -16+j*24, 24, 24);
    }

  strokeWeight(4);
  stroke(192, 128, 128);
  if (block.size() == 4)
    for (int i = 0; i < 4; i++) {
      colorSwitch(int(block.get(i).z));
      if (block.get(i).y > 1)
        rect(128+block.get(i).x*24, -16+block.get(i).y*24, 24, 24);
    }

  textSize(32);
  fill(16, 192, 192);
  text("Stored", 9, 37);
  fill(240, 192, 192);
  text("Stored", 11, 39);
  fill(0, 192, 192);
  text("Stored", 10, 38);

  strokeWeight(4);
  stroke(0, 128, 128);
  if (stored.size() == 4)
    for (int i = 0; i < 4; i++) {
      colorSwitch(int(stored.get(i).z));
      rect(-64+stored.get(i).x*24, 64+stored.get(i).y*24, 24, 24);
    }

  textSize(32);
  fill(112, 192, 192);
  text("Next", 9, 173);
  fill(144, 192, 192);
  text("Next", 10, 175);
  fill(128, 192, 192);
  text("Next", 11, 174);

  strokeWeight(4);
  stroke(0, 128, 128);
  if (next.size() == 4)
    for (int i = 0; i < 4; i++) {
      colorSwitch(int(next.get(i).z));
      rect(-64+next.get(i).x*24, 190+next.get(i).y*24, 24, 24);
    }
}

void colorSwitch(int s) {
  switch(s) {
  case 0:
    fill(0, 0);
    break;
  case 1:
    fill(0, 255, 255);
    break;
  case 2:
    fill(24, 255, 255);
    break;
  case 3:
    fill(40, 255, 255);
    break;
  case 4:
    fill(64, 255, 255);
    break;
  case 5:
    fill(128, 255, 255);
    break;
  case 6:
    fill(170, 255, 255);
    break;
  case 7:
    fill(216, 255, 255);
    break;
  }
}

void blockFall() {
  if (block.size() == 4) {
    if (int(block.get(0).y)+2 > boardy ||
      int(block.get(1).y)+2 > boardy ||
      int(block.get(2).y)+2 > boardy ||
      int(block.get(3).y)+2 > boardy ||
      board[int(block.get(0).x)][int(block.get(0).y)+1] != 0 ||
      board[int(block.get(1).x)][int(block.get(1).y)+1] != 0 ||
      board[int(block.get(2).x)][int(block.get(2).y)+1] != 0 ||
      board[int(block.get(3).x)][int(block.get(3).y)+1] != 0) blockPlace();
    else {
      placeCheck = 1;
      blockDown();
    }
  }
}

void blockPlace() {
  if (placeCheck == -1) {
    board[int(block.get(0).x)][int(block.get(0).y)] = int(block.get(0).z);
    board[int(block.get(1).x)][int(block.get(1).y)] = int(block.get(0).z);
    board[int(block.get(2).x)][int(block.get(2).y)] = int(block.get(0).z);
    board[int(block.get(3).x)][int(block.get(3).y)] = int(block.get(0).z);
    block.clear();
    for (int i = 0; i < boardy; i++) {
      int tempcount = 0;
      for (int j = 0; j < boardx; j++)
        if (board[j][i] != 0)
          tempcount++;
      if (tempcount == 10) {
        clearing.add(new Flashing(i));
        flash = frameCount;
      }
    }
  }
  placeCheck *= -1;
}

void lineFall(int start) {
  for (int i=0; i<boardx; i++)
    for (int j=start; j>0; j--) board[i][j] = board[i][j-1];
  for (int i=0; i<boardx; i++) board[i][0] = 0;
}

void blockDown() {
  if (int(block.get(0).y)+1 < boardy &&
    int(block.get(1).y)+1 < boardy &&
    int(block.get(2).y)+1 < boardy &&
    int(block.get(3).y)+1 < boardy) {
    if (board[int(block.get(0).x)][int(block.get(0).y)+1] == 0 &&
      board[int(block.get(1).x)][int(block.get(1).y)+1] == 0 &&
      board[int(block.get(2).x)][int(block.get(2).y)+1] == 0 &&
      board[int(block.get(3).x)][int(block.get(3).y)+1] == 0)
      for (int i = 0; i < 4; i++) block.get(i).y += 1;
  }
}

void blockLeft() {
  if (int(block.get(0).x) > 0 &&
    int(block.get(1).x) > 0 &&
    int(block.get(2).x) > 0 &&
    int(block.get(3).x) > 0) {
    if (board[int(block.get(0).x)-1][int(block.get(0).y)] == 0 &&
      board[int(block.get(1).x)-1][int(block.get(1).y)] == 0 &&
      board[int(block.get(2).x)-1][int(block.get(2).y)] == 0 &&
      board[int(block.get(3).x)-1][int(block.get(3).y)] == 0)
      for (int i = 0; i < 4; i++) block.get(i).x -= 1;
  }
}

void blockRight() {
  if (int(block.get(0).x)+1 < boardx &&
    int(block.get(1).x)+1 < boardx &&
    int(block.get(2).x)+1 < boardx &&
    int(block.get(3).x)+1 < boardx) {
    if (board[int(block.get(0).x)+1][int(block.get(0).y)] == 0 &&
      board[int(block.get(1).x)+1][int(block.get(1).y)] == 0 &&
      board[int(block.get(2).x)+1][int(block.get(2).y)] == 0 &&
      board[int(block.get(3).x)+1][int(block.get(3).y)] == 0)
      for (int i = 0; i < 4; i++) block.get(i).x += 1;
  }
}

void blockRot() {
  switch(int(block.get(0).z)) {
  case 1:
    rotCase1();
    break;
  case 2:
    rotCase2();
    break;
  case 4:
    rotCase4();
    break;
  case 5:
    rotCase5();
    break;
  case 6:
    rotCase6();
    break;
  case 7:
    rotCase7();
    break;
  }
}

void blockStore() {
  while (rot != 1) blockRot();
  if (stored.size() == 0) {
    stored.addAll(block);
    block.clear();
    newBlock();
  }
  else {
    ArrayList<PVector> temp = new ArrayList<PVector>();
    temp.addAll(stored);
    stored.clear();
    stored.addAll(block);
    block.clear();
    block.addAll(temp);
  }

  while (block.get (0).y > 0) for (int i = 0; i < 4; i++) block.get(i).y--;
  while (block.get (0).x > 4) for (int i = 0; i < 4; i++) block.get(i).x--;
  while (block.get (0).x < 4) for (int i = 0; i < 4; i++) block.get(i).x++;

  while (stored.get (0).y > 0) for (int i = 0; i < 4; i++) stored.get(i).y--;
  while (stored.get (0).x > 4) for (int i = 0; i < 4; i++) stored.get(i).x--;
  while (stored.get (0).x < 4) for (int i = 0; i < 4; i++) stored.get(i).x++;

  if (stored.get (0).z == 5) for (int i = 0; i < 4; i++) stored.get(i).x--;

  recent = true;
}

void newBlock() {
  if (next.size() != 0) {
    block.addAll(next);
    next.clear();
  }
  rot = 1;
  switch(int(random(0, 7))) {
  case 0:
    next.add(new PVector(4, 0, 1));
    next.add(new PVector(5, 0, 1));
    next.add(new PVector(5, 1, 1));
    next.add(new PVector(6, 1, 1));
    break;
  case 1:
    next.add(new PVector(4, 0, 2));
    next.add(new PVector(5, 0, 2));
    next.add(new PVector(6, 0, 2));
    next.add(new PVector(4, 1, 2));
    break;
  case 2:
    next.add(new PVector(4, 0, 3));
    next.add(new PVector(5, 0, 3));
    next.add(new PVector(4, 1, 3));
    next.add(new PVector(5, 1, 3));
    break;
  case 3:
    next.add(new PVector(4, 0, 4));
    next.add(new PVector(5, 0, 4));
    next.add(new PVector(3, 1, 4));
    next.add(new PVector(4, 1, 4));
    break;
  case 4:
    next.add(new PVector(3, 0, 5));
    next.add(new PVector(4, 0, 5));
    next.add(new PVector(5, 0, 5));
    next.add(new PVector(6, 0, 5));
    break;
  case 5:
    next.add(new PVector(4, 0, 6));
    next.add(new PVector(5, 0, 6));
    next.add(new PVector(6, 0, 6));
    next.add(new PVector(6, 1, 6));
    break;
  case 6:
    next.add(new PVector(4, 0, 7));
    next.add(new PVector(5, 0, 7));
    next.add(new PVector(6, 0, 7));
    next.add(new PVector(5, 1, 7));
    break;
  }
}

class Flashing {
  int line;
  Flashing(int tline) {
    line = tline;
  }

  void blink() {
    strokeWeight(8);
    stroke(64, 128, 128);
    fill(0);
    for (int i=0; i<boardx; i++) rect(128+i*24, -16+line*24, 24, 24);
  }

  void killLine() {
    for (int i=0; i<boardx; i++) board[i][line] = 0;
  }
}

void guillotine() {
  for (int i = 0; i < clearing.size(); i++) {
    if ((frameCount-flash)%20 < 10) clearing.get(i).blink();
    if (frameCount-flash == 60) {
      clearing.get(i).killLine();
      lineFall(clearing.get(i).line);
    }
  }
  if (clearing.size() != 0 && frameCount-flash == 60) {
    score += clearing.size();
    if (clearing.size() == 4) score++;
    grid = random(0, 256);
    speed *= .96;
    clearing.clear();
    println(speed);
  }
}

void checkEnd(){
  for (int i = 0; i < boardx; i++) {
    if (board[i][2] != 0) {
      game = 1;
    }
  }
  
}
void gameEnd() {
  textSize(64);
  fill(0);
  text("You lose", 132, height/2+2);
  text("You lose", 128, height/2-2);
  text("You lose", 132, height/2-2);
  text("You lose", 128, height/2+2);

  fill(96, 255, 255);
  text("You lose", 130, height/2);

  textSize(32);
  fill(0);
  text("'R' to retry", 172, height/2+34);
  text("'R' to retry", 168, height/2+30);
  text("'R' to retry", 172, height/2+30);
  text("'R' to retry", 168, height/2+34);

  fill(96, 255, 255);
  text("'R' to retry", 170, height/2+32);
}

void restart() {
  speed = 30;
  score = 0;
  game = 0;

  board = new int[int(boardx)][int(boardy)];
  for (int i=0; i<boardx; i++) {
    for (int j=0; j<boardy; j++) {
      board[i][j] = 0;
    }
  }

  block.clear();
  stored.clear();
  next.clear();
}

void pause() {
  switch(game) {
  case 0:
    game = 2;
    break;
  case 2:
    game = 0;
    break;
  }
}

void pauseText() {
  textSize(64);
  fill(0);
  text("PAUSED", 142, height/2+2);
  text("PAUSED", 138, height/2-2);
  text("PAUSED", 142, height/2-2);
  text("PAUSED", 138, height/2+2);

  fill(224, 255, 255);
  text("PAUSED", 140, height/2);

  textSize(32);
  fill(0);
  text("'P' to unpause", 152, height/2+34);
  text("'P' to unpause", 148, height/2+30);
  text("'P' to unpause", 152, height/2+30);
  text("'P' to unpause", 148, height/2+34);

  fill(224, 255, 255);
  text("'P' to unpause", 150, height/2+32);
  
  textSize(32);
  fill(0);
  text("'R' to retry", 172, height/2+66);
  text("'R' to retry", 168, height/2+62);
  text("'R' to retry", 172, height/2+62);
  text("'R' to retry", 168, height/2+66);

  fill(224, 255, 255);
  text("'R' to retry", 170, height/2+64);
}

void scoreText(){
  textSize(48);
  fill(158, 255, 255);
  text("Score:" + int(score), 441, 65);
  fill(142, 192, 192);
  text("Score:" + int(score), 439, 63);
  
  fill(150, 255, 255);
  text("Score:" + int(score), 440, 64);
  
}
void rotCase1() {
  switch(rot) {
  case 1:
    if (int(block.get(0).y) > 0) {
      if (board[int(block.get(0).x)+2][int(block.get(0).y)-1] == 0 &&
        board[int(block.get(1).x)+1][int(block.get(1).y)] == 0) {
        block.get(0).x += 2;
        block.get(0).y -= 1;
        block.get(1).x += 1;
        block.get(2).y -= 1;
        block.get(3).x -= 1;
        rot = 2;
      }
    }
    else {
      if (int(block.get(0).y) > 0) {
        if (board[int(block.get(0).x)+1][int(block.get(0).y)-1] == 0 &&
          board[int(block.get(3).x)-2][int(block.get(3).y)] == 0) {
          block.get(0).x += 1;
          block.get(0).y -= 1;
          block.get(2).x -= 1;
          block.get(2).y -= 1;
          block.get(3).x -= 2;
          rot = 2;
        }
      }
    }
    break;
  case 2:
    if (int(block.get(0).x)-1 > 0) {
      if (board[int(block.get(0).x)-2][int(block.get(0).y)+1] == 0 &&
        board[int(block.get(3).x)+1][int(block.get(3).y)] == 0) 
      {
        block.get(0).x -= 2;
        block.get(0).y += 1;
        block.get(1).x -= 1;
        block.get(2).y += 1;
        block.get(3).x += 1;
        rot = 1;
      }
    }
    else {
      if (int(block.get(0).x)+3 < boardx) {
        if (board[int(block.get(2).x)+1][int(block.get(2).y)+1] == 0 &&
          board[int(block.get(3).x)+2][int(block.get(3).y)] == 0) 
        {
          block.get(0).x -= 1;
          block.get(0).y += 1;
          block.get(2).x += 1;
          block.get(2).y += 1;
          block.get(3).x += 2;
          rot = 1;
        }
      }
    }
    break;
  }
}

void rotCase2() {
  switch(rot) {
  case 1:
    if (int(block.get(3).y)-1 > 0) {
      if (board[int(block.get(0).x)+1][int(block.get(0).y)-1] == 0 &&
        board[int(block.get(2).x)-1][int(block.get(2).y)+1] == 0 &&
        board[int(block.get(3).x)][int(block.get(3).y)-2] == 0) {
        block.get(0).x += 1;
        block.get(0).y -= 1;
        block.get(2).x -= 1;
        block.get(2).y += 1;
        block.get(3).y -= 2;
        rot = 2;
      }
    }

    else {
      if (int(block.get(3).y)-1 > 0) {
        if (board[int(block.get(0).x)+2][int(block.get(0).y)-1] == 0 &&
          board[int(block.get(2).x)][int(block.get(2).y)+1] == 0 &&
          board[int(block.get(3).x)+1][int(block.get(3).y)-2] == 0) {
          block.get(0).x += 2;
          block.get(0).y -= 1;
          block.get(1).x += 1;
          block.get(2).y += 1;
          block.get(3).x += 1;
          block.get(3).y -= 2;
          rot = 2;
        }
      }
    }
    break;
  case 2:
    if (int(block.get(0).x)+2 < boardx) {
      if (board[int(block.get(0).x)+1][int(block.get(0).y)+2] == 0 &&
        board[int(block.get(2).x)-1][int(block.get(2).y)] == 0 &&
        board[int(block.get(3).x)+2][int(block.get(3).y)+1] == 0) 
      {
        block.get(0).x += 1;
        block.get(0).y += 2;
        block.get(1).y += 1;
        block.get(2).x -= 1;
        block.get(3).x += 2;
        block.get(3).y += 1;
        rot = 3;
      }
    }
    else {
      if (int(block.get(2).x)-1 > 0) {
        if (board[int(block.get(1).x)-1][int(block.get(1).y)+1] == 0 &&
          board[int(block.get(2).x)-2][int(block.get(2).y)] == 0) 
        {
          block.get(0).y += 2;
          block.get(1).x -= 1;
          block.get(1).y += 1;
          block.get(2).x -= 2;
          block.get(3).x += 1;
          block.get(3).y += 1;
          rot = 3;
        }
      }
    }
    break;
  case 3:
    if (int(block.get(2).y)-1 >0) {
      if (board[int(block.get(1).x)][int(block.get(1).y)-1] == 0 &&
        board[int(block.get(2).x)+1][int(block.get(2).y)-2] == 0) 
      {
        block.get(0).x -= 1;
        block.get(1).y -= 1;
        block.get(2).x += 1;
        block.get(2).y -= 2;
        block.get(3).y += 1;
        rot = 4;
      }
    }
    else {
      if (int(block.get(2).y)-1 > 0) {
        if (board[int(block.get(1).x)-1][int(block.get(1).y)-1] == 0 &&
          board[int(block.get(2).x)][int(block.get(2).y)-2] == 0) 
        {
          block.get(0).x -= 2;
          block.get(1).x -= 1;
          block.get(1).y -= 1;
          block.get(2).y -= 2;
          block.get(3).x -= 1;
          block.get(3).y += 1;
          rot = 4;
        }
      }
    }
    break;
  case 4:
    if (int(block.get(0).x)-1 > 0) {
      if (board[int(block.get(0).x)-1][int(block.get(0).y)-1] == 0 &&
        board[int(block.get(3).x)-2][int(block.get(3).y)] == 0) 
      {
        block.get(0).x -= 1;
        block.get(0).y -= 1;
        block.get(2).x += 1;
        block.get(2).y += 1;
        block.get(3).x -= 2;
        rot = 1;
      }
    }
    else {
      if (int(block.get(2).x)+3 < boardx) {
        if (board[int(block.get(1).x)+1][int(block.get(1).y)] == 0 &&
          board[int(block.get(2).x)+2][int(block.get(2).y)+1] == 0) 
        {
          block.get(0).y -= 1;
          block.get(1).x += 1;
          block.get(2).x += 2;
          block.get(2).y += 1;
          block.get(3).x -= 1;
          rot = 1;
        }
      }
    }
    break;
  }
}

void rotCase4() {
  switch(rot) {
  case 1:
    if (int(block.get(3).y)-1 > 0) {
      if (board[int(block.get(2).x)][int(block.get(2).y)-2] == 0 &&
        board[int(block.get(3).x)-1][int(block.get(3).y)-1] == 0) {
        block.get(1).x -= 1;
        block.get(1).y += 1;
        block.get(2).y -= 2;
        block.get(3).x -= 1;
        block.get(3).y -= 1;
        rot = 2;
      }
    }
    else {
      if (int(block.get(3).y)-1 > 0) {
        if (board[int(block.get(2).x)+1][int(block.get(2).y)-2] == 0 &&
          board[int(block.get(3).x)-2][int(block.get(3).y)] == 0) {
          block.get(0).x += 1;
          block.get(1).y += 1;
          block.get(2).x += 1;
          block.get(2).y -= 2;
          block.get(3).y -= 1;
          rot = 2;
        }
      }
    }
    break;
  case 2:
    if (int(block.get(1).x)+1 < boardx) {
      if (board[int(block.get(1).x)+1][int(block.get(1).y)-1] == 0 &&
        board[int(block.get(2).x)][int(block.get(2).y)+2] == 0) 
      {
        block.get(1).x += 1;
        block.get(1).y -= 1;
        block.get(2).y += 2;
        block.get(3).x += 1;
        block.get(3).y += 1;
        rot = 1;
      }
    }
    else {
      if (int(block.get(2).x)-1 > 0) {
        if (board[int(block.get(2).x)-1][int(block.get(2).y)+2] == 0 &&
          board[int(block.get(3).x)][int(block.get(3).y)+1] == 0) 
        {
          block.get(0).x -= 1;
          block.get(1).y -= 1;
          block.get(2).x -= 1;
          block.get(2).y += 2;
          block.get(3).y += 1;
          rot = 1;
        }
      }
    }
    break;
  }
}

void rotCase5() {
  switch(rot) {
  case 1:
    if (int(block.get(0).y)-2 > 0) {
      if (board[int(block.get(0).x)+1][int(block.get(0).y)-3] == 0 &&
        board[int(block.get(1).x)][int(block.get(1).y)-2] == 0 &&
        board[int(block.get(2).x)-1][int(block.get(2).y)-1] == 0) {
        block.get(0).x += 1;
        block.get(0).y -= 3;
        block.get(1).y -= 2;
        block.get(2).x -= 1;
        block.get(2).y -= 1;
        block.get(3).x -= 2;
        rot = 2;
      }
    }
    else {
      if (int(block.get(0).y)-2 > 0) {
        if (board[int(block.get(0).x)+2][int(block.get(0).y)-3] == 0 &&
          board[int(block.get(1).x)+1][int(block.get(1).y)-2] == 0 &&
          board[int(block.get(2).x)][int(block.get(2).y)-1] == 0) {
          block.get(0).x += 2;
          block.get(0).y -= 3;
          block.get(1).x += 1;
          block.get(1).y -= 2;
          block.get(2).y -= 1;
          block.get(3).x -= 1;
          rot = 2;
        }
      }
      else {
        if (int(block.get(0).y)-2 > 0) {
          if (board[int(block.get(0).x)][int(block.get(0).y)-3] == 0 &&
            board[int(block.get(1).x)-1][int(block.get(1).y)-2] == 0 &&
            board[int(block.get(2).x)-2][int(block.get(2).y)-1] == 0) {
            block.get(0).y -= 3;
            block.get(1).x -= 1;
            block.get(1).y -= 2;
            block.get(2).x -= 2;
            block.get(2).y -= 1;
            block.get(3).x -= 3;
            rot = 2;
          }
        }
        else {
          if (int(block.get(0).y)-2 > 0) {
            if (board[int(block.get(0).x)+3][int(block.get(0).y)-3] == 0 &&
              board[int(block.get(1).x)+2][int(block.get(1).y)-2] == 0 &&
              board[int(block.get(2).x)+1][int(block.get(2).y)-1] == 0) {
              block.get(0).x += 3;
              block.get(0).y -= 3;
              block.get(1).x += 2;
              block.get(1).y -= 2;
              block.get(2).x += 1;
              block.get(2).y -= 1;
              rot = 2;
            }
          }
        }
      }
    }
    break;
  case 2:
    if (int(block.get(0).x)-0 > 0 &&
      int(block.get(3).x)+2 < boardx) {
      if (board[int(block.get(0).x)-1][int(block.get(0).y)+3] == 0 &&
        board[int(block.get(2).x)+1][int(block.get(2).y)+1] == 0 &&
        board[int(block.get(3).x)+2][int(block.get(3).y)] == 0) {
        block.get(0).x -= 1;
        block.get(0).y += 3;
        block.get(1).y += 2;
        block.get(2).x += 1;
        block.get(2).y += 1;
        block.get(3).x += 2;
        rot = 1;
      }
    }
    else {
      if (int(block.get(0).x)-1 > 0 &&
        int(block.get(3).x)+1 < boardx) {
        if (board[int(block.get(0).x)-2][int(block.get(0).y)+3] == 0 &&
          board[int(block.get(1).x)-1][int(block.get(1).y)+2] == 0 &&
          board[int(block.get(3).x)+1][int(block.get(3).y)] == 0) {
          block.get(0).x -= 2;
          block.get(0).y += 3;
          block.get(1).x -= 1;
          block.get(1).y += 2;
          block.get(2).y += 1;
          block.get(3).x += 1;
          rot = 1;
        }
      }
      else {
        if (int(block.get(0).x)+1 > 0 &&
          int(block.get(3).x)+3 < boardx) {
          if (board[int(block.get(1).x)+1][int(block.get(1).y)+2] == 0 &&
            board[int(block.get(2).x)+2][int(block.get(2).y)+1] == 0 &&
            board[int(block.get(3).x)+3][int(block.get(3).y)] == 0) {
            block.get(0).y += 3;
            block.get(1).x += 1;
            block.get(1).y += 2;
            block.get(2).x += 2;
            block.get(2).y += 1;
            block.get(3).x += 3;
            rot = 1;
          }
        }
        else {
          if (int(block.get(0).x)-2 > 0 &&
            int(block.get(3).x) < boardx) {
            if (board[int(block.get(0).x)-3][int(block.get(0).y)+3] == 0 &&
              board[int(block.get(1).x)-2][int(block.get(1).y)+2] == 0 &&
              board[int(block.get(2).x)-1][int(block.get(2).y)+1] == 0) {
              block.get(0).x -= 3;
              block.get(0).y += 3;
              block.get(1).x -= 2;
              block.get(1).y += 2;
              block.get(2).x -= 1;
              block.get(2).y += 1;
              rot = 1;
            }
          }
        }
      }
    }
    break;
  }
}

void rotCase6() {
  switch(rot) {
  case 1:
    if (int(block.get(0).y) > 0) {
      if (board[int(block.get(0).x)+1][int(block.get(0).y)-1] == 0 &&
        board[int(block.get(2).x)-1][int(block.get(2).y)+1] == 0 &&
        board[int(block.get(3).x)-2][int(block.get(3).y)] == 0) {
        block.get(0).x += 1;
        block.get(0).y -= 1;
        block.get(2).x -= 1;
        block.get(2).y += 1;
        block.get(3).x -= 2;
        rot = 2;
      }
    }

    else {
      if (int(block.get(0).y) > 0) {
        if (board[int(block.get(0).x)+2][int(block.get(0).y)-1] == 0 &&
          board[int(block.get(3).x)-1][int(block.get(3).y)] == 0) {
          block.get(0).x += 2;
          block.get(0).y -= 1;
          block.get(1).x += 1;
          block.get(2).y += 1;
          block.get(3).x -= 1;
          rot = 2;
        }
      }
    }
    break;
  case 2:
    if (int(block.get(0).x)+1 < boardx) {
      if (board[int(block.get(0).x)+1][int(block.get(0).y)+2] == 0 &&
        board[int(block.get(3).x)][int(block.get(3).y)-1] == 0) 
      {
        block.get(0).x += 1;
        block.get(0).y += 2;
        block.get(1).y += 1;
        block.get(2).x -= 1;
        block.get(3).y -= 1;
        rot = 3;
      }
    }
    else {
      if (int(block.get(2).x)-1 > 0) {
        if (board[int(block.get(2).x)-2][int(block.get(2).y)] == 0 &&
          board[int(block.get(3).x)-1][int(block.get(3).y)-1] == 0) 
        {
          block.get(0).y += 2;
          block.get(1).x -= 1;
          block.get(1).y += 1;
          block.get(2).x -= 2;
          block.get(3).x -= 1;
          block.get(3).y -= 1;
          rot = 3;
        }
      }
    }
    break;
  case 3:
    if (int(block.get(2).y) >0) {
      if (board[int(block.get(1).x)][int(block.get(1).y)-1] == 0 &&
        board[int(block.get(2).x)+1][int(block.get(2).y)-2] == 0 &&
        board[int(block.get(3).x)+2][int(block.get(3).y)-1] == 0) 
      {
        block.get(0).x -= 1;
        block.get(1).y -= 1;
        block.get(2).x += 1;
        block.get(2).y -= 2;
        block.get(3).x += 2;
        block.get(3).y -= 1;
        rot = 4;
      }
    }
    else {
      if (int(block.get(2).y) > 0) {
        if (board[int(block.get(2).x)][int(block.get(2).y)-2] == 0 &&
          board[int(block.get(3).x)+1][int(block.get(3).y)-1] == 0) 
        {
          block.get(0).x -= 2;
          block.get(1).x -= 1;
          block.get(1).y -= 1;
          block.get(2).y -= 2;
          block.get(3).x += 1;
          block.get(3).y -= 1;
          rot = 4;
        }
      }
    }
    break;
  case 4:
    if (int(block.get(0).x) > 0) {
      if (board[int(block.get(0).x)-1][int(block.get(0).y)-1] == 0 &&
        board[int(block.get(2).x)+1][int(block.get(2).y)+1] == 0 &&
        board[int(block.get(3).x)][int(block.get(3).y)+2] == 0) 
      {
        block.get(0).x -= 1;
        block.get(0).y -= 1;
        block.get(2).x += 1;
        block.get(2).y += 1;
        block.get(3).y += 2;
        rot = 1;
      }
    }
    else {
      if (int(block.get(2).x)+3 < boardx) {
        if (board[int(block.get(1).x)+1][int(block.get(1).y)] == 0 &&
          board[int(block.get(2).x)+2][int(block.get(2).y)+1] == 0 &&
          board[int(block.get(3).x)+1][int(block.get(3).y)+2] == 0) 
        {
          block.get(0).y -= 1;
          block.get(1).x += 1;
          block.get(2).x += 2;
          block.get(2).y += 1;
          block.get(3).x += 1;
          block.get(3).y += 2;
          rot = 1;
        }
      }
    }
    break;
  }
}

void rotCase7() {
  switch(rot) {
  case 1:
    if (int(block.get(0).y) > 0) {
      if (board[int(block.get(0).x)+1][int(block.get(0).y)-1] == 0) {
        block.get(0).x += 1;
        block.get(0).y -= 1;
        block.get(2).x -= 1;
        block.get(2).y += 1;
        block.get(3).x -= 1;
        block.get(3).y -= 1;
        rot = 2;
      }
    }
    break;
  case 2:
    if (int(block.get(0).x)+1 < boardx) {
      if (board[int(block.get(0).x)+1][int(block.get(0).y)+1] == 0) {
        block.get(0).x += 1;
        block.get(0).y += 1;
        block.get(2).x -= 1;
        block.get(2).y -= 1;
        block.get(3).x += 1;
        block.get(3).y -= 1;
        rot = 3;
      }
    }
    break;
  case 3:
    if (int(block.get(0).y)+1 < boardy) {
      if (board[int(block.get(0).x)-1][int(block.get(0).y)+1] == 0) {
        block.get(0).x -= 1;
        block.get(0).y += 1;
        block.get(2).x += 1;
        block.get(2).y -= 1;
        block.get(3).x += 1;
        block.get(3).y += 1;
        rot = 4;
      }
    }
    break;
  case 4:
    if (int(block.get(0).x) > 0) {
      if (board[int(block.get(0).x)-1][int(block.get(0).y)-1] == 0) {
        block.get(0).x -= 1;
        block.get(0).y -= 1;
        block.get(2).x += 1;
        block.get(2).y += 1;
        block.get(3).x -= 1;
        block.get(3).y += 1;
        rot = 1;
      }
    }
    break;
  }
}



