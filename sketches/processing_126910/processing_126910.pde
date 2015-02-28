
boolean level1= true; //intro page
boolean level2; //"i" instruction page
boolean level3; //starting the game level 1
boolean level4; // level 2
boolean level5; // level 3
boolean level6; // level 4
boolean level7; // level 5
boolean level9; // fail 
boolean level10; // win! 
boolean level11; // INCORRECT
PImage boolean1; // intro image
PImage boolean2; // instruction image
PImage boolean3; // game start! level 1 
PImage boolean9; // game over
PImage boolean11; //fail 
PImage boolean10; //win
boolean incorrectPress;
boolean level12; //level6

int buttonR = 40;                                                                          // radius of buttons
int[] buttonX = {105, 234, 364, 493, 624, 105, 234, 364, 494, 623};                          // x positions of buttons
int[] buttonY = {106, 106, 106, 106, 106, 226, 226, 226, 226, 226};                             // y positions of buttons
int numSteps = 3;// number of steps in the sequence to recall
String sequence = "";                                                                      // String representing the sequence to recall
int currentStep = 0;                                                                       // step the player is currently trying to recall
String selectedSteps = "";                                                                 // String of the steps the player has already recalled
boolean playerWins = false;                                                                // whether or not the player has already won
int startTime;                                                                             // timer for displaying the sequence at the beginning of the sketch
int dispTime = 3000; // length of time to display text messages
int dispTime2 = 2000;
boolean message;                                                                           // whether or not to display a message
String messageText;                                                                        // String of message text
int messageTime;    // timer for displaying text messages
PFont edmo;

int incorrectScore;

void setup() {
  size (794, 657);
  boolean1 = loadImage ("boolean1.png");
  boolean2 = loadImage ("boolean2.png");
  boolean3 = loadImage ("booleangame.png"); // lvls 
  boolean9 = loadImage ("boolean9.png"); //game over
  boolean11 = loadImage ("booleangamewrong.png"); //wrong
  boolean10 = loadImage ("youwin.png"); //win  
  edmo = loadFont ("edmo.vlw");
  textAlign(CENTER, CENTER);
  for (int i = 0; i < numSteps; i++) {
    sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
  }
  println(sequence);
  println(createIngredients(sequence));
}

void draw () {
  if (level1) {
    image (boolean1, 0, 0); //intro
  }

  if (level2) {
    image (boolean2, 0, 0); //instruction
  }

  if (level3) { //lv1
    background(128);
    image (boolean3, 0, 0); //start game! intro
    if (!((millis() - startTime) > dispTime)) {                                              // if the sequence display timer hasn't finished...
      fill(0); 
      text(createIngredients(sequence), 470, 400, 200, 100); // (x-axis, y-axis, width, ?)
      textFont (edmo);      // ...display the sequence
    }  
    else {
      for (int i = 0; i < buttonX.length; i++) {  
        //drawButton(buttonX[i], buttonY[i], buttonR, "Step " + i);                            // otherwise draw the buttons
      }
    }
    if (message) {         // if a message is to be displayed...
      fill(0);
      if (incorrectPress) {
        image(boolean11, 0, 0);
      }
      text(messageText, 175, 400 , width, 100); // correct! or incorrect!        // ...display the message
      
     if (millis() - messageTime > dispTime2) {                                               // if the message timer has finished...
        message = false;                                                                     // ...don't display the message any longer
        incorrectPress = false;  
    }
    }
    if (playerWins) {                                                                        // if the player wins...
      text("Great start! Press 'n' to continue.", 520, 380, 100, 150);       // ...display text
      textFont (edmo);
    }
  }

  if (level4) {

    image (boolean3, 0, 0); // level2 
    background(128);
    image (boolean3, 0, 0); //start game! intro
    if (!((millis() - startTime) > dispTime)) {                                              // if the sequence display timer hasn't finished...
      fill(0);
      text(createIngredients(sequence), 470, 400, 200, 100);
      textFont (edmo);      // ...display the sequence
    }  
    else {
      for (int i = 0; i < buttonX.length; i++) {  
        //drawButton(buttonX[i], buttonY[i], buttonR, "Step " + i);                            // otherwise draw the buttons
      }
    }
    if (message) {         // if a message is to be displayed...
      fill(0);
      if (incorrectPress) {
        image(boolean11, 0, 0);
      }
      text(messageText, 175, 405 , width, 100);                                                 // ...display the message
      if (millis() - messageTime > dispTime2) {                                               // if the message timer has finished...
      message = false;         // ...don't display the message any longer
      incorrectPress = false;   
    }
    }
    if (playerWins) {                                                                        // if the player wins...
      text("Nice job!", 520, 380, 100, 150);                                                  // ...display text
    }
  }

  if (level5) {
    image (boolean3, 0, 0); // level3 
    background(128);
    image (boolean3, 0, 0); //start game! intro
    if (!((millis() - startTime) > dispTime)) {                                              // if the sequence display timer hasn't finished...
      fill(0);
      text(createIngredients(sequence), 470, 400, 200, 100);                                                    // ...display the sequence
    }  
    else {
      for (int i = 0; i < buttonX.length; i++) {  //drawButton(buttonX[i], buttonY[i], buttonR, "Step " + i);                            // otherwise draw the buttons
      }
    }
    if (message) {         // if a message is to be displayed...
      fill(0);
      if (incorrectPress) {
        image(boolean11, 0, 0);
      }
      text(messageText, 175, 400 , width, 100);                                                 // ...display the message
      if (millis() - messageTime > dispTime2) {                                               // if the message timer has finished...
      message = false;                                                                     // ...don't display the message any longer
      incorrectPress = false;   
    }
    }
    if (playerWins) {                                                                        // if the player wins...
    text("You have just WOWed me, young one.", 520, 380, 100, 150);       // ...display text                                                  // ...display text
    }
  }

  if (level6) {
    image (boolean3, 0, 0); // level4
    background(128);
    image (boolean3, 0, 0); //start game! intro
    if (!((millis() - startTime) > dispTime)) {                                              // if the sequence display timer hasn't finished...
      fill(0);
      text(createIngredients(sequence), 470, 400, 200, 100);                                                    // ...display the sequence
    }  
    else {
      for (int i = 0; i < buttonX.length; i++) {  
        //drawButton(buttonX[i], buttonY[i], buttonR, "Step " + i);                            // otherwise draw the buttons
      }
    }
    if (message) {         // if a message is to be displayed...
      fill(0);
      if (incorrectPress) {
        image(boolean11, 0, 0);
      }
      text(messageText, 175, 400 , width, 100);                                                 // ...display the message
      if (millis() - messageTime > dispTime2) {                                               // if the message timer has finished...
        message = false;           // ...don't display the message any longer
        incorrectPress = false;   
    }
    }
    if (playerWins) {                                                                        // if the player wins...
      text("I can almost taste the barista certificate!", 524, 390, 100, 150);      // ...display text 
  }
  }
  if (level12) {
    background(128);
    image (boolean3, 0, 0); //start game! intro
    if (!((millis() - startTime) > dispTime)) {                                              // if the sequence display timer hasn't finished...
      fill(0); 
      text(createIngredients(sequence), 470, 400, 200, 100); // (x-axis, y-axis, width, ?)
      textFont (edmo);      // ...display the sequence
    }  
    else {
      for (int i = 0; i < buttonX.length; i++) {  
        //drawButton(buttonX[i], buttonY[i], buttonR, "Step " + i);                            // otherwise draw the buttons
      }
    }
    if (message) {         // if a message is to be displayed...
      fill(0);
      if (incorrectPress) {
        image(boolean11, 0, 0);
      }
      text(messageText, 175, 400 , width, 100); // correct! or incorrect!        // ...display the message
      
     if (millis() - messageTime > dispTime2) {                                               // if the message timer has finished...
        message = false;                                                                     // ...don't display the message any longer
        incorrectPress = false;  
    }
    }
    if (playerWins) {                                                                        // if the player wins...
      text("You are doing a fine job.", 520, 380, 100, 150);       // ...display text
      textFont (edmo);
    }
  }
  if (level7) {
    image (boolean3, 0, 0); // level4
    background(128);
    image (boolean3, 0, 0); //start game! intro
    if (!((millis() - startTime) > dispTime)) {                                              // if the sequence display timer hasn't finished...
      fill(0);
      text(createIngredients(sequence), 470, 400, 200, 100);                                                   // ...display the sequence
    }  
    else {
      for (int i = 0; i < buttonX.length; i++) {  
        //drawButton(buttonX[i], buttonY[i], buttonR, "Step " + i);                            // otherwise draw the buttons
      }
    }
    if (message) {         // if a message is to be displayed...
      fill(0);
      if (incorrectPress) {
        image(boolean11, 0, 0);
      }
      text(messageText, 175, 400 , width, 100);                                                 // ...display the message
      if (millis() - messageTime > dispTime2) {                                               // if the message timer has finished...
        message = false;                                                                     // ...don't display the message any longer
        incorrectPress = false;   
    }
    }
    if (playerWins) {                                                                        // if the player wins...
      image (boolean10, 0, 0); //image (boolean10); // win
  }
  }

  if (level9) {
    image (boolean9, 0, 0); // fail
  }
}


void drawButton (int x, int y, int radius, String label) {                                  // the drawButton function needs an x position, y position, radius, and text label
  fill(255);
  ellipse(x + radius, y + radius, radius * 2, radius *2);                                  // draw an ellipse for the button
  fill(255);
  textAlign(CENTER, CENTER);
  text(label, x, y, radius * 2, radius * 2);                                               // display the button label text
}


void mousePressed() { // when the mouse is pressed
  if ((millis() - startTime) > dispTime) { 
    for (int i = 0; i < buttonX.length; i++) {                                               // for all of the buttons
      if (mouseX > buttonX[i] && mouseX < buttonX[i] + (buttonR * 2) && mouseY > buttonY[i] && mouseY < buttonY[i] + (buttonR * 2)) {      // if the mouse pointer is within the area of one of the buttons
        if (currentStep < sequence.length()) {                                               // if the player hasn't recalled the entire sequence yet
          if (str(i).equals(str(sequence.charAt(currentStep)))) {                            // if the button pressed is the next step in the sequence
            selectedSteps = selectedSteps.concat(str(i));                                    // add the step to the String of the steps the player has already recalled
            currentStep++;                                                                   // increment the step counter
            if (currentStep == sequence.length()) {                                          // if the player has reached the end of the sequence
              message = false;
              playerWins = true;                                                             // the player wins
              incorrectPress = false;  
          } 
            else {
              message = true;                                                                // otherwise display a message
              messageText = "Correct!";
              messageTime = millis();
              incorrectPress = false;  
          }
          } 
          else {                                                                           // if the button pressed is not the next step in the sequence
            message = true;             // display a message
            messageText = "Try Again!"; 
            incorrectScore++;
            incorrectPress = true;
            if (incorrectScore == 4) {
              level3 = false;
              level4 = false;
              level5 = false;
              level6 = false;
              level7 = false;
              level9 = true;
            }    
            messageTime = millis();
          }
        }
      }
    }
  }
}

void keyPressed () {
  if (level1) {
    if (key == ' ') {
      level1 = false; 
      level3 = true;
      startTime = millis();                                                                    // start the sequence display timer
    }
    if (key == 'i') {
      level1 = false;
      level2 = true;
    }
  }
  if (level2) {
    if (key == 'b') {
      level2 = false;
      level1 = true;
    }
  }
  if (level3 && playerWins) {
    if (key == 'n') {
      level3 = false;
      level4 = true;
      playerWins = false;
      startTime = millis();
      numSteps = 4;
      dispTime = 3000;
      sequence = "";
      selectedSteps = "";
      currentStep = 0;
      incorrectScore = 0;
      for (int i = 0; i < numSteps; i++) {
        sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
      }
      println(sequence);
    }
  }
  if (level4 && playerWins) {
    if (key == 'n') {
      level4 = false;
      level5 = true;
      playerWins = false;
      startTime = millis();
      numSteps = 5;
      dispTime = 6000;
      sequence = "";
      selectedSteps = "";
      currentStep = 0;
      incorrectScore = 0;
      for (int i = 0; i < numSteps; i++) {
        sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
      }
      println(sequence);
    }
  }
  if (level5 && playerWins) {
    if (key == 'n') {
      level5 = false;
      level6 = true;
      playerWins = false;
      startTime = millis();
      numSteps = 5;
      dispTime = 4000;
      sequence = "";
      selectedSteps = "";
      currentStep = 0;
      incorrectScore = 0;
      for (int i = 0; i < numSteps; i++) {
        sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
      }
      println(sequence);
    }
  }
  if (level6 && playerWins) {
    if (key == 'n') {
      level6 = false;
      level12 = true;
      playerWins = false;
      startTime = millis();
      numSteps = 6;
      dispTime = 7000;
      sequence = "";
      selectedSteps = "";
      currentStep = 0;
      incorrectScore = 0;
      for (int i = 0; i < numSteps; i++) {
        sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
      }
      println(sequence);
    }
  }
  if (level12 && playerWins) {
    if (key == 'n') {
      level12 = false;
      level7 = true;
      playerWins = false;
      startTime = millis();
      numSteps = 6;
      dispTime = 8000;
      sequence = "";
      selectedSteps = "";
      currentStep = 0;
      incorrectScore = 0;
      for (int i = 0; i < numSteps; i++) {
        sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
      }
      println(sequence);
    }
  }
  
  if (level7 && playerWins) {
    if (key == 'n') {
      level7 = false;
      level10 = true;
      incorrectScore = 0;
    }
  }
  if (level9) {
    if (key == 'n') {
      level3 = true;
      level9 = false;
      playerWins = false;
      message = false;
      startTime = millis();
      numSteps = 3;
      dispTime = 3000;
      sequence = "";
      selectedSteps = "";
      currentStep = 0;
      incorrectScore = 0;
      for (int i = 0; i < numSteps; i++) {
        sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
      }
      println(sequence);
    }
  }
  if (level10) { //
    if (key == 'n') {
      level3 = true;
      level10 = false;
      playerWins = false;
      message = false;
      startTime = millis();
      numSteps = 3;
      dispTime = 3000;
      sequence = "";
      selectedSteps = "";
      currentStep = 0;
      incorrectScore = 0;
      for (int i = 0; i < numSteps; i++) {
        sequence = sequence.concat(str(int(random(0, 10))));                                   // create a String of a sequence of random digits representing the steps to recall
      }
      println(sequence);
    }
  }
}

String createIngredients(String sequence) {
  String words = "";
  for (int i = 0; i < sequence.length(); i++) {
    if (str(sequence.charAt(i)).equals("0")) {
      words = words.concat("milk");
    }
    if (str(sequence.charAt(i)).equals("1")) {
      words = words.concat("coffee");
    }
    if (str(sequence.charAt(i)).equals("2")) {
      words = words.concat("heat");
    }
    if (str(sequence.charAt(i)).equals("3")) {
      words = words.concat("tea");
    } 
    if (str(sequence.charAt(i)).equals("4")) {
      words = words.concat("ice");
    }
    if (str(sequence.charAt(i)).equals("5")) {
      words = words.concat("caramel");
    } 
    if (str(sequence.charAt(i)).equals("6")) {
      words = words.concat("sugar");
    }
    if (str(sequence.charAt(i)).equals("7")) {
      words = words.concat("vanilla");
    } 
    if (str(sequence.charAt(i)).equals("8")) {
      words = words.concat("espresso");
    }
    if (str(sequence.charAt(i)).equals("9")) {
      words = words.concat("cream");
    }
    if (i < sequence.length()-1) {
      words = words.concat(", ");
    }
  }
  return words;
}



