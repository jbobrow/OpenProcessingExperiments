
//////////////////////////////////////////////////////////////////////
//                           Tyler Helmuth                          //
//                              10/2/12                             //
//                             CSE 174H                             //
//  This program adds and subtracts values then displays them on    //
//                    the screen like a calculator                  //
//////////////////////////////////////////////////////////////////////

final int EMPTY = -100;
final int NOT_DISPLAYED = -200;

int input1 = EMPTY;
int input2 = EMPTY;
int finalAnswer;
int theDisplayedValue = NOT_DISPLAYED;

boolean additionHasBeenChosen = false;
boolean subtractionHasBeenChosen = false;

PFont font;

void setup() {
  size(600, 600);
  background(175);
  noStroke();

  // loads font
  font = loadFont("LiSongPro-48.vlw");
}
// Draws buttons and rules
void draw() {
  smooth();
  buttonOne();
  buttonTwo();
  buttonThree();
  buttonFour();
  equalButton();
  additionButton();
  subtractionButton();
  resetButton();
  rules();
}

void buttonOne() {
  // if button one is clicked twice
  // fill cyan
  if (input1 == 1 && input2 == 1) {
    fill(0, 255, 255);
  }
  // if button one is clicked for the first time
  // fill green
  else if (input1 == 1) {
    fill(0, 255, 0);
  }
  // if button one is clicked after another 
  // button has been clicked
  // fill green
  else if (input2 == 1 && input1 != 1) {
    fill(0, 255, 0);
  }
  // else fill black
  else {
    fill(0);
  }
  rect(100, 100, 50, 50);
  fill(255);
  rect(125, 105, 5, 40);
}

void buttonTwo() {
  // if button two is clicked twice
  // fill cyan
  if (input1 == 2 && input2 == 2) {
    fill(0, 255, 255);
  }

  // if button two is clicked for the first time
  // fill green
  else if (input1 == 2) {
    fill(0, 255, 0);
  }

  // if button two is clicked after another 
  // button has been clicked
  // fill green
  else if (input2 == 2 && input1 != 2) {
    fill(0, 255, 0);
  }

  // else fill black
  else {
    fill(0);
  }
  rect(200, 100, 50, 50);
  fill(255);
  rect(205, 105, 35, 5); 
  rect(235, 105, 5, 20);
  rect(205, 120, 35, 5);
  rect(205, 120, 5, 25);
  rect(205, 140, 35, 5);
}

void buttonThree() {
  // if button three is clicked twice
  // fill cyan
  if (input1 == 3 && input2 == 3) {
    fill(0, 255, 255);
  }

  // if button three is clicked for the first time
  // fill green
  else if (input1 == 3) {
    fill(0, 255, 0);
  }
  // if button three is clicked after another 
  // button has been clicked
  // fill green
  else if (input2 == 3 && input1 != 3) {
    fill(0, 255, 0);
  }

  // else fill black
  else {
    fill(0);
  }
  rect(100, 200, 50, 50);
  fill(255);
  rect(140, 205, 5, 40);
  rect(105, 205, 35, 5); 
  rect(105, 222, 35, 5);
  rect(105, 240, 35, 5);
}

void buttonFour() {
  // if button four is clicked twice
  // fill cyan
  if (input1 == 4 && input2 == 4) {
    fill(0, 255, 255);
  }

  // if button four is clicked for the first time
  // fill green
  else if (input1 == 4) {
    fill(0, 255, 0);
  }

  // if button four is clicked after another 
  // button has been clicked
  // fill green
  else if (input2 == 4 && input1 != 4) {
    fill(0, 255, 0);
  }

  // else fill black
  else {
    fill(0);
  }
  rect(200, 200, 50, 50);
  fill(255);
  rect(205, 205, 5, 20);
  rect(205, 225, 35, 5);
  rect(235, 205, 5, 40);
}

void additionButton() {
  // If the addition button is pressed
  // fill green
  if (additionHasBeenChosen && subtractionHasBeenChosen == false) {
    fill(0, 255, 0);
  }
  else {
    fill(0, 0, 255);
  }
  rect(100, 400, 50, 50);
  fill(255);
  rect(123, 405, 5, 40);
  rect(105, 424, 40, 5);
}

void subtractionButton () {
  // If subraction button is pressed
  // fill green
  if (subtractionHasBeenChosen && additionHasBeenChosen == false) {
    fill(0, 255, 0);
  }
  else {
    fill(0, 0, 255);
  }
  rect(200, 400, 50, 50);
  fill(255);
  rect(205, 425, 40, 5);
}

void equalButton() {
  fill(255, 0, 0);
  rect(400, 400, 50, 50);
  fill(255);
  rect(405, 415, 40, 5);
  rect(405, 430, 40, 5);
}

void resetButton() {
  fill(255, 0, 0);
  rect(400, 300, 50, 50);
  fill(255);
  rect(405, 305, 5, 40);
  rect(405, 305, 30, 5);
  rect(430, 305, 5, 15);
  rect(405, 320, 30, 5);
  quad(413, 320, 435, 345, 427, 345, 405, 320);
}

void mouseClicked() {
  // if mouse is on button 1
  if (mouseX > 100 && mouseX < 150 && 
    mouseY > 100 && mouseY < 150) {
    // assign 1 to either input1 or input2
    assignValues(1);
  }
  // if mouse is on button 2
  if (mouseX > 200 && mouseX < 250 &&
    mouseY > 100 && mouseY < 150) {
    // assign 2 to either input1 or input2   
    assignValues(2);
  }
  // if mouse is on button 3
  if (mouseX > 100 && mouseX < 150 &&
    mouseY > 200 && mouseY < 250) {
    // assign 3 to either input1 or input2
    assignValues(3);
  }
  // if mouse is on button 4
  if (mouseX > 200 && mouseX < 250 &&
    mouseY > 200 && mouseY < 250) {
    // assign 4 to either input1 or input2
    assignValues(4);
  }
  // if mouse is on the addition button
  if (mouseX > 100 && mouseX < 150 &&
    mouseY > 400 && mouseY < 450) {
    // Additition is chosen
    pickOperation(1);

    // when addition is chosen color addition
    // button green and subtraction button black
    additionHasBeenChosen = true;
    subtractionHasBeenChosen = false;
  }
  // if mouse is on subtraction button
  if (mouseX > 200 && mouseX < 250 &&
    mouseY > 400 && mouseY< 450) {
    // Subtraction is chosen
    pickOperation(2);

    // when subtraction is chosen color 
    // subtraction button green and addition
    // button black
    subtractionHasBeenChosen = true;
    additionHasBeenChosen = false;
  }
  // if mouse is on the equal button
  if (mouseX > 400 && mouseX < 450 &&
    mouseY > 400 && mouseY < 450) {
    // Show the answer
    displayAnswer();
  }
  // if mouse is on reset button
  if (mouseX > 400 && mouseX < 450 &&
    mouseY > 300 && mouseY < 350) {
    // Reset all variables to their original states
    input1 = EMPTY;
    input2 = EMPTY;
    additionHasBeenChosen = false;
    subtractionHasBeenChosen = false;
    // Covers answer
    theDisplayedValue = NOT_DISPLAYED;
    displayAnswer();
  }
}

// Method that puts the value clicked into either
// input1 or input2 depending on which one is empty.
// If both are full nothing happens
void assignValues( int theButtonsValue ) {
  // if input1 is empty, assign value clicked
  if (input1 == EMPTY) {
    input1 = theButtonsValue;
  }
  // if input 1 is full and input2 is empty
  // assign value clicked
  else if (input2 == EMPTY) {
    input2 = theButtonsValue;
  }
}

void pickOperation( int chosenOperation ) {
  // if the addition button is pressed and there are values
  // for input1 and input2
  if (chosenOperation == 1 && input1 != EMPTY && 
    input2 != EMPTY) {
    calculateAddition();
  }
  // if the subtraction button is pressed and there are values
  // for input1 and input2
  if (chosenOperation == 2 && input1 != EMPTY && 
    input2 != EMPTY) {
    calculateSubtraction();
  }
}

// Calls a function that does addition to decide
// what answer should be displayed
void calculateAddition() {
  if (finalAnswerIfAddition() == 2) {
    //the answer that needs to be displayed is 2
    theDisplayedValue = 2;
  }
  else if (finalAnswerIfAddition() == 3) {
    //the answer that needs to be displayed is 3
    theDisplayedValue = 3;
  }
  //the answer that needs to be displayed is 4
  else if (finalAnswerIfAddition() == 4) {
    theDisplayedValue = 4;
  }
  //the answer that needs to be displayed is 5
  else if (finalAnswerIfAddition() == 5) {
    theDisplayedValue = 5;
  }
  //the answer that needs to be displayed is 6
  else if (finalAnswerIfAddition() == 6) {
    theDisplayedValue = 6;
  }
  //the answer that needs to be displayed is 7
  else if (finalAnswerIfAddition() == 7) {
    theDisplayedValue = 7;
  }
  //the answer that needs to be displayed is 8
  else if (finalAnswerIfAddition() == 8) {
    theDisplayedValue = 8;
  }
}

// calls apon a function that does subtraction to decide
// what answer should be displayed
void calculateSubtraction() {
  //the answer that needs to be displayed is -3
  if (finalAnswerIfSubtraction() == -3) {
    theDisplayedValue = -3;
  }
  //the answer that needs to be displayed is -2
  else if (finalAnswerIfSubtraction() == -2) {
    theDisplayedValue = -2;
  }
  //the answer that needs to be displayed is -1
  else if (finalAnswerIfSubtraction() == -1) {
    theDisplayedValue = -1;
  }
  //the answer that needs to be displayed is 0
  else if (finalAnswerIfSubtraction() == 0) {
    theDisplayedValue = 0;
  }
  //the answer that needs to be displayed is 1
  else if (finalAnswerIfSubtraction() == 1) {
    theDisplayedValue = 1;
  }
  //the answer that needs to be displayed is 2
  else if (finalAnswerIfSubtraction() == 2) {
    theDisplayedValue = 2;
  }
  //the answer that needs to be displayed is 3
  else if (finalAnswerIfSubtraction() == 3) {
    theDisplayedValue = 3;
  }
  //the answer that needs to be displayed is 4
  else if (finalAnswerIfSubtraction() == 4) {
    theDisplayedValue = 4;
  }
  //the answer that needs to be displayed is 5
  else if (finalAnswerIfSubtraction() == 5) {
    theDisplayedValue = 5;
  }
  //the answer that needs to be displayed is 6
  else if (finalAnswerIfSubtraction() == 6) {
    theDisplayedValue = 6;
  }
  //the answer that needs to be displayed is 7
  else if (finalAnswerIfSubtraction() == 7) {
    theDisplayedValue = 7;
  }
  //the answer that needs to be displayed is 8
  else if (finalAnswerIfSubtraction() == 8) {
    theDisplayedValue = 8;
  }
}

// calculates the addition of input1 and input2
int finalAnswerIfAddition() {
  int sum = input1 + input2;
  return sum;
}

// calculates the difference between input1 and input2
int finalAnswerIfSubtraction() {
  int difference = input1 - input2;
  return difference;
}

void displayAnswer() {
  // Sets font size to 50
  textFont(font, 50);

  // When rest button pressed, draw a 
  // rect that covers the answer
  if (theDisplayedValue == NOT_DISPLAYED) {
    noStroke();
    fill(175);
    rect(400, 0, 100, 70);
  }
  // Display -3
  else if (theDisplayedValue == -3) {
    fill(0);
    text("-3", 400, 70);
  }
  // Display -2
  else if (theDisplayedValue == -2) {
    fill(0);
    text("-2", 400, 70);
  }
  // Display -1
  else if (theDisplayedValue == -1) {
    fill(0);
    text("-1", 400, 70);
  }
  // Display 0
  else if (theDisplayedValue == 0) {
    fill(0);
    text("0", 400, 70);
  }
  // Display 1
  else if (theDisplayedValue == 1) {
    fill(0);
    text("1", 400, 70);
  }
  // Display 2
  else if (theDisplayedValue == 2) {
    fill(0);
    text("2", 400, 70);
  }
  // Display 3
  else if (theDisplayedValue == 3) {
    fill(0);
    text("3", 400, 70);
  }
  // Display 4
  else if (theDisplayedValue == 4) {
    fill(0);
    text("4", 400, 70);
  }
  // Display 5
  else if (theDisplayedValue == 5) {
    fill(0);
    text("5", 400, 70);
  }
  // Display 6
  else if (theDisplayedValue == 6) {
    fill(0);
    text("6", 400, 70);
  }
  // Display 7
  else if (theDisplayedValue == 7) {
    fill(0);
    text("7", 400, 70);
  }
  // Display 8
  else if (theDisplayedValue == 8) {
    fill(0);
    text("8", 400, 70);
  }
}

// Displays the directions for 
// properly using the calculator
void rules() {
  fill(0);
  textFont(font, 50);
  text("ANSWER = ", 130, 70);

  textFont(font, 20);
  text("Pick two numbers and then the operator", 50, 510);
  text("The first number will be subtracted by the second number", 
  50, 540);
  text("'R' resets everything", 50, 570);
}


