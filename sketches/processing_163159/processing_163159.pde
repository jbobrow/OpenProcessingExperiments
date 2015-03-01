
/* 2 player tetris */
/*     Author:     */
/*  Lambert  Wang  */

/*
  Controls:
 Player 1 uses WASD
 Player 2 uses Arrow Keys
 W/Up     : turn the piece
 A/Left   : move the piece left
 D/Right  : move the piece right
 S/Down   : drop the piece to the floow
 
 Clearing blocks on your side makes blocks fall faster for your opponent.
 */

/*
  To go from java to javascript, the following code must be changed:
  Size
  Font
  block.render();
*/

/*
  To do: 
 Add more than 2 players
 
 
 */

// Size of the field in blocks
// Standard = 10 x 20
final int 
fieldX = 10, 
fieldY = 20;

// Block Size
final int blockSize = 32;
// Initial frame delay before blocks fall
final int gdelay = 25;

// Fix for text drawing behind the field
boolean drawing = true;

// Triple nested arraylist of both player's fields
// players.get(player number).get(x location of block).get(y location of block)
ArrayList<ArrayList<ArrayList<Block>>> players;

// Array 
Tetri[] playerB, nextB;

// FixedSys size 48
/* @pjs font="data/fixed.ttf"; */
PFont font;

void setup() {
  // Cannot have operators in size(); when in javascript mode
  /*int sizeX = 64 + fieldX*blockSize + 256 + fieldX*blockSize + 64;
   int sizeY = 64 + fieldY*blockSize + 64;
   println(sizeX);
   println(sizeY);
   */
  size(1024, 768);
  frameRate(60);

  colorMode(HSB);
  smooth();

  // fonts are differeint in javascript mode
  // font = loadFont("fixed.vlw");
  font = createFont("fixed_v01", 48);
  textFont(font);

  // Adding two players
  players = new ArrayList();
  players.add(new ArrayList());
  players.add(new ArrayList());

  // A display grid for the next block
  players.add(new ArrayList());

  // Adding the field for both players
  for (int i = 0; i < fieldX; i++) {
    players.get(0).add(new ArrayList());
    players.get(1).add(new ArrayList());
    for (int j = 0; j < fieldY; j++) {
      players.get(0).get(i).add(new Block(i, j));
      players.get(1).get(i).add(new Block(i, j));
    }
  }
  for (int i = 0; i < 4; i++) {
    players.get(2).add(new ArrayList());
    for (int j = 0; j < 8; j++)
      players.get(2).get(i).add(new Block(i, j));
  }
  playerB = new Tetri[2];
  nextB = new Tetri[2];
  playerB[0] = new Tetri(0);
  playerB[1] = new Tetri(1);
}


void draw() {
  background(0);

  gameText();

  if (!drawing) {
    pushMatrix();
    translate(64, 64);
    for (int i = 0; i < fieldX; i++)
      for (int j = 0; j < fieldY; j++) 
        players.get(0).get(i).get(j).render();

    translate(fieldX*blockSize +256, 0);
    for (int i = 0; i < fieldX; i++)
      for (int j = 0; j < fieldY; j++)
        players.get(1).get(i).get(j).render();
    popMatrix();
  }

  playerB[0].tick();
  playerB[1].tick();

  // Rendering the field
  if (drawing) {
    pushMatrix();
    translate(64, 64);
    for (int i = 0; i < fieldX; i++)
      for (int j = 0; j < fieldY; j++) 
        players.get(0).get(i).get(j).render();

    translate(fieldX*blockSize+(256-4*blockSize)/2, 2*blockSize);

    for (int i = 0; i < 4; i++)
      for (int j = 0; j < 8; j++)
        players.get(2).get(i).get(j).render();

    translate((4*blockSize+256)/2, -2*blockSize);
    for (int i = 0; i < fieldX; i++)
      for (int j = 0; j < fieldY; j++)
        players.get(1).get(i).get(j).render();
    popMatrix();

    pushMatrix();
    popMatrix();
  }
}

void gameText() {
  pushMatrix();
  translate(64, 64);
  fill(64, 255, 255);
  text(" PLAYER1 ", 0, 0);
  translate(fieldX*blockSize+(256-4*blockSize)/2-4, 2*blockSize-4);
  text("NEXT", 0, 0);
  translate(0, 8*blockSize+52);
  fill(192, 255, 255);
  text("NEXT", 0, 0);
  translate((4*blockSize+256)/2, -10*blockSize-48);
  text(" PLAYER2 ", 0, 0);
  popMatrix();
}

void startup() {
  drawing = true;
  for (int i = 0; i < fieldX; i++) {
    players.get(0).get(i).clear();
    players.get(1).get(i).clear();
    for (int j = 0; j < fieldY; j++) {
      players.get(0).get(i).add(new Block(i, j));
      players.get(1).get(i).add(new Block(i, j));
    }
  }

  playerB[0].reset();
  playerB[1].reset();

  loop();
}

void endGame(int loser) {
  drawing = false;
  pushMatrix();
  translate(64+loser*(fieldX*blockSize+256)+(fieldX-10)*blockSize/2, 128);
  fill(255);
  text("   YOU   ", 0, 0);
  translate(0, 48);
  text("   ARE   ", 0, 0);
  translate(0, 48);
  text("   THE   ", 0, 0);
  translate(0, 48);
  text("  LOSER  ", 0, 0);
  popMatrix();
  noLoop();

  pushMatrix();
  translate(64+(1-loser)*(fieldX*blockSize+256)+(fieldX-10)*blockSize/2, 128);
  text("   YOU   ", 0, 0);
  translate(0, 48);
  text("   ARE   ", 0, 0);
  translate(0, 48);
  text("   THE   ", 0, 0);
  translate(-blockSize/2, 48);
  text("  WINNER  ", 0, 0);
  popMatrix();
  noLoop();
}


/*
 L: 000 100 000 043
 4  0C4 2C0 321 0C2
    123 340 400 001 C/2/C/C
 
 J: 000 140 000 003
    4C0 2C0 321 0C2
    123 300 004 041 C/2/C/C
 
 O: 000
    340
    120 Doesn't rotate
 
 S: 000 100 000 400
    034 230 021 320
    120 040 430 010 3/2/2/3
 
 Z: 000 030 000 020
    340 140 210 410
    012 200 043 300 4/1/1/4
 
 T: 000 020 010 040
    234 130 432 031
    010 040 000 020 3/3/3/3
 
 I: 00000 01000 00000 00400
    00000 02000 00000 00300
    00000 03000 00000 00200
    12340 04000 43210 00100 
    00000 00000 00000 00000 4/1/1/4
 */
 
 
/*
Array Shifting without placeholder variables
 start
 a = 1
 b = 3
 c = 6
 d = 10
 
 a = a+b 4
 b = b+c 9
 c = c+d 16
 d = d   10
 
 d = a-b+c-d 1
 c = c-b+a-d 10
 b = b-a+d   6
 a = a-d     3
 */
// Each cell in the play area is a block
class Block {
  int xpos, ypos, col;
  // Occupied?
  // 0 = unocciupied
  // 1 = occupied static
  // 2 =  occupied by a player block
  int occ;
    Block(int tx, int ty) {
    xpos = tx;
    ypos = ty;
    occ = 0;
    col = 0;
  }
  
  void render(){
    if(occ == 0){
      noFill();
      strokeWeight(blockSize/8);
      stroke(64);
      rect(xpos*blockSize, ypos*blockSize, blockSize, blockSize);
    }
    else{
      fill(col, 255, 255);
      strokeWeight(0);
      // Javascript mode is stupid
      //rect(xpos*blockSize+blockSize/16, ypos*blockSize+blockSize/16, blockSize, blockSize);
      rect(xpos*blockSize, ypos*blockSize, blockSize, blockSize);
    }
  }
}

class Tetri {
  int shape, player, xpos, ypos, tcol;
  int next;
  // Frame progress for falling
  float fall;
  // Delay before falling
  float delay;
  // Allows t-spinning and sliding on the ground and on top of other blocks
  boolean lock;
  // List of blocks the tetrimino is located at
  Block[] loc;
  // Center adjustment for rotating blocks
  int[] txr, tyr;


  Tetri(int tp) {
    delay = gdelay;
    fall = delay;
    player = tp;
    loc = new Block[4];
    txr = new int[4];
    tyr = new int[4];
    next = int(random(0, 7));

    if (player != 2) {
      nextB[player] = new Tetri(2);
      nextB[player].shape = next;
      nextB[player].xpos = 2;
      nextB[player].ypos = 6*player;
      reset();
    }
  }

  // Generates a new random block at the top of the field
  void reset() {
    if (player != 2) {
      shape = next;
      next = int(random(0, 7));
      nextB[player].shape = next;
      for (int i = 0; i < 4; i++)
        for (int j = 4*player; j < 4+4*player; j++)
          players.get(2).get(i).get(j).occ = 0;
      nextB[player].reset();
      xpos = floor(fieldX/2.0);
      ypos = 0;
      lock = false;
    }
    tcol = (shape+1)*36;
    for (int i = 0; i < 4; i++) {
      txr[i] = 0;
      tyr[i] = 0;
    }
    switch(shape) {
    case 0: // L
      loc[0] = getb(xpos-1, ypos+1);
      loc[1] = getb(xpos, ypos+1);
      loc[2] = getb(xpos+1, ypos+1);
      loc[3] = getb(xpos+1, ypos);
      tyr[1] = 1;
      txr[2] = 1;
      break;
    case 1: // J
      loc[0] = getb(xpos-1, ypos+1);
      loc[1] = getb(xpos, ypos+1);
      loc[2] = getb(xpos+1, ypos+1);
      loc[3] = getb(xpos-1, ypos);
      tyr[1] = 1;
      txr[2] = 1;
      break;
    case 2: // O
      loc[0] = getb(xpos-1, ypos+1);
      loc[1] = getb(xpos, ypos+1);
      loc[2] = getb(xpos-1, ypos);
      loc[3] = getb(xpos, ypos);
      tyr[0] = 1;
      tyr[1] = 1;
      tyr[2] = 1;
      tyr[3] = 1;
      break;
    case 3: // S
      loc[0] = getb(xpos-1, ypos+1);
      loc[1] = getb(xpos, ypos+1);
      loc[2] = getb(xpos, ypos);
      loc[3] = getb(xpos+1, ypos);
      tyr[1] = 1;
      tyr[3] = 1;
      break;
    case 4: // Z
      loc[0] = getb(xpos, ypos+1);
      loc[1] = getb(xpos+1, ypos+1);
      loc[2] = getb(xpos-1, ypos);
      loc[3] = getb(xpos, ypos);
      tyr[1] = 1;
      tyr[3] = 1;
      break;
    case 5: // T
      loc[0] = getb(xpos, ypos+1);
      loc[1] = getb(xpos-1, ypos);
      loc[2] = getb(xpos, ypos);
      loc[3] = getb(xpos+1, ypos);
      break;
    case 6: // I
      loc[0] = getb(xpos-2, ypos+1);
      loc[1] = getb(xpos-1, ypos+1);
      loc[2] = getb(xpos, ypos+1);
      loc[3] = getb(xpos+1, ypos+1);
      tyr[1] = 2;
      txr[1] = -1;
      txr[2] = 1;
      txr[3] = -1;
      tyr[3] = 1;
      break;
    }
    for (int i = 0; i < 4; i++) {
      if (loc[i].occ == 1 && player != 2)
        endGame(player);
      loc[i].occ = 2;
      loc[i].col = tcol;
    }
  }

  // 
  void rotateCW() {
    int tempx = 0;
    int tempy = 0;
    while (!rotateCWShift (tempx, tempy)) {
      if (tempx == 0)
        tempx--;
      else if (tempx == -1)
        tempx+=2;
      else if (tempx == 1) {
        tempx--;
        tempy++;
      }
      if (tempy == 3)
        break;
    }
  }

  boolean rotateCWShift(int x, int y) {
    int[] tarx = new int[4];
    int[] tary = new int[4];
    for (int i = 0; i < 4; i++) {
      tarx[i] = xpos-(loc[i].ypos-ypos)+txr[0]+x;
      tary[i] = ypos+(loc[i].xpos-xpos)+tyr[0]+y;
    }

    boolean inbounds = true;

    for (int i = 0; i < 4; i++) {
      if (!free(tarx[i], tary[i])) {
        inbounds = false;
        break;
      }
    }

    if (inbounds) {
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 0;
        loc[i] = getb(tarx[i], tary[i]);
      }
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 2;
        loc[i].col = tcol;
      }

      xpos += x;
      ypos += y;

      txr[0] +=  txr[1];
      txr[1] +=  txr[2];
      txr[2] +=  txr[3];
      txr[3]  =  txr[0]-txr[1]+txr[2]-txr[3];
      txr[2] += -txr[1]+txr[0]-txr[3];
      txr[1] += -txr[0]+txr[3];
      txr[0] -=  txr[3];

      tyr[0] +=  tyr[1];
      tyr[1] +=  tyr[2];
      tyr[2] +=  tyr[3];
      tyr[3]  =  tyr[0]-tyr[1]+tyr[2]-tyr[3];
      tyr[2] += -tyr[1]+tyr[0]-tyr[3];
      tyr[1] += -tyr[0]+tyr[3];
      tyr[0] -=  tyr[3];
    }

    return inbounds;
  }

  // function unused and not updated for use
  void rotateCCW() {
    int[] tarx = new int[4];
    int[] tary = new int[4];
    for (int i = 0; i < 4; i++) {
      tarx[i] = xpos+(loc[i].ypos-ypos)-tyr[3];
      tary[i] = ypos-(loc[i].xpos-xpos)+txr[3];
    }

    boolean inbounds = true;

    for (int i = 0; i < 4; i++) {
      if (!free(tarx[i], tary[i])) {
        inbounds = false;
        break;
      }
    }

    if (inbounds) {
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 0;
        loc[i] = getb(tarx[i], tary[i]);
      }
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 2;
        loc[i].col = tcol;
      }

      txr[3] +=  txr[2];
      txr[2] +=  txr[1];
      txr[1] +=  txr[0];
      txr[0]  =  txr[3]-txr[2]+txr[1]-txr[0];
      txr[1] += -txr[2]+txr[3]-txr[0];
      txr[2] += -txr[3]+txr[0];
      txr[3] -=  txr[0];

      tyr[3] +=  tyr[2];
      tyr[2] +=  tyr[1];
      tyr[1] +=  tyr[0];
      tyr[0]  =  tyr[3]-tyr[2]+tyr[1]-tyr[0];
      tyr[1] += -tyr[2]+tyr[3]-tyr[0];
      tyr[2] += -tyr[3]+tyr[0];
      tyr[3] -=  tyr[0];
    }
  }

  void tick() {
    fall--;
    if (fall <= 0) {
      fall = delay;
      int[] tarx = new int[4];
      int[] tary = new int[4];
      for (int i = 0; i < 4; i++) {
        tarx[i] = loc[i].xpos;
        tary[i] = loc[i].ypos+1;
      }

      boolean inbounds = true;

      for (int i = 0; i < 4; i++) {
        if (!free(tarx[i], tary[i])) {
          inbounds = false;
          break;
        }
      }
      if (inbounds) {
        for (int i = 0; i < 4; i++) {
          loc[i].occ = 0;
          loc[i] = getb(tarx[i], tary[i]);
        }
        for (int i = 0; i < 4; i++) {
          loc[i].occ = 2;
          loc[i].col = tcol;
        }
        ypos++;
        lock = false;
      } else {
        if (!lock)
          lock = true;
        else {
          for (int i = 0; i < 4; i++) {
            loc[i].occ = 1;
          }
          lines();
          reset();
        }
      }
    }
  }

  void down() {
    int[] tarx = new int[4];
    int[] tary = new int[4];
    for (int i = 0; i < 4; i++) {
      tarx[i] = loc[i].xpos;
      tary[i] = loc[i].ypos+1;
    }

    boolean inbounds = true;

    for (int i = 0; i < 4; i++) {
      if (!free(tarx[i], tary[i])) {
        inbounds = false;
        break;
      }
    }
    if (inbounds) {
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 0;
        loc[i] = getb(tarx[i], tary[i]);
      }
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 2;
        loc[i].col = tcol;
      }
      ypos++;
      lock = false;
      fall = delay;
    } else {
      if (!lock)
        lock = true;
      else {
        for (int i = 0; i < 4; i++) {
          loc[i].occ = 1;
        }
        lines();
        reset();
      }
    }
  }

  void left() {
    int[] tarx = new int[4];
    int[] tary = new int[4];
    for (int i = 0; i < 4; i++) {
      tarx[i] = loc[i].xpos-1;
      tary[i] = loc[i].ypos;
    }

    boolean inbounds = true;

    for (int i = 0; i < 4; i++) {
      if (!free(tarx[i], tary[i])) {
        inbounds = false;
        break;
      }
    }

    if (inbounds) {
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 0;
        loc[i] = getb(tarx[i], tary[i]);
      }
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 2;
        loc[i].col = tcol;
      }
      xpos--;
    }
  }

  void right() {
    int[] tarx = new int[4];
    int[] tary = new int[4];
    for (int i = 0; i < 4; i++) {
      tarx[i] = loc[i].xpos+1;
      tary[i] = loc[i].ypos;
    }

    boolean inbounds = true;

    for (int i = 0; i < 4; i++) {
      if (!free(tarx[i], tary[i])) {
        inbounds = false;
        break;
      }
    }
    if (inbounds) {
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 0;
        loc[i] = getb(tarx[i], tary[i]);
      }
      for (int i = 0; i < 4; i++) {
        loc[i].occ = 2;
        loc[i].col = tcol;
      }
      xpos++;
    }
  }

  void lines() {
    ArrayList<Integer> toClear = new ArrayList();
    for (int j = 0; j < fieldY; j++) {
      boolean tempb = true;
      for (int i = 0; i < fieldX; i++) {
        if (getb(i, j).occ == 0) {
          tempb = false;
          break;
        }
      }
      if (tempb) {
        toClear.add(j);
        playerB[1-player].delay*=.95;
      }
    }
    for (Integer a : toClear) {
      for (int j = a; j >= 1; j--)
        for (int i = 0; i < fieldX; i++) {
          getb(i, j).occ = getb(i, j-1).occ;
          getb(i, j).col = getb(i, j-1).col;
        }
    }
  }

  Block getb(int x, int y) {
    return players.get(player).get(x).get(y);
  }

  boolean free(int x, int y) {
    if (x < 0 || y < 0 || x >= fieldX || y >= fieldY) {
      return false;
    }
    if (getb(x, y).occ == 1) {
      return false;
    } else return true;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') 
    playerB[0].rotateCW();
  if (key == 'a' || key == 'A') 
    playerB[0].left();
  if (key == 's' || key == 'S') { 
    int tempc = 0;
    while (!playerB[0].lock) {
      playerB[0].down();
      tempc++;
    }
    if (tempc != 0)
      playerB[0].lock = false;
    else {
      playerB[0].lock = true;
      playerB[0].down();
    }
  }
  if (key == 'd' || key == 'D') 
    playerB[0].right();

  if (key == CODED) 
    switch(keyCode) {
    case UP:
      playerB[1].rotateCW();
      break;
    case RIGHT:
      playerB[1].right();
      break;
    case LEFT:
      playerB[1].left();
      break;
    case DOWN:
      int tempc = 0;
      while (!playerB[1].lock) {
        playerB[1].down();
        tempc++;
      }
      if (tempc != 0)
        playerB[1].lock = false;
      else {
        playerB[1].lock = true;
        playerB[1].down();
      }
      break;
    }

  if (key == 'r' || key == 'R')
    startup();
}



