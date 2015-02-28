


// Input key
// each state has an own keyPressed routine 

void keyPressed() {
  //
  // depending on the state choose keyPressed routine
  switch (state) {
  case stateWelcomeScreen:
    keyPressedstateWelcomeScreen();
    break;
  case statePlay:
    //
    break;
  case stateLearnMore:
    //
    break;
  case stateAfterAGame:
    //
    break;  
  default:
    println("Unknown State (Error 23 in tab InputKey): " 
    + state
    + ".");
    exit();
    break;
  } // switch
  //
} // func 
//
void keyPressedstateWelcomeScreen() {
  // do nothing
}
//


