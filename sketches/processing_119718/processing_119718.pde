
int Score = 0; //adds a gamelike element and is a score
Boolean Pause = true; // pauses the game inbetween inputs
String [] Question; //array contains questions
int [] Answers; //array contains answers
int i=0; //contolls the array read order
int A=2; //a variable to check the question and the answer with
int QA= 3; //question answer variable gives a neutral value for answers to start with
  
//declares score variable
  
void setup() {
  size(600, 600);
   
    
Question = new String [10];
Question[0] = "int is a whole number?";
Question[1] = "A boolean outputs\nA true/false answer?";
Question[2] = "A quad is made up\nOf 4 X or Y values?";
Question[3] = "An array uses\nRound brackets?";
Question[4] = "For and While are\nKinds of functions?";
Question[5] = "A function prototype is\nDeclared at the top of\nthe code?";
Question[6] = "Fill(255) will produce\nthe colour black?";
Question[7] = "If you attatch electrodes\nTo your users it is\nunethical?";
Question[8] = "Rect is a 3d object?";
Question[9] = "i++ advances a\ncounter?";
//an array of questions that are outputed as text from the string
  
Answers = new int [10];
Answers[0] = QA = 1;
Answers[1] = QA = 1;
Answers[2] = QA = 0;
Answers[3] = QA = 0;
Answers[4] = QA = 0;
Answers[5] = QA = 1;
Answers[6] = QA = 0;
Answers[7] = QA = 1;
Answers[8] = QA = 0;
Answers[9] = QA = 1;
//an array of answers 1 being true and 0 being false
  
  
}// sets up background and initialises objects
  
void draw() {
    
    
  {
  background(0, 0, 0);//Creates background
    
 PFont font;
 font = loadFont("ArialBold.vlw");
 textFont(font, 32); 
 fill(0, 0, 0);
 noStroke();
 rect(100,100,400,200);
 fill(255);
 text(Question[i],125,150);
 textSize(25);
 }//generates question and box
      
 {
 fill(255, 255, 255);
 rect(100,400,150,50, 60);
 rect(350,400,150,50, 60);
 }//generates button boxes with rounded edges
    
 {
 PFont font;
 font = loadFont("ArialBold.vlw");
 textFont(font, 32);
 fill(0);
 text("True",139,435,50);
 text("False",385,435,200);
 }//generates text for the buttons
  
 {
 fill(0);
 stroke(255);
 rect(30, 13, 55, 55);
 }// Generates rectangle around score
  
  fill(255) ;
  text(Score,50,50);// is the score counter
  
  if(i > 9 && Score > 7 ){
    background(0);
    fill(255);
    PFont font;
    font = loadFont("ArialBold.vlw");
    textFont(font, 32);
    text("Congratulations you scored:",100,150);
    textSize(200);
    text(Score,285,300);
    textAlign(CENTER, CENTER);
    }
    
    if(i > 9 && Score < 7 ){
    background(0);
    fill(255);
    PFont font;
    font = loadFont("ArialBold.vlw");
    textFont(font, 32);
    text("Better Luck Next Time,\nYou scored:",100,150);
    textSize(200);
    text(Score,150,400);
    textAlign(CENTER, CENTER);
    //Creates alternative ending depending on final score.   
    
    mousePressed() ;
    if (mousePressed == true) {
    exit() ;
    }
  }//quiz endscreen when the array is empty
   
   
  
  
}//end of void draw
  
void mousePressed(){ //allows user input and only runs the code when the user answers
  if (mousePressed == true){
    if(pmouseX >99 && pmouseX <251 && pmouseY >399 && pmouseY <451){
     A=Answers[i];
      }
     }//makes true button clickable and have a value
   else
     
   if (mousePressed == false){
    if(pmouseX >349 && pmouseX <501&& pmouseY >399 && pmouseY <451){
    A=Answers[i];
     }
    }//makes the false button clickable and have an value
     
  
    if(A == QA){
          i++;
          Score++;
        }//gives score if answer is correct
      else
    if(A != QA){
        i++;
        Score--;
      }//takes away score if answer is wrong
  
}
//Group 1
//created by Lewis,Keiran,Dominic and Terry.
//Lewis contributed the majority of the code.
//Keiran came up with the idea, implimented the code and tested the code.
//Terry helped impliment the code and troubleshoot.
//Dominic helped design the layout and troubleshoot.
