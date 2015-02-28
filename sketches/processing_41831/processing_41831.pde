
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Initialise Audio
Minim player;
AudioPlayer playerOne;
AudioPlayer playerTwo;
AudioPlayer playerThree;
AudioPlayer playerFour;



// Small Circles Array
int MCirclesNum = 32;
MediumC[] medium = new MediumC[MCirclesNum];

//Large Circles Array
int NotesNum = 20;
Note[] notes = new Note[NotesNum];


//Canvas Size
int canvasX = 700;
int canvasY = 400;

//Outer circle animation variables
float growEllipse = 190;
float growEllipseSwitch = 0;
float shrinkEllipse = 200;

//Inner circle animation variables
float growIEllipse = 180;
float growIEllipseSwitch = 0;
float shrinkIEllipse = 190;

//Middle circle animation variables
float growMEllipseSwitch = 0;
float shrinkMEllipse = 100;
float growMEllipse = 50;

//Large circle location
float lLocationX;
float lLocationY;
float sLocationX;
float sLocationY;
float StempX;
float StempY;
float LtempX;
float LtempY;

float xPos = 350;
float yPos = 200;

float nYPos = -100;
float notesSpawn = 2;

float onePlayed = 0;
float twoPlayed = 0;
float threePlayed = 0;

Boolean held = false;

float ballsReact = 0;


// -------------------------------------------------------------------------

void setup () {
  size(canvasX, canvasY);
  background(255);
  smooth();
  noStroke();


  //Fills Medium array
  for (int i = 0; i < medium.length; i++) {
    if (i <= 10) {
      yPos = yPos - 3;
    }

    //Initial placement of circles
    if (i == 11) {
      xPos = 350;
      yPos = 200;
    }

    if (i <= 21 && i > 11) {
      xPos = xPos - 3;
      yPos = yPos + 3;
    }

    if (i == 22) {
      xPos = 350;
      yPos = 200;
    }

    if (i <= 32 && i > 22) {
      xPos = xPos + 3;
      yPos = yPos + 3;
    }

    medium[i] = new MediumC (new PVector(xPos, yPos), 5, 10, 10);
  }

  //Fills note array
  for (int j = 0; j < NotesNum; j++) {

    notes[j] = new Note (new PVector(350, 200), 50, 10, 10);
  }
  //Load audio
  player = new Minim(this);
  playerOne = player.loadFile("1 (C).mp3");
  playerTwo = player.loadFile("2(D).mp3");
  playerThree = player.loadFile("3(D#).mp3");
  playerFour = player.loadFile("break.mp3");
}



// -------------------------------------------------------------------------

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  fill(255);

  circleGrowth();
  innerCircleGrowth();
  middleCircleGrowth();
  for (int i = 0; i < medium.length; i++) {

    sLocationX = medium[i].returnLocationX(StempX);
    sLocationY = medium[i].returnLocationY(StempY);
    //    println(sLocationX);

    strokeWeight(2);

    medium[i].combine(350, 200);
    touchBalls();

    if (ballsReact == 1) {
      if (i <= 10) {
        chimeNoiseOne();
      }

      if (i <= 20 && i > 11) {
        chimeNoiseTwo();
      }

      if (i <= 32 && i > 23) {
        chimeNoiseThree();
      }
    }
drumBeat();  
}

  for (int j = 0; j < notesSpawn; j++) {

    lLocationX = notes[j].returnLocationX();
    lLocationY = notes[j].returnLocationY();    
    notes[j].combineNotes(350, 200);
    fill(0);
  }
}


