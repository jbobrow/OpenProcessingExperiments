
//Hangman code  5D
//Beginning code:
/* having a problem changing the one "10hang.png" to an arrray. I have to write an arry into this program that will sequentially select an hangman image number 00hang.png thru 10hang.png.
I gather the input would be something like
String[] imageHang = {"00hang.png", "01hang.png","02hang.png", "03hang.png", "04hang.png","05hang.png", "06hang.png", "07hang.png", "08hang.png", "09hang.png",  "10hang.png" };

then by the section

//display hangman imgae - convert this to array
hangman= loadImage(imageHang);
image(hangman, 350,25);

I need to get the program to find how many wrong asnwers there are (from i ) and print the appropriate image of the hangman on the screen.
*/


PImage hangman;
String imageHang = "10hang.png";
PFont myFont;
int numRight=0; //add  global variables
int numWrong=0;  //add  global variables
int winner=0; //stores length of answer


// declare array of words
String[] game= 
{ 
  "JAVA", "JAVASOFT", "PYTHON", "RUBY", "COBOL"
};
//JAVA in position 0, PYTHON in position 1, etc
int answerKey =0; //will hold the index for the game array
String answer =""; //"" (no space between ""'s
//will hold answer from game in [answerKey};
char guessed[]; //an array to hold guessed letters
char wrong[]; //array to hold wrong letters

//variable to store display string
String display = "Please type the letter you wish to guess: ";
String display2 = "Press enter when you are done!";
String display3 = "";
String wrongAnswers =""; //will display incorrect guesses
// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String guess = "";

void setup() 
{
  size(600, 600);
  myFont = createFont("Verdana", 16, true);
  answerKey = int(random(0, game.length));
  answer= game[answerKey];
  winner = answer.length();
  //breakdown into character array
  char[]gameChar=new char[answer.length()]; //.length is a string function
   guessed = new char[answer.length()];
  for (int i=0; i<answer.length (); i++)
  {
    gameChar[i] = answer.charAt(i);
    guessed[i]= '_';
    //    prntln(i, gameChar[i]);
  }
  //set up array to hold wromg letters
  wrong=new char[11]; //hold wrong letters
     for(int i=0; i< 11 ;  i++)
  {
    wrong[i]='*'; //initalize all of array to ""
  }
}



void draw() 
{
  background(225);
  wrongAnswers = "Guessed letters; ";
  int indent = 25;
  display3 = ""; //under void draw to reinitialize the display
  
  //refresh wrong answers
  for (int i=0; i<11; i++)
  {
   wrongAnswers = wrongAnswers + " " + wrong[i];
  }
 //display hangman imgae - convert this to array
hangman= loadImage(imageHang);
image(hangman, 350,25);
/// this is the text section
  textFont(myFont);  // Set the font and fill for text
  fill(0);
  for (int i=0; i<guessed.length; i++)
  {
    display3 = display3 + " " + guessed[i];
    //fills display with a _ for ach letter, replaced when guess (correctly?)
  }

    //display ------------------
    //text(game, answerKey], indent, 200); // REMOVED???
    text(display3, indent, 200);
    text(display, indent, 400);
    text(display2, indent, 430);
    text(typing, indent, 490);  //rest to null space
    text(wrongAnswers, indent, 550);
    guess = typing;

    if (guess.length() > 1)
    {
      display = "Please type only one letter!";
      typing = "";
    }
  }

void keyPressed()
  {
    // If the return key is pressed, save the String and clear it
    if (key == '\n' ) 
    {
      play(typing);// A String can be cleared by setting it equal to ""
      typing = "";
    } else 
    {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key;
    }
  }
  void play(String guess)
  {
    boolean guessedRight = false;   
    guess=guess.toUpperCase();
//    println(guess);
    char myGuess=guess.charAt(0);
    for (int c=0; c<answer.length (); c++)
    {
//      println(myGuess==answer.charAt(c)
        if (myGuess==answer.charAt(c))
      {
        guessed[c]=myGuess;
        numRight += 1;
        guessedRight = true;
          
        if (numRight== winner)
        {
        
            display="YOU WIN!";
            display2="";
          }
        }
      }
      //println(guessdRight);
      if (guessedRight == false)
      {
      
      //println(wrong[numWrong], numWrong, myGuess);
      wrong[numWrong] = myGuess;
      numWrong+=1;
      if (numWrong == 11)
      {
        display = "YOU LOSE!";
        display2 = "";
      }
    }
  }

