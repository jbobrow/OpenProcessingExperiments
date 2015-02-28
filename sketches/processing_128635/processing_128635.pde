
/* Final Project for Introduction to Computational Arts course,
Coursera.org, "Bringing It All Together",
programming + images + sounds */

/* This sketch must be run in Java mode */

/* import Minim library */
import ddf.minim.*;

/* cards dimension */
int numCards = 16;
int numX = 4; 
int numY = 4;

/* image variable */
PImage bkg;
PImage[] zoos = new PImage[numCards];
PImage deck;

/* playing area */
float pWide = 600;
float pHigh = 600;

/* cards objects */
int[] cards = new int[numCards];
int[] states = new int[numCards];

/* game properties */
int firstLoad = 1;
int inTheGame = 0;
int setNumber = 0;
int lastIndex1, lastIndex2;
int sSequence = 0;
int finishingClick = 1;
int steps = 0;
int helpMode = 0;
int attribMode = 0;
int isMute = 0;

/* fonts */
PFont myFont;

/* sounds */
Minim minim;
AudioPlayer sJungle;
AudioPlayer sCardOpen;
AudioPlayer sShuffle;
AudioPlayer sPairMatching;
AudioPlayer sSuccess;

/* setup & initialize */
void setup() {
  firstLoad = 1;
  size(800, 600);
  frameRate(16);      /* 16 frames/second */ 
  smooth();
  
  /* fonts */
  myFont = createFont("serif", 12, true);
  textAlign(LEFT, TOP);
  
  /* background */
  bkg = loadImage("junglebkg.jpg");
  background(bkg);  
  
  /* zoos cute animals */
  for (int i=1; i <= numCards; i++) {
    zoos[i-1] = loadImage("z"+i+".png");   
  } 
  /* deck */
  deck = loadImage("back02.png");
  
  /* sounds */
  minim = new Minim(this);
  /* sJungle = minim.loadFile("jungle.ogg"); */
  sJungle = minim.loadFile("jungle.mp3");
  /* sShuffle = minim.loadFile("shuffle.ogg"); */
  sShuffle = minim.loadFile("shuffle.mp3");
  /* sSuccess = minim.loadFile("success.ogg"); */
  sSuccess = minim.loadFile("success.mp3");
  /* sPairMatching = minim.loadFile("pairmatched.ogg"); */
  sPairMatching = minim.loadFile("pairmatched.mp3");
  /* sCardOpen = minim.loadFile("open.ogg"); */
  sCardOpen = minim.loadFile("open.mp3");
}

/* draw image */
void draw() {
  background(bkg);
  if (firstLoad == 0) {
    drawAllCards();
  }
  drawAllControls();
  if (helpMode == 1) {
    displayHelp();
  }
  if (attribMode == 1) {
    attributions();
  }
  fill(#ffffff);
  textAlign(CENTER, BOTTOM);
  textFont(myFont, 12);
  text("Click on '[N]ew Game' to start.", 700, 590);
}

/* mouse clicked */ 
void mouseClicked() {
  if (helpMode == 1) {
    helpMode = 0;
    return;
  }
  if (attribMode == 1) {
    attribMode = 0;
    return;
  }
  
  if ((mouseX >= 0) && (mouseX < pWide)) {
    /* wait until previous click is processed */
    if ((firstLoad == 0) && (finishingClick == 1)) {
      finishingClick = 0;
      processCards();
    }
  }
  else {
    processControl();
  }
}

void mouseDragged() {
  mouseClicked();
}

/* keyboard keypress */ 
void keyPressed() {
  if (helpMode == 1) {
    helpMode = 0;
    return;
  }
  if (attribMode == 1) {
    attribMode = 0;
    return;
  }
  if (key == 'c' || key == 'C') {
    /* change card set */
    String msg;
    if (setNumber == 0)
      msg = "`A`";
    else
      msg = "`B`"; 
    drawButton(170, "[C]hange Card Set " + msg, color(0,0,0));

    if (setNumber == 0) {
      setNumber = 1; 
    }
    else {
      setNumber = 0;
    }
    shuffleCards();
  }
  else if (key == 'n' || key == 'N') {
    drawButton(200, "[N]ew Game", color(0,0,0));
    shuffleCards();
  }
  else if (key == 'o' || key == 'O') {
    String ssnd;
    if (isMute == 1) {
      ssnd = "Turn [O]n Sound";
    }
    else {
      ssnd = "Turn [O]ff Sound";
    }
    drawButton(230, ssnd, color(0,0,0));

    if (isMute == 1) {
      sJungle.unmute();
      isMute = 0;
    }
    else {
      sJungle.mute();
      isMute = 1;
    }
  }
  else if (key == 'h' || key == 'H') {
    drawButton(260, "[H]elp", color(0,0,0));
    helpMode = 1;
  }
}

/* calculate index to position x */
float getPosX(int idx) {
  return (idx % numX) * (pWide / numX);
}

/* calculate index to position y */
float getPosY(int idx) {
  return floor(idx / numY) * (pHigh / numY);
}

/* draw a card deck */
void drawDeck(int idx) {
  image(deck, getPosX(idx), getPosY(idx));
}

/* draw a card */
void drawFace(int idx) {
  image(zoos[cards[idx]], getPosX(idx), getPosY(idx));
}

/* flip card from deck to face */
void flipFace(int idx) {
  if (states[idx] == 0) {  /* if closed then open */
    drawFace(idx);
  }
}

/* flip card from face to deck */
void flipDeck(int idx) {
  if (states[idx] != 0) {  /* if opened then close */
    drawDeck(idx);
  }
}

/* fill cards */
void fillCards() {
  int diff = 0;
  int mid = (int)floor(numCards / 2);
  if (setNumber == 1) {
    diff = mid;
  }
  for (int i=0; i < mid; i++) {
    cards[i] = diff+i;  /* couple */
    cards[mid+i] = diff+i;
    states[i] = 0;  /* closed */
    states[mid+i] = 0;
  }
}

/* double shuffle cards */
void shuffleCards() {
  if (isMute == 0) {
    sShuffle.rewind();
    sShuffle.play();
  }
  fillCards();
  int buf1, pos1, pos2;
  for (int i=0; i < 100; i++) {
    pos1 = (int)floor(random(numCards));
    pos2 = (int)floor(random(numCards));
    buf1 = cards[pos2];
    cards[pos2] = cards[pos1];
    cards[pos1] = buf1;
  }
  
  sSequence = 0;
  lastIndex1 = -1;
  lastIndex2 = -1;
  finishingClick = 1;
  steps = 0;
  
  sJungle.rewind();
  sJungle.loop();
  if (isMute == 1) {
    sJungle.mute();
  }
  
  firstLoad = 0;
}

/* draw all cards */
void drawAllCards() {
  for (int i=0; i < numCards; i++) {
    if (states[i] == 0) {
      drawDeck(i);
    }
    else {
      drawFace(i);
      if (states[i] == 1) {
        stroke(255);
        strokeWeight(2);
        noFill();
        float diax = (pWide/numX);
        float diay = (pHigh/numY);
        float midx = getPosX(i) + (diax/2);
        float midy = getPosY(i) + (diay/2);
        ellipse(midx, midy, diax-8, diay-8);
      }
    }
  }
}

/* process events for playing area */
void processCards() {
  inTheGame = 1;
  float cardWide = pWide / numX;
  float cardHigh = pHigh / numY;
  int idX = (int)floor(mouseX / cardWide);
  int idY = (int)floor(mouseY / cardHigh);
  int idPos = idY * numX + idX;
  
  if (states[idPos] == 0) {          /* state 0 = closed */
    if (sSequence == 0) {    /* first click on closed */
      /* close both previous opened if there is one */
      if (lastIndex1 != -1) {
        flipDeck(lastIndex1);
        states[lastIndex1] = 0;
      }
      if (lastIndex2 != -1) {
        flipDeck(lastIndex2);
        states[lastIndex2] = 0;
      }
    
      flipFace(idPos);
      states[idPos] = 1;
      sSequence = 1;
      lastIndex1 = idPos;
      
      // sound open
      if (isMute == 0) {
        sCardOpen.rewind();
        sCardOpen.play();
      }
    }
    else {    /* second click on closed */
      flipFace(idPos);
      if (isMute == 0) {
        sCardOpen.rewind();
        sCardOpen.play();
      }
      sSequence = 0;
      /* check whether both cards the same */
      if (cards[lastIndex1] == cards[idPos]) {
        states[idPos] = 2;
        states[lastIndex1] = 2;
        lastIndex1 = -1;
        lastIndex2 = -1;
        
        // sound double open success
        if (isMute == 0) {
          sPairMatching.rewind();
          sPairMatching.play();
        }
      }
      else {
        states[lastIndex1] = 1;
        states[idPos] = 1;
        lastIndex2 = idPos;
      }
    }
    steps++;
  }

  allMatchingPairs();
  finishingClick = 1;   /* finish processing click event */
}

/* check if all matching pairs */
void allMatchingPairs() {
  int match = 1;
  for (int i=0; i < numCards; i++) {
    if (states[i] != 2) {
      match = 0;
      break;
    }
  }
  if (match == 1) {
    /* sound complete */
    if (isMute == 0) {
      sSuccess.rewind();
      sSuccess.play();
    }
    inTheGame = 0;
    sJungle.pause();
  }
}

/* process events for control area */
void processControl() {
  if ((mouseX > 610) && (mouseX < 610+180)) {
    /* change card set */
    if ((mouseY > 170) && (mouseY < 170+24)) {
      String msg;
      if (setNumber == 0)
        msg = "`A`";
      else
        msg = "`B`"; 
      drawButton(170, "[C]hange Card Set " + msg, color(0,0,0));

      if (setNumber == 0) {
        setNumber = 1; 
      }
      else {
        setNumber = 0;
      }
      shuffleCards();
    }
    /* new game */
    if ((mouseY > 200) && (mouseY < 200+24)) {
      drawButton(200, "[N]ew Game", color(0,0,0));
      shuffleCards();
    }
    /* mute/unmute sounds */
    if ((mouseY > 230) && (mouseY < 230+24)) {
      String ssnd;
      if (isMute == 1) {
        ssnd = "Turn [O]n Sound";
      }
      else {
        ssnd = "Turn [O]ff Sound";
      }
      drawButton(230, ssnd, color(0,0,0));

      if (isMute == 1) {
        sJungle.unmute();
        isMute = 0;
      }
      else {
        sJungle.mute();
        isMute = 1;
      }
    }
    /* help */
    if ((mouseY > 260) && (mouseY < 260+24)) {
      drawButton(260, "[H]elp", color(0,0,0));
      helpMode = 1;
    }
    if ((mouseY > 290) && (mouseY < 290+24)) {
      drawButton(290, "Attribution", color(0,0,0));
      attribMode = 1;
    }
  }
}

/* draw a button */
void drawButton(float y, String s, color clr) {
  stroke(clr);
  fill(clr);
  float x = 610;
  rect(x, y, 180, 24, 8);
  textFont(myFont, 16);
  textAlign(CENTER, CENTER);
  fill(0);
  text(s, x+90, y+8);
}

/* draw all controls */
void drawAllControls() {
  color clr;
  String s;
  if (inTheGame == 1) {
    clr = color(0,200,0);
    s = "Game ON";
  }
  else {
    clr = color(200,0,0);
    s = "Game IDLE";
  }

  stroke(clr);
  fill(clr);
  float x = 610;
  rect(x, 12, 180, 120, 8);
  textAlign(CENTER, CENTER);
  textFont(myFont, 18);
  fill(255);
  text("Memory Game", x+90, 24);
  text("(Matching Pairs)", x+90, 44);
  
  textFont(myFont, 16);
  fill(0);
  text(s, x+90, 90);
  text("Steps = " + steps, x+90, 110);
  
  String msg, ssnd;
  if (setNumber == 0) {
    msg = "`A`";
  }
  else {
    msg = "`B`";
  }  
  if (isMute == 1) {
    ssnd = "Turn [O]n Sound";
  }
  else {
    ssnd = "Turn [O]ff Sound";
  }
  drawButton(170, "[C]hange Card Set " + msg, color(255,255,255));
  drawButton(200, "[N]ew Game", color(255,255,255));
  drawButton(230, ssnd, color(255,255,255));
  drawButton(260, "[H]elp", color(255,255,255));
  drawButton(290, "Attribution", color(255,255,255));
}

/* help */
void displayHelp() {
  helpMode = 1;
  String[] mesg = {
  "Memory (Matching Pairs) Game:",
  "* The object of the game is to turn over pairs of matching cards.",
  "* Player chooses two cards and turns them face up by doing mouse click.",
  "* If both two cards chosen has the same face (matched pair), then they are opened.",
  "* If both two cards chosen has different faces, then they are temporary opened,", 
  "    but will be closed on the next click.",
  "* Each click increases Steps counter.",
  "* The game ends when the last pair has been opened.",
  "* Player should try finishing the game with least steps.",
  "* Keyboards: [C] Change Set, [N] New Game, [O] Turn Off/On Sounds, [H] Help", 
  " ",
  "  This sketch is developed for Final Project 'Bringing It All Together'",
  "    of Coursera's Introduction to Computational Arts course.",
  "  To demonstrate three core areas of the course: ",
  "    programming, visual art, and sound art.",  
  " ",
  "          (Click or press any key to close this help popup.)"
  };
  
  stroke(255);
  fill(255);
  float x = 80, y = 60;
  rect(x, y, width-(x*2), height-(y*2), 8);
  textFont(myFont, 32);
  textAlign(LEFT, TOP);
  fill(0);
  text(mesg[0], x + 30, y + 20);
  
  textFont(myFont, 16);
  textAlign(LEFT, TOP);
  for (int i=1; i < mesg.length; i++) {
    text(mesg[i], x + 30, y + 60 + (i*24));
  }
}

void stop() {
  // always close Minim audio classes when we are done with them
  sJungle.rewind();
  sJungle.close();
  sCardOpen.rewind();
  sCardOpen.close();
  sShuffle.rewind();
  sShuffle.close();
  sPairMatching.rewind();
  sPairMatching.close();
  sSuccess.rewind();
  sSuccess.close();

  // always stop Minim before exiting
  minim.stop();
  super.stop();
}

/* attribution dialog */
void attributions() {
  attribMode = 1;
  String[] mesg = {
    "Attribution for images:", 
    "  All images are downloaded from:",   
    "  http://www.freevectordownload.com/Free_Vector_Animals.asp?PageIndex=2", 
    "  It's free for non-commercial use.",
    "  The author of the images is 'artshare.ru'",
    " ",
    "Attribution for sounds:",
    "  All sounds are downloaded from: http://www.freesound.org/",
    "  The jungle sound: ", 
    "  http://www.freesound.org/people/folkart%20films/sounds/122767/",
    "  Yucatan Jungle sounds by 'folkart films'",
    " ",
    "Bell sounds: ",
    "  http://www.freesound.org/people/fins/sounds/171670/", 
    "  'success 2', by 'fins'",
    "  http://www.freesound.org/people/soundbyter.com/sounds/111035/",
    "  'peacefull bells', by 'soundbyter.com'",
    "  http://www.freesound.org/people/giddykipper/sounds/53492/",
    "  'thai_bells', by 'giddykipper'",
    " ",
    "Creative Commons Attribution License: http://creativecommons.org/licenses/by/3.0/",
    " ",
    "       (Click or press any key to close this attribution popup.)"
  };
  
  stroke(255);
  fill(255);
  float x = 80, y = 60;
  rect(x, y, width-(x*2), height-(y*2), 8);
  fill(0);
  textFont(myFont, 12);
  textAlign(LEFT, TOP);
  for (int i=0; i < mesg.length; i++) {
    text(mesg[i], x + 30, y + 10 + (i*20));
  }
} 
/* end of code */

