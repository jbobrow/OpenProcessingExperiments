


void keyPressed () {

  // we can have keyPressed in a text field situation 
  if (state == statePCLost || state == statePCLost_AskingForAQuestion) {
    keyPressedForEnteringText();
  } // if

  // or in another situation 
  else if (state==stateIntro) {

    switch(key) {
    case 's':
      state=showList;
      break;

    case 'g':
      indexList = 0;
      state=stateShowGraphic;
      break;
    default:
      // do nothing
      break;
    } // switch
    //
  } // else if
} // func

void keyPressedForEnteringText() {

  // keyPressed in a text field situation

  if (key!=CODED) {

    switch (key) {

    case BACKSPACE:
      if (enteredText.length()>0)
        enteredText=enteredText.substring(0, enteredText.length()-1);
      break;

    case ESC:
      // when hitting ESC we want to leave the textfield 
      if (state == statePCLost || state == statePCLost_AskingForAQuestion) {
        state = stateIntro;  // reset 
        indexList = 0; // current line
        key=0; // kill ESC
      }
      break;

    case RETURN:
    case ENTER:
      if (state == statePCLost) {
        if (enteredText.length()>2) {
          // the player has entered the new animal.
          // we store the new animal and prepare to ask for the 
          // new question.           
          newAnimal = enteredText;  // store 
          enteredText = "";         // reset 
          state = statePCLost_AskingForAQuestion;  // move on
        }
      }
      else if (state == statePCLost_AskingForAQuestion) {
        saveNewAnimal();
      }
      else {
        println ("Error 182");
      }
      break;

    default:
      // normal: just add the key to the word in the text field 
      enteredText = enteredText + key;
      break;
      //
    }// switch
  } // if (key!=CODED)
} // func 
//


