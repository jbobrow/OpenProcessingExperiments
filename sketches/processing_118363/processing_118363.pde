
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
Question[1] = "a boolean outputs\n a true/false answer?";
Question[2] = "a quad is made up\n of 4 X or Y values?";
Question[3] = "an array uses\n round brackets?";
Question[4] = "For and While are\n kinds of functions?";
Question[5] = "a function prototype is\n decalared at the top of\n the code?";
Question[6] = "fill(255) will produce the colour black?";
Question[7] = "if you attatch electrodes\n to your users it is\n unethical?";
Question[8] = "rect is a 3d object?";
Question[9] = "i++ advances a counter?";
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
  background(80, 240, 150);
  
 fill(80, 205, 240);
 rect(100,100,400,200);
 fill(0);
 text(Question[i],125,150);
 textSize(25);
 }//generates question and box
  
  
  
 {
 fill(80, 205, 240);
 rect(100,400,150,50);
 rect(350,400,150,50);
 }//generates button boxes
  
 {
 fill(0);
 text("True",145,430,50);
 text("False",395,430,200);
 }//generates text for the buttons

  text(Score,50,50);// is the score counter

  if(i > 9 ){
    background(0);
    fill(255);
    text(Score,250,200);
    text("Congratulations your score is",100,150);
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
//created by Lewis,Kieran,Domninic and Terry
//Lewis contributed the majority of the code
//Keiran came up with the idea and helped to impliment the code
//Terry helped impliment the code and troubleshoot
//Dominic helped design the layout and troubleshoot
