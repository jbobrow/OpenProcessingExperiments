
PFont fontTitle; //Title font
PFont fontBody; //Body font
String error = "I'm sorry, I didn't understand that. Please try another phrasing."; //error message that displays when the program can't find a keyword or finds duplicates
String typing = ""; //sets initial player typing to nothingness
String delimeters = " , \n,.?!;:"; //delimeters used to parse through the array
String [] typingparsed; 
String lowercase; //puts typed text into lowercase, making less variation to have to account for
String saved = ""; //sets initial saved text to nothingness
String searchTerm1 = "";//drive search queries off these variables
String searchTerm2 = "";
String searchTerm3 = "";
String searchTerm4 = "";
String searchTerm5 = "";
String searchTerm6 = "";
//float w = 0; //variable to determine word length
float question = 0; //beginning question number
int spacing = 0; //spacing of each line
int indent = 25; //indentation of each line
int counter1 = 0; //counter for checking the number of times one keyword pops up
int counter2 = 0; //counter for checking the number of times another keyword pops up
boolean finishedinput = false; //boolean to check whether the player is finished typing

void setup() {

  size(900, 900);

  fontTitle = loadFont("Data70Plain-30.vlw"); //loads title font

    fontBody = loadFont("Data70Plain-25.vlw"); //loads body font
}

void draw () {

  backgr(); //background function

  if (question == 0) { //question #1

    question1display(); //displays question about picking weapons


    question1answer(); //sets question answers/queries for search

    answerdetermination(0.5, 0.7); //set of conditionals that determine what question the player progresses to next given a certain answer, with passed values to
  }
  if (question == 0.5) { //question #2a asks the player who picked the sword to go east or west

    question2adisplay(); //displays question
    if (finishedinput == true) { //checks to see if the player is done writing

      answerdetermination(1, -1);
    }
    question2aanswer(); //sets question answers
  }
  if (question == 0.7) { //question #2b asks the player who picked the dagger to go east or west

    question2bdisplay();
    if (finishedinput == true) {

      answerdetermination(1, -1);
    }
    question2banswer();
  }
  if (question == 1) { //goes east
    question4display();
    if (finishedinput == true) {
      answerdetermination(2, 2.5);
    }
    question4answer();
  }
  if (question == -1) { //goes west
    question3display();
    if (finishedinput == true) {
      answerdetermination(-2, -2.5 );
    }
    question3answer();
  }
  if (question == -2) { //the player wants to go right

    question8display();

    if (finishedinput == true) {

      answerdetermination(-3.2, -3.4);
    }
    question8answer();
  }
  if (question == -2.5) { //the player wants to go left

    question9display();

    if (finishedinput == true) {

      answerdetermination(-3.6, -3.8);
    }
    question9answer();
  }

  if (question == 2) { //the player wants to fish

    question5adisplay();

    if (finishedinput == true) {

      answerdetermination(3.2, 3.4);
    }
    question5aanswer();
  }

  if (question == 2.5) { //the player doesn't want to fish

    question5bdisplay();

    if (finishedinput == true) {

      answerdetermination(3.8, 3.6);
    }
    question5banswer();
  }
  if (question == 3.2) { //the player throws the fish to the bear

    question6adisplay();
    if (finishedinput == true) {

      answerdetermination(1, -1);
    }
    question6aanswer();
  }
  if (question == 3.4) { //the player stays and fights

    question6bdisplay();
  }

  if (question == 3.6) { //the player doesn't want to fish

    question7adisplay();

    if (finishedinput == true) {

      answerdetermination(1, -1);
    }
    question7aanswer();
  }

  parse(); //function that prepares text to be parsed

  playerInput(); //function that parses player input

    println("What question am I on?" +question);
}

void keyPressed() {

  if (key == '\n' ) { //if enter is pressed, save the typing 

    saved = typing;

    finishedinput = true; //the player has finished typing

    typing = ""; //clear typing
  }
  if (key == BACKSPACE || key == DELETE) { //if backspace or delete is pressed
    typing = ""; //clear player typing
    finishedinput = false; //player has not finished typing
  }
  if (key == CODED) { 
    if (key != BACKSPACE || key != DELETE) { //if not backspace or delete, don't type anything (so boxes don't appear)
      typing = typing;
    }
    if (key == ESC) {
      question = 0;
    }
  } 
  else {

    typing = typing + key; //concatenate
  }
  println("Is my boolean true or false?" +finishedinput);
}
void question1display () {

  text("You wake up in a clearing with a satchel around your shoulder with no idea how you got there. \nA sword and two daggers stick out of the ground next to where you were lying. Which will you \nchoose?", indent, spacing+ 120);
}

void question1answer () {

  searchTerm1 = "dagger"; //drive search queries off these variables
  searchTerm2 = "daggers";
  searchTerm4 = "sword";
}
//================================================================
void question2adisplay () {

  text("You pick up the two daggers and sheath them in their scabbards. As you observe your beautiful \nsurroundings, you notice a path to the east and one to the west. Which will you travel?", indent, spacing+ 120);
}


void question2bdisplay () {

  text("You pick up the sword and put it in your scabbard. As you observe your beautiful surroundings, \nyou notice a path to the east and one to the west. Which will you travel?", indent, spacing+ 120);
}
void question2aanswer () {

  searchTerm1 = "east"; //drive search queries off these variables

  searchTerm4 = "west";
}
void question2banswer () {

  searchTerm1 = "east"; //drive search queries off these variables

  searchTerm4 = "west";
}


//================================================================
void question3display () {

  text("The path grows dark as you progress down it. Drooping branches hang menacingly over you as \nyou progress further down the path. Eventually, just as the sun’s rays barely peak through the \ncanopy, you come to a fork in the road. A single ray of light illuminates an unreadable sign that \nstands between the two dark paths. Will you go to the right or to the left?", indent, spacing+ 120);
}

void question3answer () {

  searchTerm1 = "right"; //drive search queries off these variables

  searchTerm4 = "left";
}
//================================================================
void question8display () {

  text("Soon the birds stop chirping, and the only noise in the forest is that of your own footsteps. It’s \ntoo quiet. Suddenly, a loud cry pierces through the wilderness. It sounds like it’s just down the \npath a short way! Will you run towards it or back?", indent, spacing+ 120);
}

void question8answer () {

  searchTerm1 = "toward"; //drive search queries off these variables
  searchTerm2 = "towards";
  searchTerm3 = "forward";

  searchTerm4 = "away";
  searchTerm5 = "back";
}
//================================================================
void question9display () {

  text("The path darkens more, but just before it goes pitch black the canopy thins out and empties you \nout into a large field. In the middle of this field rests a giant monolith. Do you want to investigate \nor keep going?", indent, spacing+ 120);
}

void question9answer () {

  searchTerm1 = "investigate"; //drive search queries off these variables
  searchTerm2 = "closer"; 

  searchTerm4 = "keep";
  searchTerm5 = "going";
  searchTerm5 = "away";
}

//================================================================
void question4display () {

  text("The winding path leads to a beautiful lake teeming with fish and other aquatic life. \nYou look through your satchel and realize you have a fishing pole and bait. Do you want to fish?", indent, spacing+ 120);
}



void question4answer () {

  searchTerm1 = "yes"; //drive search queries off these variables
  searchTerm2 = "sure";
  searchTerm3 = "okay";
  searchTerm4 = "no";
  searchTerm5 = "don't";
  searchTerm6 = "not";
}
//================================================================

void question5bdisplay () {

  text("You see that the path winds around the lake and heads towards the snow capped mountains. \nDo you want to continue travelling or go back?", indent, spacing+ 120);
}

void question5banswer () {

  searchTerm1 = "going"; //drive search queries off these variables

  searchTerm4 = "back";
}

void question5adisplay () {

  text("You catch a large fish! Wow! It’s a whopper! As you put it in your satchel, however, you hear \nbranches breaking and a rustling in the forest. A large bear intent on stealing that beauty of a fish \nyou just caught barrels out of the forest! Yikes! Do you want to throw him the fish and flee, or do \nyou want to fight and try to slay this barbaric beast?", indent, spacing+ 120);
}



void question5aanswer () {

  searchTerm1 = "run"; //drive search queries off these variables
  searchTerm2 = "flee";
  searchTerm3 = "throw";

  searchTerm4 = "fight";
  searchTerm5 = "slay";
  searchTerm6 = "stay";
}

//================================================================
void question6adisplay () {

  text("You throw the fish in the general direction of the ravenous looking bear and flee for your life. \nAfter running for several minutes with no signs of pursuit, you arrive back in the clearing you \nfirst woke up in. After catching your breath, you look back to the path. Do you wish to travel \neast or west?", indent, spacing+ 120);
}
void question6aanswer () {

  searchTerm1 = "east"; //drive search queries off these variables

  searchTerm4 = "west";
}
void question6bdisplay () {

  text("You fought valiantly, but were ultimately no match for the insatiable hunger of this rabid creature. \nYou’ve been killed by a bear.", indent, spacing+ 120);
}
//================================================================
//================================================================

void question7adisplay () {

  text("You’re back at the clearing where you first woke up. Do you wish to travel east or west?", indent, spacing+ 120);
}


void question7aanswer () {

  searchTerm1 = "east"; //drive search queries off these variables

  searchTerm4 = "west";
}
void question7bdisplay () {

  text("You see that the path winds around the lake and heads towards the snow capped mountains. \nDo you want to continue travelling or go back?", indent, spacing+ 120);
}

void question7banswer () {

  searchTerm1 = "going"; //drive search queries off these variables
  searchTerm2 = "onwards";
  searchTerm3 = "continue";
  searchTerm4 = "back";
}



//================================================================

void answerdetermination (float a, float b) {
  if (counter1 >= 1 && counter2 <= 0) {

    question = a;

    finishedinput = false;
  }
  if (counter2 >= 1 && counter1 <= 0) {

    question = b;

    finishedinput = false;
  }
  if (counter1 >= 1 && counter2 >= 1) {

    text(error, indent, height/4);
  }
  if (counter1 == 0 && counter2 == 0 && finishedinput == true) {

    text(error, indent, height/4);
  }
}
void parse() {

  lowercase = saved.toLowerCase();

  typingparsed = splitTokens(lowercase, delimeters);

  println (typingparsed);
}

void playerInput () {

  counter1 = 0;

  counter2 = 0;

  for (int i = 0; i < typingparsed.length; i++) {    //for loop to print out each word from wordsOfMittens

    if (typingparsed[i].equals(searchTerm1) || typingparsed[i].equals(searchTerm2) || typingparsed[i].equals(searchTerm3)) {

      println("Keyword found");

      counter1++;
    }
    if (typingparsed[i].equals(searchTerm4) || typingparsed[i].equals(searchTerm5) || typingparsed[i].equals(searchTerm6)) {

      println("Keyword found");

      counter2++;
    }
  }
}

void backgr () {

  background(0);

  textFont(fontTitle, 30);

  fill(220);

  text("ZORP \nCopyright (c) 1981, 1982, 1983                                      ENCOM SYSTEMS, INC.", indent, spacing+40);

  stroke (220);

  line (width, height/10, 0, height/10); 

  textFont(fontBody, 25);

  text(typing, indent, height/3);
}

