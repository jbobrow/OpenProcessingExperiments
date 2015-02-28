
//Initialise variables

//Score counter
int score_counter=0;


//Counter to show number of questions asked
int number_questions=0;
PImage flag_img[] = new PImage [40]; // creates an array of 40 images

//Text for right or wrong answer
String displaytext = "Empty";

//Countdown timer at 40 seconds
int timer = 40;
int timer_counter = 0;

//Correct and wrong position/country
int correct_position, wrong_position = 0, correct_random_country = (int)random(39), random_country  = (int)random(39), selected = 0;

//Boolean to show whether start and end screens can be displayed
boolean startScreen = true;
boolean endScreen = false;

//Boolean to stop program cycling through flags
boolean run = true;

void setup () 
{
  frameRate = 30;
backgroundStuff();
  fill(0);
  size(600, 600);
  for (int i = 0; i<=39; i++) //Loads flags to the array 
  {
    flag_img[i] = loadImage(String.valueOf(i)+".png");
  }
}


void draw ()
{

if (startScreen == true)  //Displays the Starting Screen
{
  startGame();
}

else if ((startScreen == false) && (endScreen == false))  //Displays the main game and the timer counter
{
  

  mainGame();
  timerCounter();
}

else if (endScreen == true) //Displays the end screen
{
  endGame();
}


}

void mainGame() //Method which has the components for the functionality of the game and display aspects.
{
  String flag_names[] = loadStrings("flagnames.txt"); //Loads the names of countries into a parallel countries string array using the txt file in the data folder
  correct_position = (((correct_random_country % 2)*300)+100); //Puts either 100 or 400 position
  if (correct_position == 100 ) //Gives positions to countries and makes sure they aren't on the same side
  {
    wrong_position = 450;
  }
  else if (correct_position  == 400) 
  {
    wrong_position = 50;
  }

  if (run) 
  {
    backgroundStuff(); 
    mainGameScreen(); 
    image(flag_img[correct_random_country], 165, 150);  //display correct country name
    textSize(16);
    text(flag_names[correct_random_country], correct_position, 400); //display correct country flag
    text(flag_names[random_country], wrong_position, 400); //display false country flag
    checkMouse(); // Checks for mouse input
  }
  if (keyPressed)
  {
    run = true;
  }
  
  
  
  if (timer == 0) //When the timer counts down, this displays the end screen
  {
    endScreen = true;
  }
}

void checkMouse() //Takes imput from mouse and returns to DisplayResult that it's either correct or not. Also after a mouse press, create new random variables for the display of countries
{
  if (mousePressed)
  {
    if (mouseButton == LEFT) //checks where correct position is and returns appropriate answer 1 being correct and 2 false
    {
      if (correct_position == 100) 
      {
        selected = 1;
      }
      else 
      {
        selected = 2;
      }
      correct_random_country = (int)random(39);
      random_country = (int)random(39);
      displayResult();
      run = false; //Stops the annoying thing where every click you might get 3 or 4 images scrolling through because of how fast the draw function is called
    }
    if (mouseButton == RIGHT) //checks where correct position is and returns appropriate answer 1 being correct and 2 being false
    {
      if (correct_position == 400) 
      {
        selected = 1;
      }
      else 
      {
        selected = 2;
      }
      correct_random_country = (int)random(39);
      random_country = (int)random(39);
      displayResult();
      run = false; //Stops the annoying thing where every click you might get 3 or 4 images scrolling through because of how fast the draw function is called
    }
  }
}

void displayResult () //After mouse, displays appropriate text
{
  if (selected == 1) 
  {
    strokeWeight(2);
    fill(70,240,19);
    rect(245,380,65,25);
    fill(8,30,230);
    displaytext = "Correct"; //If the answer is correct, it add one on to the score counter
    score_counter++;
  }
  else if (selected == 2)
  {
    strokeWeight(2);
    fill(240,19,23);
    rect(245,380,55,25);
    fill(8,30,230);
    displaytext = "False";
  }

  text(displaytext, 250, 400);
  displaytext = ""; //Sets it back to the default value
  number_questions++;
}

void backgroundStuff() // sets background and creates primitive shapes and text for aesthetic purposes
{
 // sets background to color gradient
  int y1=0;
  int c1=12;
  int c2=237;
  int c3=247;
  for (int i=0;i<600;i++) {
    stroke(c1, c2, c3);
    line(0, y1, 600, y1);
    y1=y1+1;
    c1++;
    //c2++;
    c3--;
     };
    colorMode(RGB, 255);
    fill(8, 30, 230);
}

void mainGameScreen()
{
    // creates text and lines on screen
    textSize(32) ;
    text("FLEG FINDER", 200, 50);  
    stroke(0);
    strokeWeight(4);
    line(0, 80, 600, 80);
    line(0, 540, 600, 540);
    textSize(10);
    text("Copyright Bhais Industries 2013", 10, 570);
    textSize(16);
    text("Score: "+score_counter,500,100);// displays score with use of counter variable
}



void timerCounter() //The method for the timer
{ 
  delay(10); 
  timer_counter++; 
  if (timer_counter == 10)
 { //This delay makes the timer in seconds
  timer--;
  timer_counter = 0;
 }
  text(timer, 50, 50);
}

void startGame() //Method which displays the start screen and the functionality for it
{
    backgroundStuff();
    textSize(64);
    text("FLEG FINDER", 100, 200);

    String controlInstructions = "Left click to select left option, right click to select right option Press any key to move to next fleg once answered";
    String howToPlay = "Guess which fleg belongs to which country - be warned, there's a timer!";
    
    textSize(18);
    text("How to Play", 400, 270);
    text("Controls", 50, 270);
    textSize(14);
    text(controlInstructions, 50, 300, 150, 150);  // Text wraps within text box
    text(howToPlay, 400, 300, 150, 150);
    
    textSize(28);
    text("Click to start", 200, 450);
    
    if (mousePressed)
    {
     
      startScreen = false;
      delay(500);
    }
}

void endGame() //The method for displaying the end screen
{
      backgroundStuff();
      textSize(64);
      text("GAME OVER", 100, 200);
      textSize(24);
      text("You scored " + score_counter + " out of a possible " + number_questions, 110, 300);
}

