
/*
Daniel Bickley
 CSE 270M
 Final Project - Multi-Pile Nim
 
 Program that plays through a single game of nim.
 
 Nim is a mathmatical game where two players take turns
 removing any number of sticks from a series of piles. 
 The game has a mathmatical solution that guarentees that
 one player will win over the other.
 
 This program creates a series of nim piles, and multiple
 choices for AI difficulty, either choosing random moves or
 finding an optimal move each time.
 */


public final int NUM_PILES = 10; //Number of piles for the game. Should be 10, or else the GUI will be weird.
public final int PILE_WIDTH = 60; //Width of the piles in the GUI.
public final int TRIANGLE_RAD = 20; //Radius used for Taxicab Geometry to find distance between mouse and buttons.
public final int SIZE_PILES = 10; //Upper bound on number of sticks per pile. 1 or 2 digit numbers look the best.
public static int heightOfPiles = -1; //Height of the pile, depends on the window. 
public static int selectedValue = -1; //Specific pile that is clicked on
public static float sizePerStick = -1; //Keeps track of the height of each stick in each pile.

//OPTIONS
public static boolean hardMode = false; //One bad move, human loses.
public static boolean goodCols = false; //Shows all of the columns with good moves
public static boolean goodMoves = false; //Shows a good move for each column, if there is one.

//Ending splash screen boolean. If true, game won't do anything.
public static boolean endScreen = false;

NimPile[] piles = new NimPile[NUM_PILES]; //Each pile.

void setup() {
  size(2*(PILE_WIDTH * NUM_PILES)+10*piles.length, 700); //Define the window to be a good size. 
  //Note, this was going to scale with more piles, but bugs were created, and there isn't time to squash them.
  makePiles(); //Make each pile
  drawGame(); //Draw the game.
}

//Initilizes all of the piles of nim, and makes sure that the human can win every game.
void makePiles() {
  for (int i = 0; i < piles.length; i++) {
    int pileSize = (int)random(0, SIZE_PILES); //Random number of sticks
    //Get largest pile for GUI purposes
    if (pileSize > heightOfPiles)
      heightOfPiles = pileSize;
    piles[i] = new NimPile(pileSize); //Assign the new pile value
  }
  //If the nimber of the game is 0, then the player after the current player will win, AKA the Computer will win.
  //So, if the game nimber if 0, then make new piles. 
  if (getNimber()==0)
    makePiles();
}

//Finds the current "nimber". The nimber is the number of sticks in each pile XOR'd together. 
int getNimber() {
  int num = 0; //Nimber
  for (int i = 0; i < piles.length; i++) {
    num ^= piles[i].pileSize; //XOR pile
  } 
  return num; //Return overall nimber
}

//Creates the GUI to the game.
void drawGame() { 

  //If the game has ended, don't do anything.
  if (endScreen)
    return;

  background(200, 255, 200); //Make a background to draw over.
  //Arbitrarly expression for the size of each stick. Thought it looked decent, so I moved on to more important things
  sizePerStick = .9*(height-height/10)/(heightOfPiles);

  for (int i = 0; i < NUM_PILES; i++) { //Draw each pile
    piles[i].drawPile(i, sizePerStick);
  }

  if (selectedValue != -1) { //If a pile has been selected
    if (goodCols) { //If the player wants to see the columns with good moves
      goodCols = !goodCols; //Temporarly turn it off
      piles[selectedValue].drawPile(selectedValue, sizePerStick); //Draw selected pile
      goodCols = !goodCols; //Turn it back on
    }
    fill(255, 255, 255, 230); //White-out other rows
    rect(0, 0, 5+(selectedValue*5) + selectedValue*PILE_WIDTH, height); //Piles to the left of the selected pile are whited-out
    int size = (width/2) - ((5+(selectedValue+1)*5) + (selectedValue*PILE_WIDTH));  //Calculate width of the nimPiles right of the selected pile
    rect(((selectedValue+1)*5) + ((selectedValue+1)*PILE_WIDTH), 0, size-PILE_WIDTH+5, height); //Draw rectangle over the right piles
    drawMenu(); //Draw the move menu
  }  
  else { //Nothing has been selected
    drawInstructions();  //Just draw the instructions pane
  }
}

//Gets the good moves for each pile.
int[] goodMoves () {
  //Create array for the best values.
  int[] goodMoves = new int[NUM_PILES];
  int curNum = getNimber(); //Get game nimber
  //Look at every pile
  for (int i = 0; i < piles.length; i++) {
    if (piles[i].pileSize == 0) { //If there aren't any sticks in the pile
      goodMoves[i] = -1;  //There isn't a good move.
    } 
    else { //There are sticks in the pile
      int goodPileSize = piles[i].pileSize ^ curNum;
      //Get the good move by XORing the game nimber and the pile size
      if (goodPileSize >= piles[i].pileSize) {
        //If the good move requires adding sticks
        //That isn't a good move.
        goodMoves[i] = -1;
      } 
      else {
        //There is a good move and it is possible to play
        goodMoves[i] = goodPileSize; //Put in in the array
      }
    }
  }
  return goodMoves;
}

//Creates an ending screen.
void endScreen (boolean won) {
  endScreen = true; //Say the end screen has happened
  fill(255, 255, 255, 200); 
  rect(0, 0, width, height); //White-out the screen
  fill(0, 0, 0); //Make black text
  textSize(30); //Change the text size
  if (won)
    text("You Win!", width/2-30, height/2-20); //Display you win if human won
  if (!won)
    text("You Lose! :(", width/2-30, height/2-20); //Display you lose if human lost
}

//Draw the instructions pane. This is almost all just displaying text, so there aren't a lot of comments.
void drawInstructions () {
  textSize(30);
  fill(0, 0, 0);
  String title = "NIM";
  if (hardMode) { //If the player turns hard mode on, tell them
    title = "HARD-NIM";
    text(title, 3*width/4-90, 30);
  } 
  else {
    text(title, 3*width/4-30, 30);
  }
  textSize(14);
  String line1 = "Nim is mathmatical game consiting of one or more piles of sticks. In this game, there ";
  text(line1, width/2+10, 60);
  String line2 = "are " + NUM_PILES + " of sticks, each with differing amounts of sitcks. Each player selects one pile to remove ";
  text(line2, width/2+10, 78);
  String line3 = "as many markers as the want (as long as they take at least one)";
  text(line3, width/2+10, 96);
  String line4 = "The winner is the last person to remove a marker/stick from the last pile.";
  text(line4, width/2 + 10, 114);

  String line5 = "Being a mathmatical game, there is a strategy that a player can use that will allow you to win";
  text(line5, width/2+10, 148);
  String line6 = "each time. Each game has been set up so that the human player can win every single time";
  text(line6, width/2+10, 166);
  String line7 = "the game is played. To help you out in figuring out the strategy, there are several hints you";
  text(line7, width/2+10, 184);
  String line8 = "can use. There is a button for determining which is the best pile to remove from, and a button ";
  text(line8, width/2+10, 202);
  String line9 = "that will tell you what the best move is. If you are confident in your strategy, change ";
  text(line9, width/2+10, 220);
  String line10 = "the computer to  \"hard mode\", in  this mode, if you make an incorrect move, the computer"; 
  text(line10, width/2+10, 238);
  String line11 = "will win. Good luck!";
  text(line11, width/2+10, 256);

  printPileInfo(); //Draw information on the piles
  drawButtons(); //Draw the buttons for user options
}

//Draw buttons for user options. This is just GUI stuff, no math besides addition for the widths and heights of buttons.
void drawButtons() {

  //Pretty much every value in here is arbitrary. The spacing just looks nice.
  textSize(25);
  fill(104, 106, 69);
  rect(width/2 + 10, 300 + 16*(piles.length+2), width/6-20, width/6 - 20);
  fill(208, 212, 138);
  rect(width/2 + 20, 310 + 16*(piles.length+2), width/6-40, width/6 - 40);
  fill(0, 0, 0);
  text("BEST PILE", width/2+(width/6 - 40)/10+30, 310+(16*piles.length+2) + (width/6 - 40)/2 + 30);
  fill(99, 77, 111);
  rect(width/2 + width/6+5, 300 + 16*(piles.length+2), width/6-20, width/6 - 20);
  fill(188, 154, 222);
  rect(width/2+width/6+15, 310+16*(piles.length+2), width/6 - 40, width/6 - 40);
  fill(0, 0, 0);
  text("GOOD MOVES", width/2+width/6 - 40/10+22, 310+(16*piles.length+2) + (width/6 - 40)/2 + 30);
  fill(118, 54, 54);
  rect(width/2 + width/3, 300 + 16*(piles.length+2), width/6-20, width/6 - 20);
  fill(236, 108, 108);
  rect(width/2+width/3 + 10, 310 + 16*(piles.length+2), width/6 - 40, width/6 - 40);
  fill(0, 0, 0);
  text("HARD MODE", width/2+width/3 - 40/10+22, 310+(16*piles.length+2) + (width/6 - 40)/2 + 30);
}

//Prints out information about each pile.
void printPileInfo() {
  int startingVal = 300; //Starting yValue
  int[] moves = goodMoves(); //Get the good moves
  for (int i = 0; i < piles.length; i++) { //For each pile
    String info = "Pile number " + i + " has " + piles[i].pileSize + " sticks left."; //Print out the number of sticks
    text(info, width/2+10, startingVal += 16); 
    if (goodMoves) { //If the user wants good moves
      if (moves[i] > -1) { //If there is not a good move for the specific pile
        //Print out the information
        text("Pile number " + i + " should have " + moves[i]  + " sticks in it", width/2+10+300, startingVal);
      }  
      else {
        //If there is a good move, print it out.
        text("There are no good moves for pile number " + i, width/2+10+300, startingVal);
      }
    }
  }
  if (goodMoves) { //If the user wants good moves

      //Print out what the game nimber is.
    String gameInfo = "The overall game nimber is: " + getNimber();
    text(gameInfo, width/2+10, startingVal+=16);
  }
}

//Draw the move menu, giving the user several useful options and data
void drawMenu() {
  if (goodMoves) { //If the user wants to see good moves
    fill(0, 0, 0); 
    int[] moves = goodMoves(); //Get the good moves
    if (moves[selectedValue] == -1) { //If the pile they are looking at does not have a good move
      text("There are no good moves for this pile.", width/2+50, 100);
    }
    else { //The pile has a good move.
      text("This pile should have " + moves[selectedValue] + " stick(s).", width/2+90, 100);
    }
  }

  //The rest of this method is just arbitrary GUI values, so I won't go into real detail.
  fill(180, 5, 46);
  rect(width/2 + 10, height/2, width/2 -20, 100);
  fill(255, 5, 46);
  rect(width/2 + 20, height/2 + 10, width/2 - 40, 80);
  textSize(30);
  fill(0, 0, 0);
  text("RESET", width/2+70+(width/2-40)/3, height/2+60);

  fill(9, 149, 8);
  rect(width/2 + 10, height/2+ 110, width/2 -20, 100);
  fill(9, 255, 8);
  rect(width/2+20, height/2 + 120, width/2 - 40, 80);
  fill(0, 0, 0);
  text("FINALIZE", width/2+60+(width/2-40)/3, height/2+170);
}


//Calculates the distance between the mouse and a given point when the method is called.
//Uses taxi-cab distance as talked about in class.
float distance (float pX, float pY) {
  return abs(mouseX-pX) + abs(mouseY-pY);
}

//When mouse is clicked
void mousePressed() { //When the user clicks the mouse
  if (mouseX < width/2) { //If it is within the pile half
    if (selectedValue == -1) { //If there hasn't been a selected value
      for (int i = 0; i <  piles.length; i++) { //loop through all the piles.
        if (mouseX > 5+(i*5) + i*PILE_WIDTH && mouseX < 5+(i*5) + (i+1)*PILE_WIDTH) { //If the mouse is within the given pile width, 
          selectedValue = i; //Select it..
        }
      }
      drawGame(); //Redraw the game.
    } 
    else { //Something has been selected
       //If user clicks the little triangle
      if (distance(5+(selectedValue*5) + selectedValue*PILE_WIDTH + PILE_WIDTH/2, height-15+TRIANGLE_RAD/2) < TRIANGLE_RAD) {
        piles[selectedValue].decrementPotential(selectedValue, sizePerStick); //Change the working pile size.
      }
    }
  } 
  else { //Then the user clicked on the instructions side of the game
    if (selectedValue == -1) { //If nothing has beeen selected
      //If user clicks the button to see good columns
      if (mouseX > width/2 + 10 && mouseX < width/2+10+width/6-20 && mouseY > 300 + 16*(piles.length+2) && mouseY < 300 + 16*(piles.length+2) + width/6-20) {
        goodCols = !goodCols; //Toggle good columns
      }
      //If user clicks the button to see good moves
      if (mouseX > width/2 + width/6+5 && mouseX < width/2+width/6+5+width/6-20 && mouseY > 300 + 16*(piles.length+2) && mouseY < 300+16*(piles.length+2)+width/6-20) {
        goodMoves = !goodMoves; //Toggle good moves
      }
      //If the user clicks hard mode
      if (mouseX > width/2 + width/3 && mouseX < width/2+width/3+width/6-20 && mouseY > 300 + 16*(piles.length+2) && mouseY < 300+16*(piles.length+2)+width/6-20) {
        hardMode = !hardMode; //Toggle hardmode
      }      
      drawGame(); //redraw the game
      return;
    }
    //If something was selected and user clicks "reset" button
    if (mouseX > width/2 + 10 && mouseY > height/2 && mouseX < (width/2+ (width/2-20)) && (mouseY < height/2 + 100)) {
      //Resets the working size of the selected pile
      piles[selectedValue].changeVal = piles[selectedValue].pileSize;
    }  
    //If user clicks the Finalize button
    if (mouseX > width/2 + 10 && mouseY > height/2+110 && mouseX < (width/2 + width/2 -20) && mouseY < height/2+210) {
      piles[selectedValue].update(); //Update the pile
      if (isOver()) { //Checks if the game is over
        endScreen(true); //If it is over, show end Screen
      } 
      else { //Not over, so computer moves
        makeCompMove();
      }
    }
    selectedValue = -1; //Deselects any selected pile
    drawGame(); //Redraw the game.
  }
}

//Makes the computer's move based on what the user has set the difficulty for
void makeCompMove() {
  if (hardMode && getNimber() != 0) { //If the AI is on hard and there is a good move
    int[] moves = goodMoves(); //Get the good moves
    for (int i = 0; i < moves.length-1; i++) {
      if (moves[i] != -1) { //Find first good move
        piles[i].changeVal=moves[i]; //Set working value to the good move
        piles[i].update(); //Update the pile
        if (isOver()) { //If the game is now over, computer won
          selectedValue = -1; //Deselect everything
          drawGame(); //Draw the game
          endScreen(false); //Create end screen
        }
        return; //If the computer finds a good move, stop searching.
      }
    }
  } 
  else { //Computer is not on hard. 
    int pileNum = (int)random(0, piles.length); //Randomly choose a pile to alter
    while (piles[pileNum].pileSize == 0) { //If the pile is empty
      pileNum = (int)random(0, piles.length); //Choose a different pile.
    }
    int remove = (int) random(0, piles[pileNum].pileSize-1); //Remove a random number of sticks from the pile
    piles[pileNum].changeVal = remove; //Change working value
    piles[pileNum].update(); //Update the pile
  }
  if (isOver()) { //If the game is over
    selectedValue = -1; //Deselect everything
    drawGame(); //Redraw the game
    endScreen(false); //Make ending screen
    return; //Stop.
  }
  drawGame(); //Draw game if continuing
}

//Loops through the nimpiles and finds if there are any non empty piles.
boolean isOver() {
  for (int i = 0; i < piles.length; i++) {
    if (piles[i].pileSize != 0) { //If there is a non empty pile
      return false; //Game hasn't ended
    }
  }
  return true; //Every pile is empty, so the game is over.
}

//Calls mouse pressed implicitly.
void draw() {
}

/*
Daniel Bickley
 CSE 270M
 Final Project - Multi-Pile Nim
 
 Program that plays through a single game of nim.
 
 NimPile is a helper class that exists to make keeping track of data easier.
 */
 public class NimPile {
   
   //Each NimPile has
  int pileSize;  //A number of sticks
  int changeVal; //A working value
  boolean selected; //If it has been selected.

  //Basic constructor. Not really sure why I have this. But, just in case.
  public NimPile () {
    this.pileSize = 10;
    changeVal = 10;
  }  

  //Single param instructor to give a specific pile size to the pile.
  public NimPile(int size) {
    this.pileSize = size; 
    this.changeVal = size;
  }

  //Method that decreases the potential number of sticks in a pile. This is used when the user
  //is trying to change the number of sticks in a pile.
  public void decrementPotential (int i, float sizePerStick) {
    if (changeVal == 0) //Can't reduce it below 0
      return;
    this.changeVal--; //Removes one stick from the potential
    fill(255, 255, 255);
    
    //This section redraws the pile, but with one less stick. Like other gui sections, I chose these values to make the GUI look good. 
    //No real math is done here.
    
    //Draw the pile and triangle button
    rect(5+(i*5) + i*PILE_WIDTH, 5, PILE_WIDTH, height-height/10); 
    rect(5+(i*5) + i*PILE_WIDTH, height-height/10 + 5, PILE_WIDTH, PILE_WIDTH);
    fill(255, 0, 0);
    triangle(5+(i*5) + i*PILE_WIDTH + PILE_WIDTH/2, height-15, 5+(i*5) + i*PILE_WIDTH + PILE_WIDTH/2+10, height-25, 5+(i*5) + i*PILE_WIDTH + PILE_WIDTH/2-10, height-25);  
    fill(0, 0, 0);
    textSize(30);
    
    //Print out number of sticks
    String size = Integer.toString(piles[i].changeVal);
    if (size.length()!= 1)
      text(Integer.toString(piles[i].changeVal), 5+(i*5) + i*PILE_WIDTH+PILE_WIDTH/5, height-height/10 + 5, PILE_WIDTH, PILE_WIDTH);
    if (size.length() == 1) {
      text(Integer.toString(piles[i].changeVal), 5+(i*5) + i*PILE_WIDTH+PILE_WIDTH/3, height-height/10 + 5, PILE_WIDTH, PILE_WIDTH);
    }
    //Loop to draw sticks
    for (int t = 1; t <= this.changeVal; t++) {
      fill(255, 255, 0);
      rect(5+(i*5) + i*PILE_WIDTH+PILE_WIDTH/9, height-t*sizePerStick-height/10, 3*PILE_WIDTH/4, (int)sizePerStick);
    }
  }

  //Finalizes the change value as set by methods in nimgame.
  public void update () {
    this.pileSize = changeVal;
  }

  //Draw a specific pile and make it look good.
  public void drawPile(int i, float sizePerStick) {
    if(pileSize <= 0) { //If there are 0 (or for some reason negative) pile values, black out the column.
      fill(0,0,0);
      rect(5+(i*5) + i*PILE_WIDTH, 5, PILE_WIDTH, height-10);
      return;
    }
    
    fill(255, 255, 255);
    int[] moves = goodMoves(); //Get good moves
    
    if(goodCols) { //If the user wants to see the good columns
     if(moves[i] != -1)
       fill(100,0,0);  //Color them darkish red
    }
    
    //Gui section
    
    //Backing rectangles and triangular button
    rect(5+(i*5) + i*PILE_WIDTH, 5, PILE_WIDTH, height-height/10);
    rect(5+(i*5) + i*PILE_WIDTH, height-height/10 + 5, PILE_WIDTH, PILE_WIDTH);
    fill(255, 0, 0);
    triangle(5+(i*5) + i*PILE_WIDTH + PILE_WIDTH/2, height-15, 5+(i*5) + i*PILE_WIDTH + PILE_WIDTH/2+10, height-25, 5+(i*5) + i*PILE_WIDTH + PILE_WIDTH/2-10, height-25);  
    
    //Display the number of sticks in the pile
    fill(0, 0, 0);
    textSize(30);
    String size = Integer.toString(piles[i].pileSize);
    if (size.length()!= 1)
      text(Integer.toString(piles[i].pileSize), 5+(i*5) + i*PILE_WIDTH+PILE_WIDTH/5, height-height/10 + 5, PILE_WIDTH, PILE_WIDTH);
    if (size.length() == 1) {
      text(Integer.toString(piles[i].pileSize), 5+(i*5) + i*PILE_WIDTH+PILE_WIDTH/3, height-height/10 + 5, PILE_WIDTH, PILE_WIDTH);
    }
    
    //Draw the sticks from the pile
    for (int t = 1; t <= this.pileSize; t++) {
      fill(255, 255, 0);
      rect(5+(i*5) + i*PILE_WIDTH+PILE_WIDTH/9, height-t*sizePerStick-height/10, 3*PILE_WIDTH/4, (int)sizePerStick);
    }
  }
}



