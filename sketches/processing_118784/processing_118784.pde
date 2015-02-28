
//////////////////////////////
//     Global Variables     //
//////////////////////////////
private Game game = new Game();
private Question question = new Question();
private Answer[] answers = new Answer[3];

// Coordinates for where to draw the buttons
private static final int[] buttonXCoords = {40, 240, 440};

// Limits for generating the random numbers in the questions
private static final int[] limits = {1, 301};

// To store the coordinates of the mouse when clicked
private float[] mouseCoordsOnClick = new float[2];

// Flag for whether we need a new question for the user
private boolean newQuestion = true;

// Flag for whether the game has been started
private boolean gameStarted = false;

// Flag for winning or losing the game
private int gameWon = 0;

// Create new object for the class Cars
private Cars cars = new Cars();

/////////////////////////////
//      Setup method       //
/////////////////////////////
void setup(){
  frameRate(30);
  size(600, 600);
  smooth();

  // Initialise the Answer objects
  for(int i=0; i<3; i++){
    answers[i] = new Answer();
    
    // Set each answer box's x-coordinate
    answers[i].setXCoord(buttonXCoords[i]);
  }
}

//////////////////////////////
//     Main draw method     //
//////////////////////////////
void draw(){
    // Draw background
    fill(255);
    rect(0, 0, width, 250);
    
    // If the button has been pressed to start the game
    if(gameStarted == true){
      // Game lost
      if(gameWon==1){
        fill(0);
        textSize(35);
        text("YOU LOST!", 215, 200);
      }
      else if(gameWon==2){
        fill(0);
        textSize(35);
        text("YOU WON!", 215, 200);
      }
      if(gameWon==0){
        // If a new question is needed (user answered)
        if(newQuestion == true){
          // No new questions until the user has answered
          newQuestion = false;
      
          // Draw background
          fill(255);
          rect(0, 250, width, 350);
    
          // New question!
          game.newQuestion();
        }
        cars.moveCars();
        cars.drawCars();
        cars.checkWin();
      }
    }
    else{
      fill(0);
      rect(200, 200, 200, 100);
      fill(255);
      textSize(25);
      text("Start Game", 235, 255);
    }
}

//////////////////////////////
//        Game class        //
//////////////////////////////
class Game{
  // Constructor
  public void Game(){
    
  }
  
  // Sets up and initiates the Question and Answer classes,
  // creating a new question and answer selection for the user
  public void newQuestion(){
    int rand=0;
    // Draw a new question to the screen
    question.drawQuestion();

    // Reset the 'correct' answer box
    for(int i=0; i<3; i++){
      answers[i].setCorrect(false);
    }

    // Randomly designate an answer box as the 'correct' one
    answers[int(random(0, 3))].setCorrect(true);
  
    for(int i=0; i<3; i++){
      if(answers[i].isCorrect()==true){
        // Give the 'correct' answer box the value of the answer that was worked out earlier
        answers[i].setValue(question.getAnswer());
      }
      else{
        // Give the two other answer boxes random numbers in the possible range
        rand = int(random(-149, 301));
        while(rand==question.getAnswer()){
          rand = int(random(-149, 301));
        }
        answers[i].setValue(int(random(-149, 301)));
      }
    
      // Draw the box that the answer sits in
      answers[i].drawButton();
    
      // Draw the answer text in the box
      answers[i].drawText();
    }
  }
}

//////////////////////////////
//      Question class      //
//////////////////////////////
class Question{
  private int num1;
  private int num2;
  private int operator;
  private int answer;
  private String questionString;
  
  // For use in building questionString
  private final char[] operators = {'+', '-', '*', '/'};
  
  // Constructor
  public void Question(){
    
  }
  
  // Used by drawQuestion to build a question to display to the
  // user and set fields we'll need later such as the answer
  private void createQuestion(){
    // Create the two random numbers
    num1 = int(random(limits[0], limits[1]));
    num2 = int(random(limits[0], limits[1]));
    
    // Select a random operator (multiplication and division aren't used)
    int opSelect = int(random(0, 2));
    
    switch(opSelect){
      case 0:
        answer = num1 + num2;
        break;
      case 1:
        answer = num1 - num2;
        break;
      case 2: // Unused
        answer = num1 * num2;
        break;
      case 3: // Unused
        answer = num1 / num2;
        break;
    }
    // Build the question string we want to display to the user
    questionString = num1 + " " + operators[opSelect] + " " + num2 + " = ?";
  }
  
  // Create and display the question string to the user
  public void drawQuestion(){
    createQuestion();
    fill(0);
    textSize(30);
    text(questionString, 175, 300);
  }
  
  // Used for returning the correct answer to the random question
  public int getAnswer(){
    return answer;
  }
  
  // Use the mouse coordinates stored by the mouseclicked event handler
  // and the known coordinates of the answer boxes to find which answer
  // the user actually clicked on, returns -1 if no box was clicked.
  public int getAnswerChoice(){
    // For simplicity
    float x = mouseCoordsOnClick[0];
    float y = mouseCoordsOnClick[1];
    
    if((y>=475) && (y<=550)){ // Check if mouse is on the right level (y-coordinates)
      if((x>=40) && (x<=165)){ // Leftmost box
        //print("First answer\n");
        return 0;
      }
      else if((x>=240) && (x<=365)){ // Middle box
        //print("Second answer\n");
        return 1;
      }
      else if((x>=440) && (x<=565)){ // Rightmost box
        //print("Third answer\n");
        return 2;
      }
      else{
        return -1;
      }
    }
    else{
      return -1;
    }
  }
  
  // Check if the user's answer pick was the correct one
  public void checkAnswer(){
    int choice = getAnswerChoice();
    // A return value of -1 indicates that the user
    // did not click within any of the answer boxes
    if(choice==-1){
      print("Not a button\n");
      return;
    }
    else if(answers[choice].isCorrect()==true){
      print("Correct answer\n");
      cars.speedUp();
    }
    else if(answers[0].isCorrect()==false){
      print("Wrong answer\n");
      cars.slowDown();
    }
    // Set the flag to start a new question
    newQuestion = true;
  }
}


//////////////////////////////
//       Answer class       //
//////////////////////////////
class Answer{
  // X-coordinate of the box to draw
  private int xCoord;
  // Value of the answer to display
  private int value = 0;
  // Whether this answer box is the 'correct' one
  private boolean correct = false;
  
  // Constructor
  public void Answer(){
      
  }
  
  // Draw the box in which the answer text sits
  public void drawButton(){
    fill(0);
    rect(xCoord, 475, 125, 75);
  }
  
  // Draw the text onto the box
  public void drawText(){
    fill(255);
    text(value, xCoord+35, 525);
  }
  
  // Mutator for the x-coordinate
  public void setXCoord(int newXCoord){
    xCoord = newXCoord;
  }
  
  // Mutator for the answer value
  public void setValue(int newValue){
    value = newValue;
  }
  
  // Accessor for the answer value
  public int getValue(){
    return value;
  }
  
  // Mutator for the 'correct answer box' boolean
  public void setCorrect(boolean isCorrect){
    correct = isCorrect;
  }
  
  // Accessor for the 'correct answer box' boolean
  public boolean isCorrect(){
    return correct; 
  }
}

//////////////////////////////
//        Cars Class        //
//////////////////////////////
class Cars{
  float car1speed;
  float car2speed;
  float x1;
  float x2;
  boolean value;
  boolean correct;
  boolean win;
  
  //Initialise Variables
  public Cars(){
    x1 = 0;
    x2 = 0;
  }
  
  public void drawCars(){
    //Draw two cars
    fill(#FF0000);
    rect(x1, 120, 50, 20);
    fill(#03FF04);
    rect(x2, 180, 50, 20);
  }

  public void moveCars(){
    x1 += 0.4;
    x2 += 0.25;
  }
    
  public void speedUp(){
    x2 += 15;
  }
  
  public void slowDown(){
    x2 -= 25;
  }
  
  public void checkWin(){
    if(x1>=550){
      gameWon=1;
    }
    else if(x2>=550){
      gameWon=2;
    }
  }
}
////////////////////////////////
//  Mouseclick event handler  //
////////////////////////////////
void mouseClicked(){
  // Store the mouse's current coordinates
  // for use in another method
  if(gameStarted==true){
    mouseCoordsOnClick[0] = mouseX;
    mouseCoordsOnClick[1] = mouseY;
    question.checkAnswer();
  }
  else{
    if(mouseX>200 && mouseX<400 && mouseY>200 && mouseY<300){
      gameStarted = true;
    }
  }
}


