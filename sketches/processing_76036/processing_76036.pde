
import ddf.minim.*;
import ddf.minim.signals.*;

final int LOW_FRE = 55; //frequency of the lowest note
final float LOW_AMP = 0.04; //relative amplitude of the lowest note
final float HIGH_AMP = 0.03; //relative amplitude of the highest note

//self-explanatory
final int WHITE_KEY_WIDTH = 40;
final int WHITE_KEY_LENGTH = 200;
final int BLACK_KEY_WIDTH = 20;
final int BLACK_KEY_LENGTH = 120;
final int KEY_OUTLINE_WEIGHT = 2;

final color WHITE_KEY_COLOR = #FFFFFF; //it doesn't have to be white
final color BLACK_KEY_COLOR = #000000; //it doesn't have to be black
final color HIGHLIGHT_COLOR = #FFFF33; //the color of the highlighted keys
final color KEY_OUTLINE_COLOR = #000000; //the color of the key outlines
final color LABEL_COLOR = #11BB11;

//all of the computer keys that produce a note
//this array might be different for different computers depending on the keyboard layout
final char[][] KEYS = {{'`','1','2','3','4','5','6','7','8','9','0',
  '-','=',BACKSPACE,TAB,'q','w','e','r','t','y','u','i','o','p',
  '[',']',ENTER,'a','s','d','f','g','h','j','k','l',';','\'','\\',
  '<','z','x','c','v','b','n','m',',','.','/',0},{'~','!','@',
  '#','$','%','^','&','*','(',')','_','+',0,0,'Q','W','E','R','T',
  'Y','U','I','O','P','{','}',0,'A','S','D','F','G','H','J','K','L',
  ':','"','|',0,'Z','X','C','V','B','N','M','<','>','?',0}};

//the pattern of black and white keys in an octave - true if black, false if white
final boolean[] IS_BLACK_KEY = {false,true,false,false,true,false,
                              true,false,false,true,false,true};


final int NUM_KEYS = KEYS[0].length; //total number of piano keys
final int TEMPERAMENT = IS_BLACK_KEY.length; //http://en.wikipedia.org/wiki/Equal_temperament
final int NUM_FULL_OCTAVES = NUM_KEYS / TEMPERAMENT;
final int NUM_REMAINDER_KEYS = NUM_KEYS % TEMPERAMENT;
final int OCTAVE_NUM_BLACK_KEYS = octaveNumBlackKeys(); //the number of black keys in an octave
final int OCTAVE_NUM_WHITE_KEYS = TEMPERAMENT - OCTAVE_NUM_BLACK_KEYS; //the number of black keys in an octave
final int NUM_WHITE_KEYS = numWhiteKeys(); //this is useful for determining the width of the piano

final int[] KEYS_POS_X = keysPosX(); //the x positions of all the piano keys
final char[] LABELS = labels();


Minim minim;
AudioOutput out;
SawWave[] sawNote = new SawWave[NUM_KEYS];
int lastKey; //the value corresponding to the last key pressed
boolean shift1Pressed = false; //keeps track of whether a SHIFT key is held
boolean shift2Pressed = false; //keeps track of whether 2 SHIFT keys are held
boolean[] isBeingPlayed = new boolean[NUM_KEYS];

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  
  //populate notes array
  for(int i = 0; i < NUM_KEYS; i++) {
    sawNote[i] = new SawWave(LOW_FRE * pow(2, i / (float) TEMPERAMENT),
      map(i, 0, NUM_KEYS, LOW_AMP, HIGH_AMP), out.sampleRate());
  }
  
  frameRate(1000);
  strokeWeight(KEY_OUTLINE_WEIGHT);
  textAlign(CENTER); //this makes things easier
  
  //set the screen width to the number of white keys multiplied by their width
  //and the height to the white key length
  size(WHITE_KEY_WIDTH * NUM_WHITE_KEYS, WHITE_KEY_LENGTH);
  
  
  //draw the keyboard by drawing all white keys unhighlighted
  //and the black keys will magically draw themselves!
  for(int i = 0; i < NUM_KEYS; i++) {
    if(!isBlackKey(i))
      unhighlightKey(i);
  }
}

void draw() { }

void keyPressed() {
  lastKey = lastKey();
  if(lastKey < NUM_KEYS) {
    isBeingPlayed[lastKey] = true;
    playNote(lastKey);
    highlightKey(lastKey);
    //check if the SHIFT key has been pressed
    if(lastKey == 51) {
      if(shift1Pressed)
        shift2Pressed = true;
      else
        shift1Pressed = true;
    }
  }
}

void keyReleased() {
  lastKey = lastKey();
  if(lastKey < NUM_KEYS) {
    isBeingPlayed[lastKey] = false;
    stopNote(lastKey);
    unhighlightKey(lastKey);
    //check if the SHIFT key has been released
    if(lastKey == 51) {
      if(shift2Pressed)
        shift2Pressed = false;
      else
        shift1Pressed = false;
    }
  }
}

//returns the number corresponding to the key last pressed or released
int lastKey() {
  if(shift1Pressed) {
    //first check shifted keys if SHIFT is pressed
    for(int i = 0; i < NUM_KEYS; i++)
      if(key == KEYS[1][i])
        return i;
    
    //then check these lowercase letter keys in case CAPSLOCK is on
    for(int i = 15; i < 25; i++)
      if(key == KEYS[0][i])
        return i;
    for(int i = 28; i < 37; i++)
      if(key == KEYS[0][i])
        return i;
    for(int i = 41; i < 48; i++)
      if(key == KEYS[0][i])
        return i;
  }
  
  else {
    //check non-shifted keys if SHIFT is not pressed
    for(int i = 0; i < NUM_KEYS; i++)
      if(key == KEYS[0][i])
        return i;
    
    //then check these uppercase letter keys in case CAPSLOCK is on
    for(int i = 15; i < 25; i++)
      if(key == KEYS[1][i])
        return i;
    for(int i = 28; i < 37; i++)
      if(key == KEYS[1][i])
        return i;
    for(int i = 41; i < 48; i++)
      if(key == KEYS[1][i])
        return i;
  }
 
  //then check the other 7 keys
  switch(key) {
    case CODED:
      switch(keyCode) {
      case(SHIFT):
        return 51;
      case(ALT):
        return 52;
      case(CONTROL):
        return 53;
      }
    case LEFT:
      return 54;
    case RIGHT:
      return 55;
    case DOWN:
      return 56;
    case UP:
      return 57;
  }
  
  //otherwise a useless key such as DELETE or F1 was pressed
  return 1000;
}

void playNote(int n) {
  out.addSignal(sawNote[n]);
}

void stopNote(int n) {
  out.removeSignal(sawNote[n]);
}

void highlightKey(int n) {
  stroke(KEY_OUTLINE_COLOR);
  fill(HIGHLIGHT_COLOR);
  
  //if it's a black key draw a highlighted rectangle with a label
  if(isBlackKey(n)) {
    rect(KEYS_POS_X[n], 0, BLACK_KEY_WIDTH, BLACK_KEY_LENGTH);
    label(n, KEYS_POS_X[n] + BLACK_KEY_WIDTH/2,
                              BLACK_KEY_LENGTH - 10);
  }
  
  //if it's a white key draw a highlighted rectangle with a label
  else {
    rect(KEYS_POS_X[n], 0, WHITE_KEY_WIDTH, WHITE_KEY_LENGTH);
    label(n, KEYS_POS_X[n] + WHITE_KEY_WIDTH/2,
                              WHITE_KEY_LENGTH - 10);
    
    //if there is a black key to the left redraw it
    if(n != 0 && isBlackKey(n-1))
      if(isBeingPlayed[n-1])
        highlightKey(n-1);
      else
        unhighlightKey(n-1);
        
    //and same with the right
    if(n < NUM_KEYS-1 && isBlackKey(n+1))
      if(isBeingPlayed[n+1])
        highlightKey(n+1);
      else
        unhighlightKey(n+1);
  }
}

void unhighlightKey(int n) {
  stroke(KEY_OUTLINE_COLOR);
  
  //if it's a black key, draw a black rectangle and label it
  if(isBlackKey(n)) {
    fill(BLACK_KEY_COLOR);
    rect(KEYS_POS_X[n], 0, BLACK_KEY_WIDTH, BLACK_KEY_LENGTH);
    label(n, KEYS_POS_X[n] + BLACK_KEY_WIDTH/2,
                              BLACK_KEY_LENGTH - 10);
  }
  
  //otherwise if it's a white key draw a white rectangle and label it
  else {
    fill(WHITE_KEY_COLOR);
    rect(KEYS_POS_X[n], 0, WHITE_KEY_WIDTH, WHITE_KEY_LENGTH);
    label(n, KEYS_POS_X[n] + WHITE_KEY_WIDTH/2,
                              WHITE_KEY_LENGTH - 10);
    
    //if there is a black key to the left redraw it
    if(n != 0 && isBlackKey(n-1))
      if(isBeingPlayed[n-1])
        highlightKey(n-1);
      else
        unhighlightKey(n-1);
        
    //and same with the right
    if(n < NUM_KEYS-1 && isBlackKey(n+1))
      if(isBeingPlayed[n+1])
        highlightKey(n+1);
      else
        unhighlightKey(n+1);
  }
}

//returns the number of black keys in an octave
int octaveNumBlackKeys() {
  int n = 0;
  for(int i = 0; i < TEMPERAMENT; i++)
    if(IS_BLACK_KEY[i])
      n++;
  return n;
}

//returns the number of white keys on the piano
int numWhiteKeys() {
  int remainderWhiteKeys = 0;
  for(int i = 0; i < NUM_REMAINDER_KEYS; i++)
    if(!IS_BLACK_KEY[i])
      remainderWhiteKeys++;
  return OCTAVE_NUM_WHITE_KEYS * NUM_FULL_OCTAVES + remainderWhiteKeys;
}

boolean isBlackKey(int n) {
  if(IS_BLACK_KEY[n % TEMPERAMENT])
    return true;
  return false;
}

//returns the x positions of all the piano keys
int[] keysPosX() {
  int[] x = new int[NUM_KEYS];
  x[0] = 0;

  for(int i = 1; i < NUM_KEYS; i++) {
    if(isBlackKey(i))
      x[i] = x[i-1] + WHITE_KEY_WIDTH - BLACK_KEY_WIDTH / 2;
    else if(isBlackKey(i-1))
      x[i] = x[i-1] + BLACK_KEY_WIDTH / 2;
    else
      x[i] = x[i-1] + WHITE_KEY_WIDTH;
  }
    
  return x;
}

//returns an array containing all the labels
char[] labels() {
  char[] l = new char[NUM_KEYS];
  
  for(int i = 0; i < 13; i++)
    l[i] = KEYS[0][i];
  
  l[13] = '←';
  l[14] = '⇥';
  
  for(int i = 15; i < 25; i++)
    l[i] = KEYS[1][i];
  
  l[25] = KEYS[0][25];
  l[26] = KEYS[0][26];
  l[27] = '↲';
  
  for(int i = 28; i < 37; i++)
    l[i] = KEYS[1][i];
  
  for(int i = 37; i < 41; i++)
    l[i] = KEYS[0][i];
  
  for(int i = 41; i < 48; i++)
    l[i] = KEYS[1][i];
    
  for(int i = 48; i < 51; i++)
    l[i] = KEYS[0][i];
  
  l[51] = '↑';
  
  return l;
}

//label the keys
void label(int n, int x, int y) {
  fill(LABEL_COLOR);
  
  text(LABELS[n], x, y);
}
