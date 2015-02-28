
// Assignment week 5 First Trial
/*
0. The project shows a blank screen in the beginning and starts when hitting
 and holding any key. It ends with a static picture when the key
 is not hit anymore.
 1. It shows a sort of frame of colors corresponding to the slow
 frame rate (7).
 2. In this canvasframe there is firstly a colorgrid which changes
 its appearence according to the position of the mouse.
 3. The color is put by an array of colors a random function.
 4. Secondly there is a picture and a quotation of Sigmund Freud using the pushMatrix and popMatrix
 command.
 5. When hitting the s key a screenshot is saved in the sketchfolder.
 6. When dragging the mouse a translucent blue object appears and
 follows the mouse movement according to the speed of the movement
 ( *factor 20).
 7. When starting the presentation (draw command) a sound file with the original voice of S. Freud is played using the Minim
 library.
 8. When clicking the maouse some basic words of Freud's theory appear randomly 
 */


// Global Variables
float x = 25;
float y = 25;
float counter = 0;
color [] colorGrid = {
  0x7F6FE5D1, 0x7FFC2F0A, 0x7FFCF50A, 0x7F1A1271, 0x7F3FFA0D
};

int stepX;
int stepY;

PImage freud;
PImage quote;

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim; // Create an instance of minim itself. Access the funcionality of minim
AudioPlayer speaks; // file of Freud's Talk

// Array with Freud's words appearing randomly by pressing a key----------------------
String[] nouns = {
  "Ego", "SuperEgo", "Id", "Death", "Drive", "Love", "Envy", "Instinct"
};


// Setup
void setup() {



  size(1250, 700);
  background(colorGrid[0]);
  freud = loadImage("freud.png");
  quote = loadImage("quote.png");

  minim = new Minim(this); //a new instance of the minm class (this is argument for contents
  speaks = minim.loadFile("sfreud.mp3");
  speaks.play(); // call the command to play back the audiofile
}

// draw()
void draw() {
  // if (keyPressed) {
  frameRate (7);
  colorMode(HSB, width, height, 100);
  //mouse input-----------------------------

  stepX = mouseX+20;
  stepY = mouseY+20;

  // this for-statementn controls----------------------

  for (int gridY = 0; gridY < height; gridY += stepY) {
    for (int gridX = 0; gridX < width; gridX += stepX)
    {
      fill(gridX, height - gridY, 100);
      rect(gridX, gridY, stepX, stepY);
    }
  }

  float r = random(1, 5);
  strokeWeight(random(200));
  stroke(colorGrid[int(r)]);
  noFill();
  rect(0, 0, width, height);



  //------------------Freud inserted as Picture---------------------
  pushMatrix();
  translate(200, 200);
  image(freud, 0, 0);
  image(quote, width*1/3, height*1/3);
  popMatrix();
  //---------------------------------------------------------

  fill(0x402EFF30);  
  rect(215, 210, 350, 350);  // second rectangle
}


//keypressed for screenshot------------------------------------

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("screenWeek4.jpg");
}

//mouseDragged-----------------------------------------

void mouseDragged() {
  stroke(0x40150C7C);
  strokeWeight(abs((mouseX-pmouseX)*20));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

// shows randomly words of Freud----------------------------------------

void mouseClicked() {
  frameRate(2);
  int n = int(random(8)); // random number between 0 and 
  textAlign(CENTER, CENTER);
  fill(#170404);
  strokeWeight(40);
  textSize(width/5);
  text(nouns[n], width/2, height/2);
}


