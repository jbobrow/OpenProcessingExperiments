

// four in a row .....  http://forum.processing.org/topic/information-about-a-program
// 
// see http://de.wikibooks.org/wiki/Vier_gewinnt:_Allgemeine_Taktiken_und_Tipps

//
// this version: 
//         * not only random, but also updatePCMoveForHumanVersusPC_WinFinder()
//         * with Pattern checking (offensive and defensive) 
//         * control speed during auto play with 's' (or restart with 'n')
//         * help screen 
//
// states 
final int stateMenu = 0;
final int statePlay = 1;
final int stateHelp = 2;
int state;
//
// vars for the game logic
// human versus human OR human versus PC OR PC vs. PC?
final int humanversushuman = 0;
final int humanversusPC = 1;
final int PCversusPC = 2;
int modeWhoVersusWho = humanversushuman;  
//
// speed For Auto Play (when playing PCversusPC)  
int[] speedForAutoPlay = {
  0, 92, 2000, 4000
} 
; // can be 1, 92 or 2000 or so
int indexSFAP = 1;
//
//
// flags for the game logic
boolean humanMustMakeHisMove = true; // whose turn is it ? human / black = true
boolean PC_AI_is_Random = false; 
boolean showCountMove = true; 
//
//
int count = 0; // moves count for human versus human mainly  
final int rows = 6;
final int cols = 7;
// who won?
int winner = 0;
// the board
CircleButton[][] grid = new CircleButton[cols][rows];
int[][] gridChecker = new int[cols][rows];
// smaller vars
boolean locked = false;  
boolean gameOn = true;   // gets false when somebody wins 
PFont font;
int timer;
int countRed;
int countBlack;
int countDraw;

// ----------------------------------------------------------------------

void setup()
{
  // runs only once
  //
  size(700, 600);
  smooth();
  font = createFont("ARCARTER-78.vlw", 14);
  smallSetup();
}

void smallSetup() {
  // runs every time a new game is started
  //
  state = stateMenu;
  //
  background(255, 204, 0);
  //
  for (int a = 0; a<cols; a++) {
    for (int b = 0; b<rows; b++) {
      gridChecker[a][b] = 10;
    }
  }
  int a;
  int b;
  for ( a = 0; a<cols; a++) {
    for (b = 0; b<rows; b++) {
      grid[a][b] = new CircleButton(100*a + 50, 100*b + 50, 80, color(255), color(153));
    }
  }

  color buttoncolor = color(204);
  color highlight = color(153);
  ellipseMode(CENTER);
  println("New game.");
  count = 0;
  gameOn = true;
  timer=millis();
  //
} // func 

void draw()
{
  // the main routine. It handels the states. 
  switch (state) {

  case stateMenu:
    showMenu(); 
    break;

  case stateHelp:
    showHelp();
    break;

  case statePlay:
    playGame();
    break;

  default:
    println ("Unknown state (in draw) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch

  // println (humanMustMakeHisMove);
} // func 

// ----------------------------------------------------------------

void keyPressed() {
  // keyboard. Also different depending on the state.
  switch (state) {

  case stateMenu:
    keyPressedForStateMenu();
    break;

  case stateHelp:
    keyPressedForStateHelp();
    break;

  case statePlay:
    keyPressedForStatePlay();
    break;

  default:
    println ("Unknown state (in keypressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
}

void keyPressedForStateMenu() { 
  // 
  switch(key) {

  case '1':
    modeWhoVersusWho = humanversushuman; 
    state = statePlay;
    break;

  case '2':
    modeWhoVersusWho = humanversusPC;
    state = statePlay; 
    break;

  case '3':
    modeWhoVersusWho = PCversusPC;
    state = statePlay; 
    break;

  case 'H':
  case 'h':
    state = stateHelp; 
    break;

  case 'x':
  case 'X':
    // quit
    exit();
    break;

  default:
    // do nothing 
    break;
  }// switch
  //
} // func 

void keyPressedForStateHelp() {
  // any key is possible 
  switch(key) {

  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func 

void keyPressedForStatePlay() {
  switch(key) {

  case 'n':
  case 'N':
    smallSetup();
    break;

  case 's':
  case 'S':
    indexSFAP++;
    if (indexSFAP>=speedForAutoPlay.length)
      indexSFAP=0;
    break;

  default:
    // do nothing 
    break;
  } // switch
  //
} // func 

// ----------------------------------------------------------------

void mousePressed() {
  // mouse input. Also different depending on the state.
  // only for restart 

  switch (state) {

  case stateHelp: 
  case stateMenu:
    // do nothing 
    break;

  case statePlay:
    if (gameOn == false) {
      gameOn = true;
      smallSetup();
    } // if
    break;

  default:
    println ("Unknown state (in mousepressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
} // func 

// ----------------------------------------------------------------

void showMenu() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  shadowtext(" Four in a row ", 150, 100, 3);
  textSize(14);
  text("Press 1 for human versus human ", 100, 200);
  text("Press 2 for PC versus human ", 100, 220);
  text("Press 3 for PC versus PC ", 100, 240);  
  text("Press h for help ", 100, 260);
  //  
  text("Press x to quit ", 100, 310);
}

//

void showHelp() {
  int posY = 100; // y-position for each line of text
  //
  background(255, 204, 0);
  fill(0);
  textSize(32);
  shadowtext(" Help for Four in a row ", 150, posY, 3);
  posY+=100;
  textSize(14);
  text("You can play against a friend ", 100, posY ); 
  posY+=20;
  text("or against the PC.  ", 100, posY ); 
  posY+=30;
  text("In the game, press N for a new game and", 100, posY ); 
  posY+=20;
  text("press S for changing speed (in a PC versus PC Game).", 100, posY ); 
  posY+=30;
  text("To place a piece, click on the lowest empty cell in a column", 100, posY); 
  posY+=20;
  text("with the mouse.", 100, posY);
  posY+=30;
  text("Your goal is to get four pieces in a row ", 100, posY);
  posY+=20;
  text("horizontal, vertical or diagonal.", 100, posY);
  //
  posY+=60;
  text("Press any key. ", 100, posY);
  //
} // func 

//

void playGame() {
  //
  background(255, 204, 0);
  //
  switch (modeWhoVersusWho) {

  case humanversushuman: 
    // two humans play 
    update(mouseX, mouseY);
    break;

  case humanversusPC:
    // human versus PC
    // whose move is it? 
    if (humanMustMakeHisMove) {
      // human
      updateHumanMoveForHumanVersusPC(mouseX, mouseY);
    } // if 
    else {
      // PC 
      if (PC_AI_is_Random)
        updatePCMoveForHumanVersusPC_Random();
      else 
        updatePCMoveForHumanVersusPC_WinFinder();
    } // else
    break;

  case PCversusPC:
    // PC versus PC
    if (gameOn) 
    {
      if (timer+speedForAutoPlay[indexSFAP] < millis())
      {
        timer=millis();
        // ----

        if (count % 2 == 0)
        {
          humanMustMakeHisMove=true; // red 
          PC_AI_is_Random=false;  // AI 
          println(stringFromPlayer(humanMustMakeHisMove) + " has AI: " + !PC_AI_is_Random  + ", "+humanMustMakeHisMove);
        }
        else 
        {
          humanMustMakeHisMove=false; // black
          PC_AI_is_Random=true;   // no AI
          println(stringFromPlayer(humanMustMakeHisMove) + " has AI: " + !PC_AI_is_Random + ", "+humanMustMakeHisMove);
        }
        // ---- make move
        if (PC_AI_is_Random)
          updatePCMoveForHumanVersusPC_Random();
        else 
          updatePCMoveForHumanVersusPC_WinFinder();
      } // if timer
    } // if gameOn
    if (!gameOn) {
      if (timer+speedForAutoPlay[indexSFAP] < millis())
      {
        smallSetup();
        // auto play 
        state            = statePlay;
        modeWhoVersusWho = PCversusPC;
        gameOn           = true;
        timer            = millis();
      }
    }
    break;

  default:
    // error
    break;
  } // switch
  //
  gameStuff();
  //
} // func 

// -------------------------------------------------------------

void gameStuff() {
  // show board:
  // show lines 
  stroke(126);
  for ( int c = 1; c <= cols; c++) {
    line( c*(width/cols), 0, c*(width/cols), height);
  }
  for (int c = 1; c<=rows; c++) {
    line(0, c*(height/rows), width, c*(height/rows));
  }
  //
  // show circles
  for (int c = 0; c<cols; c++) {
    for (int d = 0; d<rows; d++) {
      grid[c][d].display();
    }
  }
  // 
  // show score 
  fill(0);
  textSize(10);
  text(countRed+":"+countBlack+" and draws: "+countDraw, width-200, 30);
  //
  // draw
  if (checkDraw ()) {
    println ("Draw");
    countDraw++;
    gameOn = false;
  }
  //
  // show win (if somebody won) : 
  if (checkWin() == true) {
    if (gameOn) 
      timer=millis();
    textFont(font, 65);
    if (winner == 4) {
      shadowtext("Red Wins!", width/4, height/2, 3);
      if (gameOn) println ("Red Wins!");
      if (gameOn) countRed++;
    }
    else if (winner == 8) {
      shadowtext("Black Wins!", width/3.5, height/2, 3);
      if (gameOn) println ("Black Wins!");
      if (gameOn) countBlack++;
    }
    shadowtext("Click to play again", width/5.5, height*.3, 1);
    gameOn = false;
  } // if
  //
} // func 

void shadowtext (String s, float x, float y, int o) {
  fill(100, 100);
  text(s, x+o, y+o);
  fill(58, 12, 247);
  text(s, x, y);
}

// -------------------------------------------------------------

boolean checkDraw() {
  int test=0;
  for (int a=0; a < rows; a++) {
    for (int b=0; b < cols; b++) {
      if (gridChecker[b][a] == 1 ||  gridChecker[b][a] == 2)
        test++;
    }
  }
  return (test>=rows*cols);
}

boolean checkWin()
{
  //
  //horizontal
  for (int a=0; a < rows; a++) {
    for (int b=0; b < cols-3; b++) {
      int tCheck = (gridChecker[b][a]) + (gridChecker[b+1][a]) + (gridChecker[b+2][a]) + (gridChecker[b+3][a]);
      if (tCheck == 8 || tCheck == 4)
      {
        winner = tCheck;
        return true;
      }
    }
  }


  //vertical
  for (int a=0; a < rows-3; a++) {
    for (int b=0; b < cols; b++) {
      int tCheck = (gridChecker[b][a]) + (gridChecker[b][a+1]) + (gridChecker[b][a+2]) + (gridChecker[b][a+3]);
      if (tCheck == 8 || tCheck == 4)
      {
        winner = tCheck;
        return true;
      }
    }
  }


  //diagonals
  for (int a=0; a < rows-3; a++) {
    for (int b=0; b < cols-3; b++) {
      int tCheck = (gridChecker[b][a]) + (gridChecker[b+1][a+1]) + (gridChecker[b+2][a+2]) + (gridChecker[b+3][a+3]);
      if (tCheck == 8 || tCheck == 4)
      {
        winner = tCheck;
        return true;
      }
    }
  }

  for (int a=0; a < rows-3; a++) {
    for (int b=3; b < cols; b++) {
      int tCheck = (gridChecker[b][a]) + (gridChecker[b-1][a+1]) + (gridChecker[b-2][a+2]) + (gridChecker[b-3][a+3]);
      if (tCheck == 8 || tCheck == 4)
      {
        winner = tCheck;
        return true;
      }
    }
  }

  return false;
}

// -------------------------------------------------------------

void update(int x, int y)
{
  // enter human move for human versus human
  if (mousePressed && gameOn) {
    for (int c = 0; c<cols; c++) {
      for (int d = 0; d<rows; d++) {
        if (grid[c][d].pressed() && (grid[c][d].getColor() == color(255)|| grid[c][d].getColor() == color(153)) ) {
          if (d == 5 || (gridChecker[c][d + 1] == 1 || gridChecker[c][d+1] == 2)) {
            grid[c][d].setHighlightOff();
            count++;
            if (count % 2 == 1) {
              grid[c][d].setColor(color(255, 0, 0));
              gridChecker[c][d] = 1;
            }
            else {
              grid[c][d].setColor(color(0));
              gridChecker[c][d] = 2;
            }
          }
        }
      }
    }
  }
  if (locked == false && gameOn) {
    for (int c = 0; c<cols; c++) {
      for (int d = 0; d<rows; d++) {
        grid[c][d].update();
      }
    }
  }
  else {
    locked = false;
  }
}

// -------------------------------------------------------------

void updateHumanMoveForHumanVersusPC(int x, int y)
{
  // enter human move for human versus PC
  if (mousePressed && gameOn) {
    for (int c = 0; c<cols; c++) {
      for (int d = 0; d<rows; d++) {
        if (grid[c][d].pressed() && (grid[c][d].getColor() == color(255)|| grid[c][d].getColor() == color(153)) ) {
          if (d == 5 || (gridChecker[c][d + 1] == 1 || gridChecker[c][d+1] == 2)) {
            grid[c][d].setHighlightOff();
            count++;
            grid[c][d].setColor(color(255, 0, 0));
            gridChecker[c][d] = 1;
            humanMustMakeHisMove = !humanMustMakeHisMove;
          }
        }
      }
    }
  }
  if (locked == false && gameOn) {
    for (int c = 0; c<cols; c++) {
      for (int d = 0; d<rows; d++) {
        grid[c][d].update();
      }
    }
  }
  else {
    locked = false;
  }
}

// -------------------------------------------------------------

void updatePCMoveForHumanVersusPC_Random()
{
  // PC Move for human versus PC - random 
  boolean donePC = false;
  //
  if (gameOn) { 
    // try 50 times to find a position 
    for (int i=0; i<50; i++) {
      // choose a position via random
      int c=int(random(cols));
      for (int d = 0; d<rows; d++) {
        if ( (grid[c][d].getColor() == color(255) || grid[c][d].getColor() == color(153)) ) {
          if (d == 5 || (gridChecker[c][d + 1] == 1 || gridChecker[c][d+1] == 2)) {
            grid[c][d].setHighlightOff();
            count++;
            grid[c][d].setColor(colorFromPlayer(humanMustMakeHisMove));
            gridChecker[c][d] = intFromPlayer(humanMustMakeHisMove);
            donePC = true;
          }
        }
      } // for 
      if (donePC) 
        break;
    } // for 
    //
    // in the unlikely case he didn't find any position via random
    if (!donePC)  
    {
      println ("couldn't find PC Move - now try linear. ");
      for (int c=0; c<cols; c++) {
        for (int d = 0; d<rows; d++) {
          if ( (grid[c][d].getColor() == color(255) || grid[c][d].getColor() == color(153)) ) {
            if (d == 5 || (gridChecker[c][d + 1] == 1 || gridChecker[c][d+1] == 2)) {
              grid[c][d].setHighlightOff();
              count++;
              grid[c][d].setColor(colorFromPlayer(humanMustMakeHisMove));
              gridChecker[c][d] = intFromPlayer(humanMustMakeHisMove);
              donePC = true;
            }
          }
        } // for 
        if (donePC) 
          break;
      } // for
    } // if
    //
    // in the very unlikely case he didn't find any position at all
    if (!donePC) 
      println ("couldn't find a PC Move. ");
    //
    if (locked == false && gameOn) {
      for (int c2 = 0; c2<cols; c2++) {
        for (int d = 0; d<rows; d++) {
          grid[c2][d].update();
        }
      }
    }
    else {
      locked = false;
    }
  }
  humanMustMakeHisMove = true;
}

// -------------------------------------------------------------

void updatePCMoveForHumanVersusPC_WinFinder()
{
  // PC Move for human versus PC - win finder  
  boolean donePC = false;
  //
  if (gameOn) { 
    // AI
    //
    // choose a position via going from left to right
    // simulate move of the PC
    for (int c=0; c<cols; c++) {
      if (!donePC) {
        for (int d = 0; d<rows; d++) {
          if ( (grid[c][d].getColor() == color(255) || grid[c][d].getColor() == color(153)) ) {
            if (d == 5 || (gridChecker[c][d + 1] == 1 || gridChecker[c][d+1] == 2)) {
              // save 
              int oldgridChecker = gridChecker[c][d];
              // make move 
              grid[c][d].setHighlightOff();
              grid[c][d].setColor(colorFromPlayer(humanMustMakeHisMove));
              gridChecker[c][d] = intFromPlayer(humanMustMakeHisMove);
              // win? 
              if (checkWin() == true) {
                if (winner==winnerFromPlayer(humanMustMakeHisMove)) {
                  // good move
                  donePC = true;
                  winner = 0;
                  count++;
                  grid[c][d].moveCount = count;
                  println ("AI winning move found");
                } // if
              } // if
              if (!donePC) {
                // restore 
                gridChecker[c][d] = oldgridChecker;
                grid[c][d].highlight=true;
                grid[c][d].setColor(color(255)); // white
              }
              else {
                break;
              }
            }
          }
        } // for 
        if (donePC) 
          break;
      } // if
    } // for

    // ---

    if (!donePC) { 
      // choose a position via going from left to right
      // simulate move of the opponent 
      for (int c=0; c<cols; c++) {
        if (!donePC) {
          for (int d = 0; d<rows; d++) {
            if (!donePC) {
              if ( (grid[c][d].getColor() == color(255) || grid[c][d].getColor() == color(153)) ) {
                if (d == 5 || (gridChecker[c][d + 1] == 1 || gridChecker[c][d+1] == 2)) {
                  // save 
                  int oldgridChecker = gridChecker[c][d];
                  // make move 
                  grid[c][d].setHighlightOff();
                  grid[c][d].setColor(colorFromPlayer( !  humanMustMakeHisMove ) );
                  gridChecker[c][d] = intFromPlayer( ! humanMustMakeHisMove );   // simulate move of the opponent 
                  // win? 
                  if (checkWin() == true) {
                    if (winner==winnerFromPlayer( ! humanMustMakeHisMove )) {
                      if (!donePC) {
                        // 
                        // this is the move - success 
                        donePC = true;
                        winner = 0;
                        count++;
                        gridChecker[c][d] = intFromPlayer( humanMustMakeHisMove );  // set move to PC move 
                        grid[c][d].setColor(colorFromPlayer( humanMustMakeHisMove ));
                        println ("AI winning move found for opponent. " + humanMustMakeHisMove);
                      } // if
                    } // if
                  } // if
                  if (!donePC) {
                    // restore 
                    gridChecker[c][d] = oldgridChecker;
                    grid[c][d].highlight=true;
                    grid[c][d].setColor(color(255)); // white
                  }
                } // if
              } // if
            } // if
          } // for
        } // if
      } // for
    } // if 


    // ------

    if (!donePC) {
      // search a pattern of 2   - offensive action 
      if (intFromPlayer( humanMustMakeHisMove ) == 1) {
        // reds move    
        donePC=checkPattern(  2, 0, 2  );
      }
      else 
      {
        // blacks move    
        donePC=checkPattern(  0, 2, 2  );
      }
      if (donePC) {
        println ("Pattern");
      } // if
    } // if 

    // ------

    if (!donePC) {
      // search a pattern of 1      - offensive action 
      if (intFromPlayer( humanMustMakeHisMove ) == 1) {
        // reds move    
        donePC=checkPattern(  1, 0, 3  );
      }
      else 
      {
        // blacks move    
        donePC=checkPattern(  0, 1, 3  );
      }
      if (donePC) {
        println ("Pattern");
      } // if
    } // if 

    // -----------------------------------------------------

    if (!donePC) {
      // search a pattern of 2   - defensive action 
      if (intFromPlayer( humanMustMakeHisMove ) == 1) {
        // reds move: block opponent (black) when he has 2    
        donePC=checkPattern(  0, 2, 2  );
      }
      else 
      {
        // blacks move: block opponent (red) when he has 2        
        donePC=checkPattern(  2, 0, 2  );
      }
      if (donePC) {
        println ("Pattern");
      } // if
    } // if 

    // ------

    if (!donePC) {
      // search a pattern of 1    - defensive action 
      if (intFromPlayer( humanMustMakeHisMove ) == 1) {
        // reds move: block opponent (black) when he has 1
        donePC=checkPattern(  0, 1, 3  );
      }
      else 
      {
        // blacks move: block opponent (red) when he has 1      
        donePC=checkPattern(  1, 0, 3  );
      }
      if (donePC) {
        println ("Pattern");
      } // if
    } // if 

    // ------

    // the last possibility: random 
    if (!donePC) {
      updatePCMoveForHumanVersusPC_Random();
    } // if

    humanMustMakeHisMove = true;
  } // if
} // func 

// -----------------------------------------------------------------------

boolean checkPattern( int findRed, int findBlack, int findEmpty )
{
  // A powerful function that checks 4 cells next to each other and
  // when a given pattern is matched sets any empty cell within the row. 
  // A pattern is a combination like 2 red, 0 black and 2 empty cells.
  // The order of the cells is not defined. 
  // Which empty cell is chosen is also not said.
  //  
  // For this function the sum must be 4 (he checks only 4 cells). 
  //
  if ((findRed + findBlack + findEmpty) != 4) {
    println ( "boolean checkPattern is not sum of 4. +++++++++++" );
    exit(); // code error
  } 
  //
  CountPieces counter = new CountPieces ();  // int findRed, int findBlack, int findEmpty
  //
  //horizontal
  for (int a=0; a < rows; a++) {
    for (int b=0; b < cols-3; b++) {
      counter = new CountPieces ();
      // count the cell types  
      counter.foundEmptyField.x=-1;
      counter.countField(b, a) ;
      counter.countField(b+1, a) ;
      counter.countField(b+2, a) ;
      counter.countField(b+3, a) ;
      // does pattern match ?
      if (counter.red==findRed && counter.black == findBlack && counter.empty == findEmpty) {
        // counter.display (); 
        // has an empty field been found? 
        if (counter.foundEmptyField.x!=-1) {
          if (makeMove(int(counter.foundEmptyField.x), int(counter.foundEmptyField.y))) {
            println("make move horizontal");
            return true;
          }
        }
      }
    }
  }

  //vertical
  for (int a=0; a < rows-3; a++) {
    for (int b=0; b < cols; b++) {
      counter = new CountPieces ();
      // count the cell types  
      counter.foundEmptyField.x=-1;
      counter.countField(b, a) ;
      counter.countField(b, a+1) ;
      counter.countField(b, a+2) ;
      counter.countField(b, a+3) ;
      // does pattern match ?
      if (counter.red==findRed && counter.black == findBlack && counter.empty == findEmpty) {
        // counter.display (); 
        // has an empty field been found?
        if (counter.foundEmptyField.x!=-1) {
          if (makeMove(int(counter.foundEmptyField.x), int(counter.foundEmptyField.y))) {
            println("make move vertical");
            return true;
          }
        }
      }
    }
  }
  //
  // diagonals
  for (int a=0; a < rows-3; a++) {
    for (int b=0; b < cols-3; b++) {
      counter = new CountPieces ();
      // count the cell types  
      counter.foundEmptyField.x=-1;
      counter.countField(b, a) ;
      counter.countField(b+1, a+1) ;
      counter.countField(b+2, a+2) ;
      counter.countField(b+3, a+3) ;
      // does pattern match ?
      if (counter.red==findRed && counter.black == findBlack && counter.empty == findEmpty) {
        // counter.display (); 
        // has an empty field been found?
        if (counter.foundEmptyField.x!=-1) {
          if (makeMove(int(counter.foundEmptyField.x), int(counter.foundEmptyField.y))) {
            println("make move vertical");
            return true;
          }
        }
      }
    }
  }

  for (int a=0; a < rows-3; a++) {
    for (int b=3; b < cols; b++) {
      counter = new CountPieces ();
      // count the cell types  
      counter.foundEmptyField.x=-1;
      counter.countField(b, a) ;
      counter.countField(b-1, a+1) ;
      counter.countField(b-2, a+2) ;
      counter.countField(b-3, a+3) ;
      // does pattern match ?
      if (counter.red==findRed && counter.black == findBlack && counter.empty == findEmpty) {
        // counter.display (); 
        // has an empty field been found?
        if (counter.foundEmptyField.x!=-1) {
          if (makeMove(int(counter.foundEmptyField.x), int(counter.foundEmptyField.y))) {
            println("make move vertical");
            return true;
          }
        }
      }
    }
  }
  return false;
}

boolean makeMove ( int c, int d  ) {
  boolean doneMakeMove = false;  
  for (int d1 = 0; d1<rows; d1++) {
    if ( (grid[c][d1].getColor() == color(255) || grid[c][d1].getColor() == color(153)) ) {
      if (d1 == 5 || (gridChecker[c][d1 + 1] == 1 || gridChecker[c][d1+1] == 2)) {
        if (d==d1) {
          grid[c][d].setHighlightOff();
          count++;
          grid[c][d].setColor(colorFromPlayer(humanMustMakeHisMove));
          gridChecker[c][d] = intFromPlayer(humanMustMakeHisMove);
          doneMakeMove = true;
        }
      }
    }
  }
  return doneMakeMove;
  //
}

// -----------------------------------------------------------------------

// minor tools: these tools evaluate humanMustMakeHisMove in different ways
color colorFromPlayer(boolean humanMustMakeHisMove) {
  // the color a red or black cell has
  if (humanMustMakeHisMove) 
    return color(255, 0, 0); // red
  else 
    return color(0, 0, 0);   // black
}

int intFromPlayer(boolean humanMustMakeHisMove) {
  // the value a red or black cell has
  if (humanMustMakeHisMove) 
    return 1; // 1 
  else 
    return 2; // 2
}

String stringFromPlayer(boolean humanMustMakeHisMove) {
  // text of the player
  if (humanMustMakeHisMove) 
    return "red";   //  1 
  else 
    return "black"; // 2
}

int winnerFromPlayer(boolean humanMustMakeHisMove) {
  // the count for detecting a win 
  if (humanMustMakeHisMove) 
    return 4;   // red
  else 
    return 8;   // black
}

// =======================================================================

class CountPieces {
  //
  int red=0;
  int black=0;
  int empty=0;
  PVector foundEmptyField = new PVector(-1, -1, 0);

  //
  void display () {
    println ( "count: " + red + " - " + black + " - " + empty ) ;
  } 
  //

  PVector countField (  int a, int b ) {
    //
    int gridCell = gridChecker[a][b] ;

    //PVector wasEmpty = new PVector(-1, -1, 0);
    // 
    switch (gridCell) {
    case 1: 
      red++; 
      break;
    case 2: 
      black++; 
      break;
    case 10: 
      empty++;
      foundEmptyField.x=a;
      foundEmptyField.y=b;
      break;
    default: 
      println ("Unknown cell error in 521"); 
      exit(); 
      break;
    } // switch
    return foundEmptyField;
  } // func 
  //
} // class 
//
// =======================================================================

class CircleButton
{
  // class for the cells in the grid 
  color basecolor;
  int x, y;
  int size;
  color highlightcolor;
  color currentcolor;
  boolean highlight;
  boolean over = false;
  boolean pressed = false; 
  int moveCount = 0;

  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight)
  { 
    //constructor
    x = ix;
    y = iy;
    size = isize;
    highlightcolor = ihighlight;
    currentcolor = icolor;
    highlight = true;
    moveCount = 0;
  } //constructor

  void setHighlightOff() {
    highlight = false;
  }

  void update()
  {
    if (over() && highlight) {
      currentcolor = highlightcolor;
    }
    else if (currentcolor == highlightcolor && !over()) {
      currentcolor = color(255);
    }
    else {
      // currentcolor = currentcolor;
    }
  }

  boolean pressed()
  {
    if (over) {
      locked = true;
      return true;
    }
    else {
      locked = false;
      return false;
    }
  }


  boolean overCircle(int x, int y, int diameter)
  {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    }
    else {
      return false;
    }
  }

  void setColor(color a) {
    currentcolor = a;
    moveCount = count;
  }

  color getColor() {
    return currentcolor;
  }

  boolean over()
  {
    if ( overCircle(x, y, size) ) {
      over = true;
      return true;
    }
    else {
      over = false;
      return false;
    }
  }

  void display()
  {
    smooth();
    stroke(currentcolor);
    fill(currentcolor);
    ellipse(x, y, size, size);
    if (showCountMove) {
      if (currentcolor==color(255, 0, 0) || currentcolor==color(0)) {
        textSize(10); 
        text(moveCount, x+size/2, y+size/2);
      } // if
    } // if
  } // method 
  //
} // class 
// 


