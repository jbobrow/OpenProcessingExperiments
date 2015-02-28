

import ddf.minim.*;
Minim minim;
AudioInput in;
AudioRecorder recorder;
AudioPlayer track;
inputqa inputQA; //question/answer class
PFont fontTitle; //Title font
PFont fontBody; //Body font
PFont inventoryFont;
PFont inventoryTitleFont;
String error = "I'm sorry, I didn't understand that. Please try another phrasing."; //error message that displays when the program can't find a keyword or finds duplicates
String typing = ""; //sets initial player typing to nothingness
String saved = ""; //sets initial saved text to nothingness
String delimeters = " ,\n,.?!;:"; //delimeters used to parse through the array
float questionnumber = 0; //beginning question number
boolean finishedinput = false; //boolean to check whether the player is finished typing
boolean notyping = false; //boolean to stop the player from continuing to type
boolean gameover = false; //boolean that enable game over conditions
boolean toomuchsound = false; //boolean that activates if the player makes too much noise
int inventorycounter = 0; // int used to determine when the inventory is open
int tabcount = -1; //counts the number of times tab has been pressed
//INVENTORY SCREEN DIMENSIONS
int x = 450; 
int y = 450;
int y2 = -10;
int x2 = 600;
void setup() {
  size(900, 900);
  minim = new Minim(this);
  track = minim.loadFile("zizibum.mp3"); //loads
  in = minim.getLineIn(); //gets feed from mic
  inputQA = new inputqa (25, 120); //new question object
  fontTitle = loadFont("Data70Plain-30.vlw"); //loads title font
  fontBody = loadFont("Data70Plain-25.vlw"); //loads body font
  inventoryFont = loadFont("FixedsysExcelsiorIIIb-25.vlw"); //loads inventory body font
  inventoryTitleFont = loadFont("FixedsysExcelsiorIIIb-30.vlw"); //loads inventory title font
  track.loop();
}
void draw () {
  //track.play();
  backgr(); //background function
  inputQA.titledisplay(); //displays title
  inputQA.questiondisplay(); //displays questions
  inputQA.typingdisplay(); //displays player typing
  inputQA.decisiontree(); //question order/decision tree
  inputQA.gameOver();
  inventory(); //function that draws inventory to screen
  //println(y2);
  if ( y2>=0) {
    inputQA.inventory();
  }
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    if ( in.left.get(i) > 0.9 && in.right.get(i) > 0.9) {
      toomuchsound = true;
      println("bool triggered");
    }
  }
}
void keyPressed() {
  if (gameover == false) {
    if (notyping == false) { //if the player isn't supposed to be typing, setting this to true will prevent them
      if (key == '\n' ) { //if enter is pressed, save the typing
        saved = typing;
        println(saved);
        finishedinput = true; //the player has finished typing
        typing = ""; //clear typing
      }
      if (key == BACKSPACE || key == DELETE) { //if backspace or delete is pressed
        typing = ""; //clear player typing

        finishedinput = false; //player has not finished typing
      }      
      if ((key == CODED) || key == BACKSPACE || key == DELETE || key == TAB ) { //test to make sure we don't get weird characters
        typing = typing;
      } 
      else {
       
        typing = typing + key; //concatenate
        
      }
    }
  }
  if (key == TAB) { //inventory opening screen
    inventorycounter++; //increments inventory counter
    //println("INVENTORY FTW!!!" +inventorycounter);
    tabcount = inventorycounter % 2; //uses modulus to find if my number is even or odd
    //println(+tabcount);
  }
}
//BACKGROUND DISPLAY FUNCTION
void backgr () {
  background(0);
  line (width, height/10, 0, height/10);
}
//INVENTORY DISPLAY
void inventory () {
  if (gameover == false) {
    if (tabcount == 1) { //if you find a remainder, tab has been pressed.
      rectMode(CENTER);
      fill(220);
      rect(x, y, x2, y2); //dimensions for inventory screen
      notyping = true; //player cannot type while inventory is up
      if (y2 <= 350) { //cap for screen growth
        y2+=10; //rate at which the screen grows
      }
    }
    if (tabcount == 0) { //if you don't find a remainder, tab has not been pressed
      if (y2 >= 0) { //cap for inventory screen shrinkage
        rectMode(CENTER);
        fill(220);
        rect(x, y, x2, y2);
        y2-=10;
        notyping = false; //player can type again
      }
    }
  }
}
void stop() {
  track.close(); 
  minim.stop(); 
  super.stop();
}


