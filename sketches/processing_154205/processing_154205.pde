
// Norm Krumpe
// A variant of Nim.  Players take turns removing 1 or 2
// coins from a pile.  Whoever is forced to take the last
// coin loses.  This is a human vs. computer game.  

int coinCount = 24; // Starting # of coins
boolean humanTurn = true; // Set to false to let computer start
int startTimeForComputerTurn; // Used for creating delays in the game
int computerMove;

// These indicate the size and location of the leftmost
// user button.
int buttonX, buttonY;
int buttonWidth, buttonHeight;

// Set up the board.
void setup() {
  size(800, 300);
  buttonX = 15;
  buttonY = height/2 - 70;
  buttonWidth = 50;
  buttonHeight = 30;
  smooth();
}

// Draw the coins and the appropriate buttons.
// Does this really need to happen several times per second?
void draw() {
  background(150);

  if (coinCount > 0) {
    drawGameBoard();
  } 
  else {// pile is empty...someone won!
    drawWinnerButton();
  }
  
}

// The main drawing routine...it draws the coins and buttons
// for a game in progress
void drawGameBoard() {
  
  if (humanTurn) {
    drawCoins(0);
    drawHumanButtons();
  }
  else {
    decideComputerMove();
    // Don't shade the computer's coins yellow until after
    // the first second of delay
    if (millis() - startTimeForComputerTurn < 1000)
      drawCoins(0);
    else
      drawCoins(computerMove);
      
    if (millis() - startTimeForComputerTurn < 3000) {
      drawComputerMoveButton();
    }
    else {
      humanTurn = true;
      coinCount -= computerMove;
    }
  }
  
  text("Take one or two coins. If you take the last coin, you will lose!", 5, 15);
}

// The logic for making a good move.  Needs
// improvement.  Current strategy is easy to beat
// if the human knows the game.
void decideComputerMove() {
  if (random(1) < .5)
  computerMove = 1;
  else
  computerMove = 2;
}

// This is how the player makes a move
// It checks to see if the mouse was clicked within a certain
// range (the location of the buttons) and decides which move
// to make based on that.
void mousePressed() {
  if (humanTurn && coinCount > 0) {
    // See if click was inside move1 button
    if (mouseX >= buttonX && 
      mouseY >= buttonY &&
      mouseX <= buttonX + buttonWidth &&
      mouseY <= buttonY + buttonHeight) {
      coinCount -=1;
      humanTurn = false;
    }
    
    // See if click was inside move2 button
    else if (mouseX >= buttonX + buttonWidth + 10 && 
      mouseY >= buttonY &&
      mouseX <= buttonX + 2 * buttonWidth + 10 &&
      mouseY <= buttonY + buttonHeight && 
      coinCount >= 2) {
      coinCount -=2;
      humanTurn = false;      
    }
    // If human just made a move, start a timer so that
    // the computer's move is delayed
    if (!humanTurn)
      startTimeForComputerTurn = millis();
  }
}

// Draw the button that lets the user take 1 coin
void drawTake1Button() {
  fill(255, 255, 0);
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  fill(0);
  text("Take 1", buttonX + 5, buttonY + 20);
}

// Draw the button that lets the user take 2 coins
void drawTake2Button() {
  fill(255, 255, 0);
  rect(buttonX + buttonWidth + 10, buttonY, buttonWidth, buttonHeight);
  fill(0);
  text("Take 2", buttonX + buttonWidth + 15, buttonY + 20);
}

// Draw the button to indicate who won
void drawWinnerButton() {
  fill(255, 255, 0);
  rect(buttonX, buttonY, buttonWidth * 2 + 20, buttonHeight);
  fill(0);

  // if it is the human's turn, it is because the computer just
  // made a move and took the last coin
  if (humanTurn)  
    text("Human wins!", buttonX + 5, buttonY + 20);
  else
    text("Computer wins!", buttonX + 5, buttonY + 20);
}

// Draw the button to indicate the computer's intended move
void drawComputerMoveButton() {
  fill(255, 255, 0);
  rect(buttonX, buttonY, buttonWidth * 2 + 20, buttonHeight);
  fill(0);
  text("Computer takes " + computerMove, buttonX + 5, buttonY + 20);
}

// Draw the coins and the coin count.  Specifying the numHighlighted
// indicates how many of the coins should be marked yellow.  This is
// useful for showing the player's move before actually making the move.
void drawCoins(int numHighlighted) {
  fill(0);
  for (int i = 1; i <= coinCount - numHighlighted; i++)
    ellipse(i * 30, height/2, 20, 20);

  // Make the last few coins yellow
  fill(255, 255, 0);
  for (int i = coinCount - numHighlighted + 1; i <= coinCount; i++)
    ellipse(i * 30, height/2, 20, 20);

  fill(255);
  text (coinCount, 20, height/2 + 25);
}

// Draw the take1 and take2 buttons, as appropriate
void drawHumanButtons() {
  drawTake1Button();
  if (coinCount > 1)
    drawTake2Button();
}

