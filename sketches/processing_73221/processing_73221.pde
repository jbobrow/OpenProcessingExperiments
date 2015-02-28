
//////////////////////////////////////////////////////////////////////
// Game!                         2012                   David Irwin // 
//         Huge thanks to Professor Krumpe for the help with        // 
//                       the background text                        //
//                           v. Alpha .5 [Reduced]                  //
//                                                                  //
//       Planned Features: Changing/pausing the song          [ ]   //
//                         Allowing for pausing of the 'game' [ ]   //
//                         Adding 'enemies' to dodge          [ ]   //
//////////////////////////////////////////////////////////////////////

//Just importing the minim library to allow myself to playback sound
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Objects that allow for sound playback
Minim minim;
AudioPlayer song;

//////////////////////////////////////////////////////////////////////

//Song variables
String songName = "Run Away From Me (Ephixa Chilled Remix)";
String artist = "DotEXE";

//////////////////////////////////////////////////////////////////////

//Variables about the text in the background

PFont font;

//A few constants.  Change these to change the width and height
//spacing of the background text
final int CHAR_HEIGHT = 11;
final float CHAR_WIDTH = 6.67;

//position variables for the string
float[] posX = new float[76];
int rows = 35;

//Color of the text (it's green with slight transparency)
color textColor = color(0, 100, 0, 100);

//////////////////////////////////////////////////////////////////////

//Variables that affect the position of the square while in-game
int yPos, yDisplace, xDisplace, xPos;

//////////////////////////////////////////////////////////////////////

//Variables for the waveform(s)
color waveRed = color(255, 0, 0);
color waveBlu = color(0, 0, 255);
color ovrPrpl = color(75, 0, 75, 100);

//////////////////////////////////////////////////////////////////////

//Variables for the geneal background/borders
color bdrGrey = color(10, 10, 10);
color backGrn = color(0, 100, 0, 100);

//////////////////////////////////////////////////////////////////////

//Boolean that will cause text to show up whether the song is playing
//or not
boolean playMusic = true;

//////////////////////////////////////////////////////////////////////

void setup() {

  frameRate(60);

  size(500, 500);

  smooth();

  //this loads the selected song from the data folder
  minim = new Minim(this);
  song = minim.loadFile(songName + ".mp3");

  //Play the song upon start and make it loop upon completion
  song.play();
  song.loop();

  //Font info
  font = loadFont("LucidaConsole-48.vlw");
  textFont(font, 11);

  //Setting up the initial x positions of the background strings
  for (int i = 0; i < posX.length; i++) {
    posX[i] = CHAR_WIDTH*i + width;
  }
}

void keyPressed() {
//Plays or pauses the music, depending on what key is pressed  
  if (key=='p'||key=='P') {
    song.play();
    playMusic=true;
  }
  else if (key=='m'||key=='M') {
    song.pause();
    playMusic=false;
  }
}

void draw() {

  background(0);
  
  //Moving text in the background, on a loop
  environmentText();

  //Some music visualization
  waveForms(45, height-50, 2);

  //Some aesthestic rectangles that act as borders
  borders();
  
  //Square that follows the mouse within certain parameters
  square();
  
  //Square movement, the parameter is the amount of displacement
  squareDisplace(4);

  //Aesthetic text
  infoText();
}

//Moving text in the background
void environmentText() {

  //Moves the test from right to left
  for (int i = 0; i < posX.length; i++) {

    posX[i] = posX[i] - 1;   

    if (posX[i] <= -1*CHAR_WIDTH) {
      posX[i] = width;
    }
  }

  //Draws the text
  fill(textColor);
  for (int i = 0; i < posX.length; i++) {
    for (int row = 0; row < rows; row++) {
      if ((i%3 == 0 || i%5 == 0 || i%7 == 0)
        && (row%5 == 2 || row%5 == 4)) {
        text(1, posX[i], (row + 1) * CHAR_HEIGHT);
      }
      else {
        text(0, posX[i], (row+1) * CHAR_HEIGHT);
      }
    }
  }
}

//The waveform method, dependent on the song that is playing
void waveForms(int amplitude, int yPos, int lineThickness) {

  strokeWeight(lineThickness);
  
  //Code for the waveforms, utilizing both a for loop
  //and information retrieved from the song (using Minim methods)
  for (int i = 0; i < song.bufferSize() - 1; i++) {
    stroke(waveBlu);
    line(i, yPos + song.left.get(i)*amplitude, 
    i+1, yPos + song.left.get(i+1)*amplitude);

    stroke(waveRed);
    line(i, yPos + song.right.get(i)*amplitude, 
    i+1, yPos + song.right.get(i+1)*amplitude);
  }
  
  noStroke();
  
  rectMode(CORNER);
  
  //Just an overlay box, purely aesthetic
  fill(ovrPrpl);
  rect(0, yPos-50, width, height-yPos+50);
}

//Aesthetic boxes
void borders() {

  noStroke(); 

  rectMode(CORNER);

  //Big green background box
  fill(backGrn);
  rect(0, 0, width, height-100);

  //Grey border boxes
  fill(bdrGrey);
  rect(0, 0, width, 75);
  rect(0, height-175, width, 75);
}

//Square that the user controls with WASD
void square() {

  //x and y position of the square
  yPos = height - 188 + yDisplace;
  xPos = 50 + xDisplace;

  stroke(0, 255, 0, 150);
  fill(0, 200, 0, 125);
  rectMode(CENTER);

  //Parameters for the square
  if (yPos > height - 175-13) {
    rect(xPos, height-175-13, 26, 26);
  }
  else if (yPos < 75+13) {
    rect(xPos, 75+13, 26, 26);
  }
  else if (yPos >= 75-13 && yPos <= height+175) {
    rect(xPos, yPos, 26, 26);
  }

  //Some aesthetic sparks that occur when the square is touching
  //the edges
  sparks(xPos);
}

//Aesthetic sparks, drawn when the square is at the edges
void sparks(int pos) {
  strokeWeight(1);

  //Conditionals that determine the positions of the sparks
  if (yPos >= height - 175-13) {
    line(pos+int(random(-13, -10)), height-175, 
    pos+int(random(-43, -40)), height-(int)random(198, 206));

    line(pos+int(random(-10, -7)), height-175, 
    pos+int(random(-40, -37)), height-(int)random(188, 196));

    line(pos+int(random(-7, -3)), height-175, 
    pos+int(random(-37, -33)), height-(int)random(198, 206));

    line(pos+int(random(-3, 4)), height-175, 
    pos+int(random(-33, -24)), height-(int)random(188, 196));
  }
  else if (yPos <= 75+13) {
    line(pos+int(random(-13, -10)), 75, 
    pos+int(random(-43, -40)), (int)random(98, 106));

    line(pos+int(random(-10, -7)), 75, 
    pos+int(random(-40, -37)), (int)random(88, 96));

    line(pos+int(random(-7, -3)), 75, 
    pos+int(random(-37, -33)), (int)random(98, 106));

    line(pos+int(random(-3, 4)), 75, 
    pos+int(random(-33, -24)), (int)random(88, 96));
  }
}

//Displacement of the square using WASD
void squareDisplace(int displace) {

  //Constrains the square (will most likely update to
  //using constrain() in the future)
  if (yDisplace > 0) {
    yDisplace = 0;
  }
  else if (yDisplace < -240) {
    yDisplace = -240;
  }
  else if (xDisplace < 0) {
    xDisplace = 0;
  }
  else if (xDisplace > 52) {
    xDisplace = 52;
  }

  //The actual movement of the square
  if (keyPressed) {
    if (key == 'w' || key =='W') {
      yDisplace -= displace;
    }
    else if (key == 's' || key == 'S') {
      yDisplace += displace;
    }
    else if (key == 'd' || key =='D') {
      xDisplace += displace;
    }
    else if (key == 'a' || key == 'A') {
      xDisplace -= displace;
    }
  }
}

//Aesthetic text
void infoText() {
  //Variable dependent on time
  int distanceTravelled;

  //String that displays the current frames per second
  text("fps: " + (int)frameRate, 4, 13);

  //Strings that display song and artist information
  text("Song: " + songName, 4, 23);

  text("Artist: " + artist, 4, 33);
  
  //Just an informational string
  text("Hit 'l' to switch songs! (Not in this version)", 4, 58);

  //String that switches based upon a boolean
  if(playMusic) {
    text("Hit 'm' to pause the music!", 4, 68);
  }
  else {
    text("Hit 'p' to play the music!", 4, 68);
  }

  //Aesthetic string
  text("Distance travelled: " + distanceTravelled(8400)/2 + " meters", 
  4, height-162);
}

//Simple calculation method, used in environmentText
int distanceTravelled(int delayTime) {
  int time = millis();

  //Just a variable for a return value
  int result;

  //Conditional that says only make the counter go up if time
  //is greater than the delay time
  if (time < delayTime) {
    result = 0;
  }
  else {
    //The result is calculated so that it increases by one
    //approximately every decisecond, along with a negative value
    //to make up for the delay time
    result = (time/100)-85;
  }

  return result;
}

//Just stops the program
void stop() {
  song.close();
  minim.stop();
  super.stop();
}


