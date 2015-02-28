

// Inputs 

void keyPressed() {
  // depending on stateOfGame
  // different keys are in use 
  switch (stateOfGame) {
  case statePlay:
    keyPressedForStatePlay();
    break;
  case statePause:
    keyPressedForStatePause();
    break;
  default:
    // other states: keys ignored; 
    // do nothing
    break;
  } // switch
} //func  
//
//--------------------------------------------------
//
void keyPressedForStatePause() {
  // any key
  stateOfGame = statePlay;
}
//
void keyPressedForStatePlay() {
  // if special key
  if (key == CODED) {
    if (keyCode == UP) {
      player.addX=0;
      player.addY=-1;
    }
    else if (keyCode == DOWN) {
      player.addX=0;
      player.addY=1;
    }
    else if (keyCode == RIGHT) {
      player.addX=1;
      player.addY=0;
    }
    else if (keyCode == LEFT) {
      player.addX=-1;
      player.addY=0;
    }
    else {
      // do nothing
    }
  }
  else {  
    // not key == CODED -------------
    // normal keys 
    //
    if (key == 'r') {
      initGame();
    }
    else if (key == 'R') {
      levelCount = 0;
      initGame();
    }
    else if (key == '#') {
      player.PlayerX=410;
      player.PlayerY=160;
      player.addX=0;
      player.addY=-1;
    }
    if (key == 'p') {
      stateOfGame= statePause;
    }
    else {
      // stop the pause if necessary
      if (stateOfGame == statePause) { 
        stateOfGame = statePlay;
      } // if
    } // else
  } // else
} // func 


