
//Mira A | Eight Ball | CP1 | Mods 16/17

//"answer" holds what mode the program is in (either question or
//answer mode).
boolean answer = false;
//"replies" holds the set of available answers the ball uses to
//"reply" to questions. There are a total of sixteen available
//answers. Replies one to five are positive, "yes", answers. 
//Replies six to ten are negative, "no", answers. Replies eleven
//to fifteen are neutral, "unsure" or "try again" answers. The 
//final answer is miscellaneous.
String[] replies = {
  "INDEED", 
  "OF COURSE", 
  "WHY NOT", 
  "OUTLOOK\nGOOD", 
  "PROBABLY", 
  "NOPE", 
  "SORRY, NO", 
  "SURELY\nNOT", 
  "DOUBTFUL", 
  "IT IS NOT\nTO BE", 
  "PERHAPS", 
  "TRY AGAIN", 
  "UNSURE", 
  "I CAN'T\nSAY", 
  "WHO\nKNOWS", 
  "PLEASE\nSTOP"
};
//"number" will hold a random number used to determine the answer
//shown onscreen.
int number;

void setup()
{
  //Self explanatory.
  size (500, 500);
  noLoop();
  smooth();
  noStroke();
  textAlign(CENTER);
}

void draw()
{
  //This is the black rectangle at the top of the screen.
  background(255);
  fill(0);
  rect(0, 0, 500, 50);
  //This is the larger shadow of the eight ball.
  fill(160, 167, 180);
  ellipse(250, 375, 275, 150);
  //This is the smaller shadow of the eight ball.
  fill(56, 57, 59);
  ellipse(250, 345, 175, 130);
  //This is the black part of the eight ball.
  fill(0);
  ellipse(250, 250, 300, 300);
  //If "answer" is true, then a reply is displayed. This will,
  //from now on, be called 'answer' mode.
  if (answer == true)
  {
    //This is the dark blue circle signifying the viewing window.
    fill(12, 19, 33);
    ellipse(250, 225, 200, 195);
    //This is the triangular "dice" displaying an answer.
    fill(46, 59, 85);
    triangle(165, 185, 338, 185, 250, 320);
    //This pertains to the text displayed on the eight ball.
    fill(255);
    textSize(20);
    //This randomly generates a number from 0 to but not including
    //16. It is used to choose the replies drawn to screen 
    //every time the eight ball returns to 'answer' mode, as seen
    //in the line of code below it.
    number = int(random(16));
    text (replies[number], 250, 225);
    //This pertains to the message displayed at the top of the 
    //screen, indicating how to change the mode of the program.
    textSize(17);
    fill(255);
    text ("Click here again to return to the previous screen.", 250, 30);
  }
  //If "answer" is false, the program will prompt the user to ask
  //a question, and indicate how to receive a reply. This will,
  //from now on, be called 'question' mode.
  else
  {
    //This is the white circle containing the "8" of the eight
    //ball.
    fill(255);
    ellipse(250, 225, 150, 145);
    //This pertains to the "8" printed within the aforementioned
    //white circle.
    fill(0);
    textSize(100);
    text("8", 250, 255);
    //This pertains to the message displayed at the top of the 
    //screen, indicating how to switch to "answer" mode.
    textSize(17);
    fill(255);
    text ("Ask a 'yes or no' question. Click here\nto receive your answer.", 250, 15);
  }
}

//If the mouse is pressed in a certain area of the screen, the 
//mode of the program will switch from "question" to "answer" or
//vice versa.
void mousePressed()
{
  if (mouseY < 50)
  {
    answer =! answer;
    redraw();
  }
}
