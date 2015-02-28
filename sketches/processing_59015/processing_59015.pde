
/**
* Create a music keyboard from the qwerty keyboard.
* Capture key presses and map the ascii key number 
* to a MIDI pitch number and play a note immediatly.
*
* A SoundCipher example by Andrew R. Brown
* Modified by Pandu Aji Wirawan
* http://panduaji.com
* http://panduaji.net
*/

import arb.soundcipher.*;

SoundCipher sc;
boolean[] keysNotePlay;
int[] keysNoteMap;

void setup(){
  sc = new SoundCipher(this);
  keysNotePlay = new boolean[127];
  keysNoteMap = new int[127];
  keysNoteMap['a'] = 59;
  keysNoteMap['s'] = 60;
  keysNoteMap['d'] = 62;
  keysNoteMap['f'] = 64;
  keysNoteMap['g'] = 65;
  keysNoteMap['h'] = 67;
  keysNoteMap['j'] = 69;
  keysNoteMap['w'] = 61;
  keysNoteMap['e'] = 63;
  keysNoteMap['t'] = 66;
  keysNoteMap['y'] = 68;
  keysNoteMap['u'] = 70;
  size (600,400);
}

void keyReleased(){
  keysNotePlay[key] = false;
}

// keep processing 'alive'
void draw() {
  fill(255);
  if( keyPressed && keysNotePlay['a'] == true){
    fill(204);
  }
  rect (10, 10, 30, 100);
    
  fill(255);
    if( keyPressed && keysNotePlay['s'] == true){
    fill(204);
  }
  rect (40, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['d'] == true){
    fill(204);
  }
  rect (70, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['f'] == true){
    fill(204);
  }
  rect (100, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['g'] == true){
    fill(204);
  }
  
  rect (130, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['h'] == true){
    fill(204);
  }
  
  rect (160, 10, 30, 100);
    fill(255);
    if( keyPressed && keysNotePlay['j'] == true){
    fill(204);
  }
  
  rect (190, 10, 30, 100);
  
  
  //ireng
  fill(0);
  if( keyPressed && keysNotePlay['w'] == true){
    fill(204);
  }
  rect (32,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['e'] == true){
    fill(204);
  }
  rect (62,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['t'] == true){
    fill(204);
  }
  rect (122,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['y'] == true){
    fill(204);
  }
  rect (152,10,15,60);
  fill(0);
  if( keyPressed && keysNotePlay['u'] == true){
    fill(204);
  }
  rect (182,10,15,60);
  
  if( keyPressed && keysNotePlay[key] == false){
    sc.playNote(keysNoteMap[key], 100, 1);
    keysNotePlay[key] = true; 
  }
}

