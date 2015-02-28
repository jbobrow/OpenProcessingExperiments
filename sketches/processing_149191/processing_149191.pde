

// Inputs 

void keyPressed() {
  // depending on stateOfGame
  // different sets of keys are in use 
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

  // player stops before screen borders  
  int innerDistance = 47; 

  // if special key
  if (key == CODED) {

    if (keyCode == UP) {
      // UP
      if (player.PlayerY>height/2)
      {
        // move him up 
        player.PlayerY-=player.speed;
      }
      else if ( ! viewPort.moveUp() ) {
        // failed, move player instead.
        // if he's not on the border
        if (player.PlayerY>innerDistance) {
          // move him up 
          player.PlayerY-=player.speed;
        } // if
      } // if
    } // if UP

    else if (keyCode == DOWN) {
      if (player.PlayerY<height/2)
      {
        // move him 
        player.PlayerY+=player.speed;
      }
      else if ( ! viewPort.moveDown() ) {
        // failed, move player instead.
        // if he's not on the border
        if (player.PlayerY<height-innerDistance) {
          // move him 
          player.PlayerY+=player.speed;
        } // if
      } // if
    }

    else if (keyCode == RIGHT) {
      if (player.PlayerX<width/2)
      {
        // move him 
        player.PlayerX+=player.speed;
      }
      else if ( ! viewPort.moveRight() ) {
        // failed, move player instead.
        // if he's not on the border
        if (player.PlayerX<width-innerDistance) {
          // move him 
          player.PlayerX+=player.speed;
        } // if
      } // if
    }
    else if (keyCode == LEFT) {
      if (player.PlayerX>width/2)
      {
        // move him 
        player.PlayerX-=player.speed;
      }
      else if ( ! viewPort.moveLeft() ) {
        // failed, move player instead.
        // if he's not on the border
        if (player.PlayerX>innerDistance) {
          // move him  
          player.PlayerX-=player.speed;
        } // if
      } // if
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
//


