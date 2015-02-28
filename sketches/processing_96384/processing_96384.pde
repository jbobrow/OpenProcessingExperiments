
//Chris Pro Midterm
//Tic Tac Toe
//Mouse click on a space to go and press any key to reset the board



//Declare Classes
GameBoard game;
Buttons button;


void setup() {
  //window setup and game board
  size(300, 300);
  background(255);
game = new GameBoard();
button = new Buttons();
game.reset();
}

void draw() {
  if (mousePressed) {
    //1st button (space 1,0)
    button.buttonOne();

    //2nd button (space 1,2)
    button.buttonTwo();

    //3rd button (space 1,3)
    button.buttonThree();

    //4th button (space 2,1)
     button.buttonFour();

    //5th button (space 2,2)
    button.buttonFive();

    //6th button (space 2,3)
    button.buttonSix();

    //7th button (space 3,1)
     button.buttonSeven(); 

    //8th button (space 3,2)
     button.buttonEight();  

    //9th button (space 3,3)
     button.buttonNine();
  }

  //Pressing any key will reset the game board
  if (keyPressed) {
    game.reset();
  }
}

class Buttons{
//Data Variables
int xOne;
int xTwo;
int xThree;
int yOne;
int yTwo;
int yThree;




//Initialize data variables
Buttons(){
xOne = 100;
xTwo = 200;
xThree = 300;
yOne = 100;
yTwo = 200;
yThree = 300;
}

//Functions for buttons (9 total)
void buttonOne(){
    if (mouseX > 0 && mouseX < xOne && mouseY > 0 && mouseY < yOne) {
      ellipseMode(CORNER);
      ellipse(0, 0, 100, 100);
}}

void buttonTwo(){
  if (mouseX > xOne && mouseX < xTwo && mouseY > 0 && mouseY < yOne) {
      line(100, 0, 200, 100);
      line(100, 100, 200, 0);
    }} 
    
void buttonThree(){
  if (mouseX > xTwo && mouseX < xThree && mouseY > 0 && mouseY < yOne) {
      ellipseMode(CORNER);
      ellipse(200, 0, 100, 100);
    }} 
    
void buttonFour(){
  if (mouseX > 0 && mouseX < xOne && mouseY > yOne && mouseY < yTwo) {
      line(0, 100, 100, 200);
      line(100, 100, 0, 200);
    }} 
    
void buttonFive(){  
if (mouseX > xOne && mouseX < xTwo && mouseY > yOne && mouseY < yTwo) {
      ellipseMode(CORNER);
      ellipse(100, 100, 100, 100);
    }}
    
void buttonSix(){
  if (mouseX > xTwo && mouseX < xThree && mouseY > yOne && mouseY < yTwo) {
      line(200, 100, 300, 200);
      line(200, 200, 300, 100);
    }}
    
void buttonSeven(){
  if (mouseX > 0 && mouseX < xOne && mouseY > yTwo && mouseY < yThree) { 
      ellipseMode(CORNER);
      ellipse(0, 200, 100, 100);
    }}
    
void buttonEight(){
   if (mouseX > xOne && mouseX < xTwo && mouseY > yTwo && mouseY < yThree) {
      line(100, 200, 200, 300);
      line(200, 200, 100, 300);
    }}
    
void buttonNine(){
   if (mouseX > xTwo && mouseX < xThree && mouseY > yTwo && mouseY < yThree) { 
      ellipseMode(CORNER);
      ellipse(200, 200, 100, 100);
    }}
    
  }

class GameBoard{
//Data Variables
int rectH;
int rectW;

  //Initialize data variables
GameBoard(){
rectH = 100;
rectW = 100; 
}
 
  //Functions for a blank game board
  void reset(){
  rect(0, 0, rectW, rectH);
  rect(0, 100, rectW, rectH);
  rect(0, 200, rectW, rectH);
  rect(100, 0, rectW, rectH);
  rect(100, 100, rectW, rectH);
  rect(100, 200, rectW, rectH);
  rect(200, 0, rectW, rectH);
  rect(200, 100, rectW, rectH);
  rect(200, 200, rectW, rectH); 
  }
  
  
  
  
}


