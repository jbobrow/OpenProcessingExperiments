
/****************************************************************************
 code by David Hirotsu
 April 25th, 2012
 
 this program is meant to be a songwriting/inspiration tool
 choose how many chords you want, choose or randomize a key
 and then randomize a progression
 you get to choose the rhythm/tempo of it
 come up with a melody and you've got yourself a song!
 ****************************************************************************/

int numChords=8;
int[] chords = new int[numChords];
int chordKey=0;
PImage layout;
//white color
color white = color(245, 243, 237);

////
float r;
float easedR=0;
float easing = 0.04;

PFont font;

String[][] family = {
  {
    "C", "dm", "em", "F", "G", "am", "b dim"
  }
  , 
  {
    "C#", "d#m", "fm", "F#", "G#", "a#m", "c dim"
  }
  , 
  {
    "D", "em", "f#m", "G", "A", "bm", "c# dim"
  }
  , 
  {
    "D#", "fm", "gm", "G#", "A#", "cm", "d dim"
  }
  , 
  {
    "E", "f#m", "g#m", "A", "B", "c#m", "d# dim"
  }  
  , 
  {
    "F", "gm", "am", "A#", "C", "dm", "e dim"
  }
  , 
  {
    "F#", "g#m", "a#m", "B", "C#", "d#m", "f dim"
  }
  , 
  {
    "G", "am", "bm", "C", "D", "em", "f# dim"
  }
  , 
  {
    "G#", "a#m", "cm", "C#", "D#", "fm", "g dim"
  }
  , 
  {
    "A", "bm", "c#m", "D", "E", "f#m", "g# dim"
  }
  , 
  {
    "A#", "cm", "dm", "D#", "F", "gm", "a dim"
  }
  , 
  {
    "B", "c#m", "d#m", "E", "F#", "g#m", "a# dim"
  }
};

void setup() {
  size(430, 647);
  font = loadFont ("NewsGothicMT-48.vlw");
  textFont(font, 26);
  textAlign(CENTER);
  layout = loadImage("layout3.png");

  populateKeys();

  for (int i = 0; i<chords.length; i++) {
    chords[i] = int(random(7));
  }
  noLoop();
}



void draw() {
  float spacing = 360/numChords;

  //choosing number of chords****************************

  if (mouseY>282&&mouseY<357&&mouseX>0&&mouseX<53&&mousePressed==true)
  {
    numChords=1;
  }
  else if (mouseY>282&&mouseY<357&&mouseX>53&&mouseX<107&&mousePressed==true)
  {
    numChords=2;
  }
  else if (mouseY>282&&mouseY<357&&mouseX>107&&mouseX<160&&mousePressed==true)
  {
    numChords=3;
  }
  else if (mouseY>282&&mouseY<357&&mouseX>160&&mouseX<215&&mousePressed==true)
  {
    numChords=4;
  }
  else if (mouseY>282&&mouseY<357&&mouseX>215&&mouseX<268&&mousePressed==true)
  {
    numChords=5;
  }
  else if (mouseY>282&&mouseY<357&&mouseX>268&&mouseX<322&&mousePressed==true)
  {
    numChords=6;
  }
  else if (mouseY>282&&mouseY<357&&mouseX>322&&mouseX<375&&mousePressed==true)
  {
    numChords=7;
  }
  else if (mouseY>282&&mouseY<357&&mouseX>375&&mouseX<430&&mousePressed==true)
  {
    numChords=8;
  }

  image(layout, 0, 0);
  pushMatrix();
  translate(width/2, height/4-15);

  if (chordKey==0) {
    for (int i = 0; i < numChords; i++) {

      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[0][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==1) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[1][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==2) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[2][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==3) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[3][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==4) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[4][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==5) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[5][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==6) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[6][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==7) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[7][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==8) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[8][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==9) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[9][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==10) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[10][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==11) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[11][chords[i]], 0, 0);
      popMatrix();
    }
  }
  if (chordKey==12) {
    for (int i = 0; i < numChords; i++) {
      // text(Integer.toString(chords[i]), 10, 100+50*i);
      pushMatrix();
      float x = 100*cos(radians(i*spacing));
      float y = 100*sin(radians(i*spacing));
      translate(x, y);
      text(family[12][chords[i]], 0, 0);
      popMatrix();
    }
  }
  popMatrix();

  //choosing chord
  if (mouseY>435&&mouseY<506&&mouseX>0&&mouseX<107&&mousePressed==true)
  {
    chordKey=0;
  }
  else if (mouseY>435&&mouseY<506&&mouseX>107&&mouseX<215&&mousePressed==true)
  {
    chordKey=1;
  }
  else if (mouseY>435&&mouseY<506&&mouseX>215&&mouseX<322&&mousePressed==true)
  {
    chordKey=2;
  }

  else if (mouseY>435&&mouseY<506&&mouseX>322&&mouseX<430&&mousePressed==true)
  {
    chordKey=3;
  }

  else if (mouseY>506&&mouseY<577&&mouseX>0&&mouseX<107&&mousePressed==true)
  {
    chordKey=4;
  }

  else if (mouseY>506&&mouseY<577&&mouseX>107&&mouseX<215&&mousePressed==true)
  {
    chordKey=5;
  }

  else if (mouseY>506&&mouseY<577&&mouseX>215&&mouseX<322&&mousePressed==true)
  {
    chordKey=6;
  }
  else if (mouseY>506&&mouseY<577&&mouseX>322&&mouseX<430&&mousePressed==true)
  {
    chordKey=7;
  }
  else if (mouseY>577&&mouseY<647&&mouseX>0&&mouseX<107&&mousePressed==true)
  {
    chordKey=8;
  }

  else if (mouseY>577&&mouseY<6477&&mouseX>107&&mouseX<215&&mousePressed==true)
  {
    chordKey=9;
  }

  else if (mouseY>577&&mouseY<647&&mouseX>215&&mouseX<322&&mousePressed==true)
  {
    chordKey=10;
  }
  else if (mouseY>577&&mouseY<647&&mouseX>322&&mouseX<430&&mousePressed==true)
  {
    chordKey=11;
  }





  //randomize key
  if (mouseX<215&&mouseX>0&&mouseY<435&&mouseY>358&&mousePressed==true)
  {
    chordKey=int(random(12));
  }

  //randomize progression
  if (mouseX<430&&mouseX>215&&mouseY<435&&mouseY>358&&mousePressed==true)
  {
    for (int i = 0; i<chords.length; i++) {
      chords[i] = int(random(7));
    }
  }

  //white box around chords
  stroke(white);
  noFill();
  if (chordKey==0)
  {
    rect(0, 432, 107, 74);
  }
  if (chordKey==1)
  {

    rect(107, 432, 107, 74);
  } 
  if (chordKey==2)
  {

    rect(215, 432, 107, 74);
  } 
  if (chordKey==3)
  {

    rect(322, 432, 107, 74);
  }

  if (chordKey==4)
  {

    rect(0, 506, 107, 71);
  }
  if (chordKey==5)
  {

    rect(107, 506, 107, 71);
  } 
  if (chordKey==6)
  {
    rect(215, 506, 107, 71);
  } 
  if (chordKey==7)
  {
    rect(322, 506, 107, 71);
  }
  if (chordKey==8)
  {

    rect(0, 577, 107, 69);
  }
  if (chordKey==9)
  {

    rect(107, 577, 107, 69);
  } 
  if (chordKey==10)
  {

    rect(215, 577, 107, 69);
  } 
  if (chordKey==11)
  {

    rect(322, 577, 107, 69);
  }


  //white box around number of chords
  if (numChords==1)
  {
    rect(1, 280, 52, 75);
  }
  if (numChords==2)
  {
    rect(53, 280, 52, 75);
  }
  if (numChords==3)
  {
    rect(107, 280, 52, 75);
  }
  if (numChords==4)
  {
    rect(160, 280, 52, 75);
  }
  if (numChords==5)
  {
    rect(215, 280, 52, 75);
  }
  if (numChords==6)
  {
    rect(268, 280, 52, 75);
  }
  if (numChords==7)
  {
    rect(322, 280, 52, 75);
  }
  if (numChords==8)
  {
    rect(375, 280, 54, 75);
  }




  println( mouseX);
  println(mouseY);
}


void populateKeys() {
  String[][] family = {
    {
      "C", "dm", "em", "F", "G", "am", "b dim"
    }
    , 
    {
      "C#", "d#m", "fm", "F#", "G#", "a#m", "c dim"
    }
    , 
    {
      "D", "em", "f#m", "G", "A", "bm", "c# dim"
    }
    , 
    {
      "D#", "fm", "gm", "G#", "A#", "cm", "d dim"
    }
    , 
    {
      "E", "f#m", "g#m", "A", "B", "c#m", "d# dim"
    }  
    , 
    {
      "F", "gm", "am", "A#", "C", "dm", "e dim"
    }
    , 
    {
      "F#", "g#m", "a#m", "B", "C#", "d#m", "f dim"
    }
    , 
    {
      "G", "am", "bm", "C", "D", "em", "f# dim"
    }
    , 
    {
      "G#", "a#m", "cm", "C#", "D#", "fm", "g dim"
    }
    , 
    {
      "A", "bm", "c#m", "D", "E", "f#m", "g# dim"
    }
    , 
    {
      "A#", "cm", "dm", "D#", "F", "gm", "a dim"
    }
    , 
    {
      "B", "c#m", "d#m", "E", "F#", "g#m", "a# dim"
    }
  };
}



void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}


/*
void tellChord() {
 //  if (chord[i] == 0)
 //  {
 //    println String ___;
 //  }
 //  else if (chord[i] == 1)
 //  {
 //  }
 }
 
 class Chord {
 int chordNumb; //randomized number
 
 Chord( int value) {
 chordNumb=value;
 
 if (chordKey == 0) {
 }
 }
 
 void display() {
 }
 }
 */

