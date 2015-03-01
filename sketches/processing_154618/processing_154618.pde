
/*
 * Creative Coding
 * Week 5, 05 - Text agents
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * adjusted by Neroli 11/July/14
 *
 * This sketch creates a simple agent-based simulation using text and objects
 * The sketch reads in characters from the keyboard and dynamically creates
 * new objects for each character.
 *
 */
char [] phrase;
String thePhrase = "Code seems opaque but with practice it becomes clear.";
ArrayList<AniCharacter> aniChars;
int     num;     // the number of items in the array
float[] thisCharacterX;       // x-position of point
float[] thisCharacterY;       // y-position
boolean[] thisCharacterDone;
PFont [] fonts;

PFont myHelvetica;
PFont myGothic;
PFont myGreek;
PFont mySyastro;
PFont myBrowallia;
// the x of the each phrase letter
float theX;

int currentCount;

void setup() {
  background(0);
  size(1500, 700);
  myHelvetica = loadFont("ArialMT-48.vlw");
  textFont(myHelvetica);
  myGothic = loadFont("GothicI-48.vlw");
  textFont(myGothic);
  myGreek = loadFont("GreekC-48.vlw");
  textFont(myGreek);
  mySyastro = loadFont("Syastro-48.vlw");
  textFont(mySyastro);
  myBrowallia = loadFont("BrowalliaUPC-Italic-48.vlw");
  textFont(myBrowallia);
  myGothic = loadFont("GothicI-48.vlw");
  theX = 0;
  phrase = new char[53];
  //Code seems opaque but with practice it becomes clear.)
  // make and array of weird fonts
  fonts = new PFont [4];
  fonts[0] = myGothic;
  fonts[1] = myGreek;
  fonts[2] = mySyastro;
  fonts[3] = myBrowallia;
  
  thisCharacterX = new float[phrase.length];
  thisCharacterY = new float[phrase.length];
  for (int i = 0; i<phrase.length; i++) {
    phrase[i] = thePhrase.charAt(i);
  }
  thisCharacterDone = new boolean[phrase.length];
  for (int i = 0; i< phrase.length; i++) {
    thisCharacterDone[i] = false;
  }

  aniChars = new ArrayList<AniCharacter>();

  smooth(8); // enable antialiasing
}


void draw() {
  //background(255,255,255, 100);
    // so this is redrawing a faint transparent square over to give the fading effect
  fill(0, 30);
  //fill(255,0,0, 2); // nice redness
  // redrawing the rectangle creates the fade out over time
  rect(0, 0, width, height); // comment out with MULTIPLY for white spider webs

  textFont(myHelvetica);
  // theX is the x position of each phrase character
  theX = 80;
  for (int j = 0; j < phrase.length; j++) {

    //char thisCharacter = phrase[j];
    //println(thisCharacterX[j]);
    if (thisCharacterDone[j] == true) {
      fill(255,0,0);
      text(phrase[j], theX, height/2);
    } else {
      fill(0);
      text(phrase[j], theX, height/2);
      //    println(theX);
      //    println(textWidth(thisCharacter));//(theX);
      thisCharacterX[j] = theX;
      //println(thisCharacterX[j]);
      thisCharacterY[j] = height/2;
    }
    theX = theX + textWidth(phrase[j]) + 3;
  }


  for (int i = aniChars.size ()-1; i >= 0; i--) {
    AniCharacter tempObj = aniChars.get(i);
    tempObj.run(); // run each char
  }
} 



void keyReleased() {

  aniChars.add( new AniCharacter(random(width), random(height), key) );
}

// AniCharacter class
//
// 
class AniCharacter {

  float x, y;
  float nOff_x;
  float nOff_y;
  float dynamic;
  float dynamic_character;
  float size_font;
  float size_shape;
  char letter;
  PFont myFont;


  AniCharacter(float x_, float y_, char character_) {
    // describes the instance
    x = x_;
    y = y_;
    // pick a random font for each aniletter and remember it
    myFont = fonts[int(random(1,4))];

    letter = character_;
    //size_font = random(50, 200);
    //size_shape = size_font + random(10, 50);
    dynamic_character = random(-0.1, 0.1);
  }

  void run() {
    // make aniletters move to the middle line  
    if (y < height/2) {
      y += 1;
    } else {
      y -= 1;
    }
    // stop letters hanging around off the edges.
    if (x < 80 ) {
      x += 2;
    } else if (x > 1420) {
      x -= 5;
    } else {
      x += random(-2, 2);

    }
    //textSize(size_font);
    float textWidth =  textWidth(letter);
    //float ascent = textAscent() * 0.75;
    fill (255, 0, 0);

    //println(myFont);
    textFont(myFont);
   //textFont(myGreek);
    //noStroke();
    text(letter, x-textWidth/2, y);
    
    // collision detection
    // run through the character to check if they've hit a letter
    for (int i = aniChars.size ()-1; i >= 0; i--) {
      AniCharacter tempObj = aniChars.get(i);
      PVector v1 = new PVector(tempObj.x, tempObj.y);
      // create a distance var
      float d = 0;
      // run through the phrase to check the distance
      for (int j=0; j<phrase.length; j++) {
        PVector v2 = new PVector(thisCharacterX[j], thisCharacterY[j]);
        d = v1.dist(v2);
        // if the distance is small turn the phrase character red 
        // and disappear the aniletter
        if (d < 10) {
          //println("yay");
          thisCharacterDone[j] = true;
          //println(thisCharacterDone[j]);

          aniChars.remove(tempObj);//.remove(i);
          break;
        }
      }
    }
  }
}



