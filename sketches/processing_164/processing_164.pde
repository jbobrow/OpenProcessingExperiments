
import processing.opengl.*;

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// Create array for the squares
Square squares[][] = new Square[9][9];
Pointer pointer;

// The curent turn.  FALSE == Blue. TRUE == Green.
boolean turn;
boolean gameOver;

int mx, my;   // mouse position by square

PFont font;
PFont scoreFont;

String team = " ";

int totalBlue = 0;
int totalGreen = 0;
int totalBlank = 0;

// create vars for sound
AudioPlayer music;
AudioPlayer s_1;
AudioPlayer s_2;
AudioPlayer s_3;
AudioPlayer s_4;
AudioPlayer s_5;
AudioPlayer s_6;
AudioPlayer s_7;
AudioPlayer s_8;

float randomNote;


// SETUP~~~~~~~~~~~~~~~~~~~~~~~~

void setup() {
  size(541,630, OPENGL);
  background(0);
  smooth();
  noCursor();

  Minim.start(this);  // start audio lib stuff

  music = Minim.loadFile("game_tuh.mp3");
  s_1 = Minim.loadFile("1.mp3");
  s_2 = Minim.loadFile("2.mp3");
  s_3 = Minim.loadFile("3.mp3");
  s_4 = Minim.loadFile("4.mp3");
  s_5 = Minim.loadFile("5.mp3");
  s_6 = Minim.loadFile("6.mp3");
  s_7 = Minim.loadFile("7.mp3");
  s_8 = Minim.loadFile("8.mp3");

  music.loop();  // play song


  gameOver = false;

  font = loadFont("BankGothic-Medium-30.vlw");
  scoreFont = loadFont("BradleyHandITCTT-Bold-25.vlw");

  //create the square objects
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {

      squares[i][j] = new Square(i*60,j*60);
    }
  }

  // create the Central Nyeh
  squares[4][4].createNyeh();

  // create Border Nyehs
  for (int i = 0; i<9; i++) {
    squares[i][0].createBorder();
  }
  for (int i = 0; i<9; i++) {
    squares[0][i].createBorder();
  }
  for (int i = 0; i<9; i++) {
    squares[i][8].createBorder();
  }
  for (int i = 0; i<9; i++) {
    squares[8][i].createBorder();
  }



  // Blue starts game
  turn = false;
  team = "Blue";

  pointer = new Pointer();

} // end setup

// DRAW~~~~~~~~~~~~~~~~~~~~~~~~~~~

void draw() {

  background(0);


  mx = constrain(mx,0,8);
  my = constrain(my,0,8);

  mx = mouseX/60;
  my = mouseY/60;

  // println("square "+ mx + my);
  // println("mouse XY = " + mouseX + ", " + mouseY);
  // println("team: " + squares[mouseX/60][mouseY/60].team);
  // println("total blanks: " + totalBlank);

  // Display the squares  
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      squares[i][j].display();
    }
  }

  // display current team
  if (turn == false) {
    team = "Blue";
  } 
  else if (turn == true) {
    team = "Green";
  }

  if (team.equals("Blue")) {
    fill(2,24,211);
    textFont(font);
    text(team + "'s Turn",30,590);
  } 
  else if (team.equals("Green")) {
    fill(6,124,21);
    textFont(font);
    text(team + "'s Turn",30,590);
  }

  // display score
  fill(255);
  textFont(scoreFont);
  text("Score: ",300,590);
  fill(2,24,211);
  text(totalBlue,400,590);
  fill(6,124,21);
  text(totalGreen, 475,590);

  // count pieces
  totalBlue = 0;
  totalGreen = 0;
  totalBlank = 0;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (squares[i][j].getTeam() == 0) {
        totalBlank++;
      }
      else if (squares[i][j].getTeam() == 1) {
        totalBlue++;
      } 
      else if (squares[i][j].getTeam() == 2) {
        totalGreen++;
      }
    }
  }

  // check win
  if (totalBlank == 0) {
    if (totalBlue > totalGreen) {
      textFont(font);
      fill(2,24,211);
      text("BLUE WINS!", 189,527);
    } 
    else if (totalGreen > totalBlue) {
      textFont(font);
      fill(6,124,21);
      text("GREEN WINS!",180,527);
    }
    else if (totalBlue == totalGreen) {
      textFont(font);
      fill(255);
      text("It's a Tie!", 180, 527);
    }
  }

  pointer.move();



} // end draw

// MOUSE PRESSED~~~~~~~~~~~~~~~~~~~

void mousePressed() {

  if (my < 9) {

    // if the spot is open...
    if (squares[mx][my].getTeam() == 0) {

      // ...and if next to a Tuh, Fuh, or Nyeh, you can create a piece
      if (
      squares[mx-1][my].getTeam() == 1 || 
        squares[mx+1][my].getTeam() == 1 || 
        squares[mx][my+1].getTeam() == 1 || 
        squares[mx][my-1].getTeam() == 1 ||
        squares[mx-1][my].getTeam() == 2 || 
        squares[mx+1][my].getTeam() == 2 || 
        squares[mx][my+1].getTeam() == 2 || 
        squares[mx][my-1].getTeam() == 2 ||
        squares[mx-1][my].getTeam() == 3 || 
        squares[mx+1][my].getTeam() == 3 || 
        squares[mx][my+1].getTeam() == 3 || 
        squares[mx][my-1].getTeam() == 3) {

        // create Tuh if blue's turn , create Fuh if green's turn
        if (turn == false) {
          squares[mx][my].createTuh();
          randomNote = random(1,8);    // pick a random value for sound effects
          playNote(randomNote);


          //switch turns
          turn = !turn;
        } 
        else if (turn == true) {
          squares[mx][my].createFuh();
          randomNote = random(1,8);    // pick a random value for sound effects
          playNote(randomNote);
          //switch turns
          turn = !turn;
        }
      }


    } // end if not Nyeh

  } 
  else {
  }



} // end mousePressed



void stop()
{
  // close Minim stuff
  music.close();
  s_1.close();
  s_2.close();
  s_3.close();
  s_4.close();
  s_5.close();
  s_6.close();
  s_7.close();
  s_8.close();

  // close everything else
  super.stop();
}


