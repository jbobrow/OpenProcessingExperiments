
/* using apache libray because nothing else seem to work on javascript, originally used processing table command, but it didnt work to javascript, 
switched to 6 string files that work in array, but you cannot remove items from them and that was needed to ensure questions are random, 
so converting them to arraylist or a list, sounded like good idea, but after using every possible way to convert using list and collection classes
just to find that all of them doesnt work in java script too, as last resort to check if its really not possible to remove string form string array, 
i found it was possible using apache library ( getting those to work was another challenge )*/
// scratch all that, program launches but remove string from string array method doesnt work. Result no question changes
// commenting out string removal from array , restores functionality, but questions might repeat because they arent removed after being used once
// user input is broken , 
import org.apache.commons.lang3.ArrayUtils;
//custom font
PFont quizy;
int currentcolor;
// declaring class variables 
Button button1, button2, button3, button4;
// game state booleans
boolean locked=false;
boolean start;
boolean alive;
boolean victory;
boolean inputError;
boolean enter;
boolean defaultMaximum;
boolean defaultMinimum;
// variables to keep track or randoms lives and scores and number of questions 
int r;
int lives;
int score; 
int numberOfQuestions;
int inputQuestionsNumber;
int questionsUsed;
// input  string
String typedText;
// originally used Table , but that doesnt work in javascript, so using somewhat ineficient 6 file system instead of one
String questions[];
String answers1[];
String answers2[];
String answers3[];
String answers4[];
String correctAnswers[];



public void setup()
{
  // setting screen size, as we are not limted to 600 x 600 for this program/game
  size(900, 700);
  // creating custom font
  quizy=createFont("Calibri", 15);
  textFont(quizy);
  // loading strings from files
  questions=loadStrings("questions.txt");
  answers1=loadStrings("answers1.txt");
  answers2=loadStrings("answers2.txt");
  answers3=loadStrings("answers3.txt");
  answers4=loadStrings("answers4.txt");
  correctAnswers=loadStrings("correctAnswers.txt");
  // getting number of questions
  numberOfQuestions=questions.length;
  // assigning as default, just as safeguard
  inputQuestionsNumber=numberOfQuestions;
  // creating and defining buttons via button class
  int baseColor=color(102);
  currentcolor=baseColor;
  int  buttoncolor=color(54, 98, 44);
  int  highlight=color(224, 165, 0);
  button1=new Button( 300, 350, 125, buttoncolor, highlight);
  button2=new Button( 500, 350, 125, buttoncolor, highlight);
  button3=new Button( 300, 500, 125, buttoncolor, highlight);
  button4=new Button( 500, 500, 125, buttoncolor, highlight);
  // generating random number for program startup, to call random questions
  r=int(random(questions.length));
  // game state variables/conditions
  lives =3;
  score=0;
  alive=true;
  victory=false;
  start=false;
  inputError=false;
  enter=false;
  defaultMaximum=false;
  defaultMinimum=false;
  //resetting number of questions used
  questionsUsed=0;
  typedText="";
  // early debuging
  //println("there are " + questions.getRowCount()+ " lines");
}
void draw()
{
  if (start)
  {
    if (alive)
    {
      // checks if ammount of queston selected is equal to questions asked
      if (inputQuestionsNumber==questionsUsed)
      {
        victory=true;
      }
      // if game isnt won draws and initializes buttons and answers 
      if (!victory)
      {

        background(27, 31, 54);
        update2(mouseX, mouseY);
        stroke (255);  
        button1.display();
        button2.display();
        button3.display();
        button4.display();
        fill (255);
        //displays score and lives 
        textSize(35);
        text ("Processing Quiz Game",300,50);
        text ("Lives left:"+lives, 50, 50);
        text ("Score :  "+ score, 750, 50);
        // display text(questions on the screen )
        textSize(25);
        text (questions[r], 300, 200,400,200);
        textSize(18);
        // takes one row and 4 colums of answers and display them as four different objects, uses random vallues from correct/incorrect methods
        text (answers1[r], 305, 360, 120, 120);
        text (answers2[r], 505, 360, 120, 120);
        text (answers3[r], 305, 510, 120, 120);
        text (answers4[r], 505, 510, 120, 120);
        //calls button method and supplies mouse position

        // checks for remaining lives, if its equal to zero game ends
        if (lives==0)
        {
          alive=false;
        }
      }

      // if game is won, background change and text display
      else 
      {
        textSize(25);
        background(27, 31, 54);
        text("You won,your score is "+score +" out of "+ inputQuestionsNumber+" press Enter to restart.", 200, 350);
        inputError=false;
      }
    }
    // if game is lost background change and text display
    else 
    {
      textSize(25);
      background(27, 31, 54);
      text("You lost! Press ENTER to restart.", 300, 350);
      inputError=false;
    }
  }
  // if game havent started, initial background and text 
  else 
  {  
    textSize(25);
    background(27, 31, 54);
    // message asking user for input, and methods to obtain it
    text("Type number of questions to use: "+typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 250, 300);
    text("There are "+numberOfQuestions+" questions in total. ", 280, 680);
    text("PRESS ENTER To set number of questions and SPACE TO START", 120, 600);
    //  check if user input is valid and within the limit of available questions
    if (inputError || inputQuestionsNumber>numberOfQuestions)
    {
      // error message
      textSize(25);
      text("Bad input: Number is too big or bad type of input.Please try again. ", 120, 200);
      text("Setting number of Questions to default maximum.", 180, 450);
    }
    // if defaultMaximum is triggered during input
    if (defaultMaximum)
    {
      textSize(25);
      text("Number is too big, setting number of Questions to default maximum.", 100, 350);
    }
    // if defaultMnimum is triggered during input , more comments on input section below
    if (defaultMinimum)
    {
      textSize(25);
      text("Number is too small, setting number of Questions to default minimum.", 100, 350);
      // defaultMaximum=false;
    }
    if (enter)
    {
      textSize(25);
      text("Number of question set to " +inputQuestionsNumber, 300, 400);
    }
  }
  // press space to start 
  if (keyCode==' ')
  {
    start=true;
  }
}
// workforce and logic behind quiz game
void mouseReleased()
{
  // checks if first button was clicked and then checks if answers table first column is equal to correct answer table first column (there is only one column)
  // updated to use only one file/table
  if (button1.clicked() && answers1[r].equals(correctAnswers[r]))
  { 
    // if correct  execute correct answer method ( below )
    correct();
  }
  // does same as first if, but check if its incorect instead of correct
  else if (button1.clicked()&& !answers1[r].equals(correctAnswers[r]))
  {
    // if incorrect executes incorrect method (below)
    incorrect();
  }
  // same as above, just differnt button number is assigned to different answers column, this time second column , 
  if (button2.clicked() && answers2[r].equals(correctAnswers[r]))
  {
    correct();
  }
  else  if (button2.clicked()&& !answers2[r].equals(correctAnswers[r]))
  {
    incorrect();
  }
  // third button, third column check for answers
  if (button3.clicked() && answers3[r].equals(correctAnswers[r]))
  {
    correct();
  }
  else   if (button3.clicked()&& !answers3[r].equals(correctAnswers[r]))
  {
    incorrect();
  }
  // fourth button, fourth column in answers table
  if (button4.clicked() && answers4[r].equals(correctAnswers[r]))
  {
    correct();
  }
  else  if (button4.clicked()&& !answers4[r].equals(correctAnswers[r]))
  { 
    incorrect();
  }
}
// keybinds for game restarts 
void keyReleased()
{
  // restarts the game during the game for testing purpose
  /* if ((keyCode==ENTER) && start)
   {   
   setup();
   draw();
   }*/
  // 
  // restarts the game if game was won or lost
  if (keyCode==ENTER && victory||keyCode==ENTER && !alive )
  {
    setup();
    draw();
  }
  // combined into one, moved default states into setup 
  // restarts the game if game was lost
  /* if (keyCode==ENTER && !alive)
   {
   alive=true;
   setup();
   }*/

  // user text input to select number of questions
  // reference used http://wiki.processing.org/w/Typed_input as a base, end result is heavily modified to meet program needs
  if (key != CODED) {
    switch(key) {
      // method to delete input using backspace
    case BACKSPACE:
      typedText = typedText.substring(0, max(0, typedText.length()-1));
      break;
    case ENTER:
      try 
      {
        // converting string to integer
        inputQuestionsNumber = Integer.parseInt(typedText);
        enter=true;
        //inputError=false;
        // safety checks to prevet numbers that are higher than number of questions in total, set number of question to maximum
        if (inputQuestionsNumber>numberOfQuestions )
        {
          inputQuestionsNumber=numberOfQuestions;
          // triggers statement in draw method
          defaultMaximum=true;
        }
        // safety check to prevent numberthat are less than 1, sets number of questions to 1
        if ( inputQuestionsNumber<1)
        {
          inputQuestionsNumber=1;
          // triggers statement in draw method
          defaultMinimum=true;
        }
      } 
      // catching error if unable to convert string to integer
      catch (NumberFormatException e) 
      {
        // changing boolean value, which is used in main draw body
        inputError=true;
      }
    case RETURN:
    case ESC:
    case DELETE:
      break;
    default:
      // adds typed in input to string
      typedText += key;
    }
  }
}
// correct answer method
void correct()
{
  // counts score
  score=score+1;
  // removes a row rom each table, so same question wont be asked second time, and can be called randomly instead of being called in row ( not much of a quiz then )
  // old comments  around above and round
  // doesnt work as intended in javascrip
/*  questions = ArrayUtils.removeElement(questions, r);
  answers1 = ArrayUtils.removeElement(answers1, r);
  answers2 = ArrayUtils.removeElement(answers2, r);
  answers3 = ArrayUtils.removeElement(answers3, r);
  answers4 = ArrayUtils.removeElement(answers4, r);
  correctAnswers = ArrayUtils.removeElement(correctAnswers, r);*/
  questionsUsed=questionsUsed+1;
  // no longer used
  // answers.removeRow(r);
  //correctAnswers.removeRow(r);
  // new random values for questions and asnwers.getString commands in main draw methods , displays newrandom question after buttong was clicked
   r=int(random(questions.length));
  // debugging, found out that tempquestions=questions= same object  and not actually needed, oh well!
  //println("there are " + tempQuestions.getRowCount()+ " lines");
}
// incorect answer method
void incorrect()
{ 
  // removes one live on incorrect answer
  lives=lives-1;
  // same as above, removes question that was asked so it cannot be asked again
  // doesnt work as intended in javascrip
 /* questions = ArrayUtils.removeElement(questions, r);
  answers1 = ArrayUtils.removeElement(answers1, r);
  answers2 = ArrayUtils.removeElement(answers2, r);
  answers3 = ArrayUtils.removeElement(answers3, r);
  answers4 = ArrayUtils.removeElement(answers4, r);
  correctAnswers = ArrayUtils.removeElement(correctAnswers, r);*/
 // questions.removeRow(r);
  questionsUsed=questionsUsed+1;
  // no longer used
  // answers.removeRow(r);
  //correctAnswers.removeRow(r);
  // suplies random number to draw method
   r=int(random(questions.length));
  //debugging
  // println("there are " + tempQuestions.getRowCount()+ " lines");
} 

//  http://processingjs.org/learning/topic/buttons/ used for reference
void update2(int x, int y)
{
  // check for locked states  if it matches, updates the buttons
 if(locked == false) 
  {
    button1.update();
    button2.update();
    button3.update();
    button4.update();
  } 
 else 
  {
    // sets locked to false so buttons can be updated
    locked=false;
  }
}
// button class 
class Button
{
  // button class variables
  int x, y;
  int size;
  color basecolor,highlight;
  color currentcolor;
  // state variables
  boolean over=false;
  boolean clicked=false;
  
  Button (int x,int y,int size, color basecolor, color highlight)
  {
    //assigning parameters to fields
    this.x=x;
    this.y=y;
    this.size=size;
    this.basecolor=basecolor;
    this.highlight=highlight;
    currentcolor=basecolor; 
  }
  // display methodf or buttons
  void display()
  {
    stroke(255);
    fill(currentcolor);
    rect(x, y, size, size);
  }
  // changes color of the button
  void update() 
  {
    // when mouse is over button
    if( overButton(x, y, size, size) ) 
    {
      currentcolor = highlight;
    } 
    // when mouse is away from button
    else 
    {
      currentcolor = basecolor;
    }
  } 
  
  boolean clicked()
  {
    // uses information from overButton method, and changes locked state
    if(over) 
    {
      locked = true;
      return true;
    } 
    else 
    {
      locked = false;
      return false;
    }    
  }
  // method used to check mouse position
  boolean overButton(int x, int y, int width, int height) 
  {
    // mouse possition check, if it matches button dimensions, returns true
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
       over = true;
       return true;     
    } 
    // false if mouse isnt over buttons
    else {
      over = false;
      return false;
    }
  }
}




